#!/usr/bin/env python3
import os
import yaml
import rosbag
import subprocess
import rospy
import pickle
import math
import numpy as np
import message_filters
from scipy.spatial.transform import Rotation as R
from sensor_msgs.msg import LaserScan, Joy, PointCloud2
from nav_msgs.msg import Odometry, Path
from geometry_msgs.msg import Twist, PoseStamped
from utils import BEVLidarImage
from tf.transformations import euler_from_quaternion
import rosbag
import sensor_msgs.point_cloud2 as pc2
from sensor_msgs.msg import PointCloud2
import numpy as np
import cv2
from termcolor import cprint
from PIL import Image

#
class BagParser:
    def __init__(self, rosbag_path,config_path,save_path):

        #self.config = yaml.safe_load(open(config_path, 'r'))


        self.start_time = None
        self.rosbag_path=rosbag_path
        self.config_path=config_path

        self.rosbag_name = os.path.basename(rosbag_path)
        rosbag_dir = f"{save_path}/{self.rosbag_name}"

        self.image_dir = f"{rosbag_dir}/BevLidarImage"
        self.pickle_dir = f"{rosbag_dir}/pickle_file"
        if not os.path.exists(rosbag_dir):
            os.makedirs(rosbag_dir)

        if not os.path.exists(self.image_dir):
            os.makedirs(self.image_dir)
        if not os.path.exists(self.pickle_dir):
            os.makedirs(self.pickle_dir)


        self.data = {'lidar': {}, 'odom': {}, 'joystick': {}, }


        # initialize variables to store messages

        self.sync_data = {'odom': {}, 'joystick': {}, 'lidar': {}, 'odom_future_global': {},
                          'joystick_future_global': {}, 'odom_future_local': {}, 'joystick_future_local': {},
                          'move_base_path': {},'move_base_cmd_vel':{}}
    def parse(self):

            self.config = yaml.safe_load(open(self.config_path, 'r'))

            bag = rosbag.Bag(self.rosbag_path)
            for topic, msg, t in bag.read_messages(topics=['/velodyne_points']):
                self.data['lidar'][msg.header.seq] = msg
            for topic, msg, t in bag.read_messages(topics=['/joystick']):
                self.data['joystick'][msg.header.seq] = msg
            for topic, msg, t in bag.read_messages(topics=['/odom']):
                self.data['odom'][msg.header.seq] = msg
            bag.close()



            # synchronize messages using TimeSynchronizer
            ts = message_filters.ApproximateTimeSynchronizer([message_filters.Subscriber('/velodyne_points', PointCloud2),
                                                              message_filters.Subscriber('/joystick', Joy),
                                                              message_filters.Subscriber('/odom', Odometry)], 100, 0.05,
                                                             allow_headerless=True)
            ts.registerCallback(self.callback)

            self.move_base_pub = rospy.Publisher('/move_base_simple/goal', PoseStamped, queue_size=1)
            self.move_base_path = None
            self.path_sub = rospy.Subscriber(
                '/move_base/TrajectoryPlannerROS/global_plan', Path, self.path_callback)
            self.last_cmd_vel_callback, self.last_cmd_vel_callback_path = None, None
            self.cmd_vel_sub = rospy.Subscriber(
                    '/cmd_vel', Twist, self.cmd_vel_callback)


    def callback(self, lidar_msg, joy_msg, odom_msg):

        self.odom_future_global = []
        self.odom_future_local = []

        if self.start_time is None:
            self.start_time = lidar_msg.header.stamp.to_sec()
        current_time = lidar_msg.header.stamp.to_sec()

        joy_axes = joy_msg.axes
        linear_x = self.joystickValue(
            joy_axes[4], -1.6)
        linear_y = self.joystickValue(
            joy_axes[3], -1.6)
        angular_z = self.joystickValue(
            joy_axes[0], -np.deg2rad(90.0), kDeadZone=0.0)

        # append current messages to synchronized dictionary
        self.sync_data['lidar'][odom_msg.header.seq] = lidar_msg
        self.sync_data['joystick'][odom_msg.header.seq] = [linear_x, linear_y, angular_z]
        self.sync_data['odom'][odom_msg.header.seq] = odom_msg

        # get current position
        x = odom_msg.pose.pose.position.x
        y = odom_msg.pose.pose.position.y

        # get future positions_global
        self.index_key1=None
        self.index_key2=None
        for i in range(odom_msg.header.seq, list(self.data['odom'].keys())[-1]):

            odom_k = self.data['odom'][i]

            dist = np.linalg.norm(np.array([odom_msg.pose.pose.position.x, odom_msg.pose.pose.position.y]) -
                                  np.array([odom_k.pose.pose.position.x, odom_k.pose.pose.position.y]))
            self.odom_future_global.append(self.data['odom'][i])
            keys = list(self.data['odom'].keys())
            self.index_key1 = keys.index(self.odom_future_global[0].header.seq)
            self.index_key2 = keys.index(self.odom_future_global[-1].header.seq)
            if dist > 10.0:
                keys = list(self.data['odom'].keys())
                self.index_key1 = keys.index(self.odom_future_global[0].header.seq)
                self.index_key2 = keys.index(self.odom_future_global[-1].header.seq)

                break

        self.sync_data['odom_future_global'][odom_msg.header.seq] = self.odom_msg_list_to_list(self.odom_future_global)
        self.sync_data['joystick_future_global'][odom_msg.header.seq] = self.joystick_msg_list_to_list(self.index_key1,
                                                                                                       self.index_key2,
                                                                                                       self.data)
        # Generateing  and playing bev lidar images
        lidar_points = list(pc2.read_points(self.sync_data['lidar'][odom_msg.header.seq], skip_nans=True))
        self.bev_lidar= BEVLidarImage(x_range=(-self.config['LIDAR_RANGE_METERS'], self.config['LIDAR_RANGE_METERS']),
                                         y_range=(-self.config['LIDAR_RANGE_METERS'],
                                                  self.config['LIDAR_RANGE_METERS']),
                                         z_range=(-self.config['LIDAR_HEIGHT_METERS'],
                                                  self.config['LIDAR_HEIGHT_METERS']),
                                         resolution=self.config['RESOLUTION'], threshold_z_range=False)
        self.bev_img = self.bev_lidar.get_bev_lidar_img(lidar_points)
        filename = f"{self.image_dir}/{odom_msg.header.seq}.jpeg"

    #    cv2.imwrite(filename, self.bev_img)
        img = (self.bev_img * 255 / np.max(self.bev_img)).astype(np.uint8) # scale and convert to uint8
        img = Image.fromarray(img).convert('RGB')

        img.save(filename)


        # Show the BEV image
        cv2.imshow('BEV Lidar Image', self.bev_img)
        cv2.waitKey(1)

        # get future positions_local
        for i in range(odom_msg.header.seq, min(odom_msg.header.seq + 50, list(self.data['odom'].keys())[-1])):
            odom_k = self.data['odom'][i]

            dist = np.linalg.norm(np.array([odom_msg.pose.pose.position.x, odom_msg.pose.pose.position.y]) -
                                  np.array([odom_k.pose.pose.position.x, odom_k.pose.pose.position.y]))
            self.odom_future_local.append(self.data['odom'][i])

        keys = list(self.data['odom'].keys())
        self.index_key1_local = keys.index(self.odom_future_local[0].header.seq)
        self.index_key2_local = keys.index(self.odom_future_local[-1].header.seq)

        self.sync_data['odom_future_local'][odom_msg.header.seq] = self.odom_msg_list_to_list(self.odom_future_local)
        self.sync_data['joystick_future_local'][odom_msg.header.seq] = self.joystick_msg_list_to_list(self.index_key1_local,
                                                                                                      self.index_key2_local,
                                                                                                      self.data)


        self.move_base_pub.publish(self.convert_odom_to_posestamped_goal(self.odom_future_global[-1]))

        if self.move_base_path is not None   and (self.move_base_path_time - current_time) < 0.5:
            move_base_path = self.move_base_path_to_list(self.move_base_path)
            self.sync_data['move_base_path'][odom_msg.header.seq] = move_base_path
        else:
            self.sync_data['move_base_path'][odom_msg.header.seq] = None

        if self.last_cmd_vel_callback_path is not None:

            self.sync_data['move_base_cmd_vel'][odom_msg.header.seq]=[self.last_cmd_vel_callback.linear.x,self.last_cmd_vel_callback.linear.y,self.last_cmd_vel_callback.angular.z]
        else:
            self.sync_data['move_base_cmd_vel'][odom_msg.header.seq]=[None, None, None]

    @staticmethod
    def convert_odom_to_posestamped_goal(odom):
        goal = PoseStamped()
        goal.header.frame_id = 'odom'
        goal.header.stamp = rospy.Time.now()
        orie = [odom.pose.pose.orientation.x, odom.pose.pose.orientation.y,
                odom.pose.pose.orientation.z, odom.pose.pose.orientation.w]
        orie = R.from_quat(orie).as_euler('xyz', degrees=True)[2]
        orie = R.from_euler('xyz', [0, 0, orie], degrees=True).as_quat()
        goal.pose.position = odom.pose.pose.position
        goal.pose.position.z = 0.0
        goal.pose.orientation.x, goal.pose.orientation.y, goal.pose.orientation.z, goal.pose.orientation.w = orie
        return goal

    def cmd_vel_callback(self, msg):
        self.last_cmd_vel_callback = msg
    def move_base_callback(self, goal):



        goal = PoseStamped()
        goal.header.frame_id = "map"
        goal.header.stamp = rospy.Time.now()
        # get the future position of the odom and set the goal orientation
        goal.pose.position.x = goal.pose.pose.position.x
        goal.pose.position.y = goal.pose.pose.position.y
        goal.pose.position.z = goal.pose.pose.position.z

        # get the future orientation of the odom and set the goal orientation
        orientation = goal.pose.pose.orientation
        goal.pose.orientation.x = orientation.x
        goal.pose.orientation.y = orientation.y
        goal.pose.orientation.z = orientation.z
        goal.pose.orientation.w = orientation.w

        # publish the goal
        self.move_base_pub.publish(goal)

    def path_callback(self, msg):
        #  bag_parser.data['move_base_path'][8216]=None
        """
        Callback for the global path
        """
        #self.move_base_path = 'test'
        if self.start_time is not None:
            self.move_base_path = msg
            self.last_cmd_vel_callback_path = self.last_cmd_vel_callback
            self.move_base_path_time = msg.header.stamp.to_sec() - self.start_time

    @staticmethod
    def move_base_path_to_list(move_base_path):
        move_base_path_list = []
        for goal in move_base_path.poses:
            move_base_path_list.append([goal.pose.position.x, goal.pose.position.y, [goal.pose.orientation.x,
                                                                                     goal.pose.orientation.y,
                                                                                     goal.pose.orientation.z,
                                                                                     goal.pose.orientation.w]])
        return move_base_path_list

    #
    @staticmethod
    def joystick_msg_list_to_list(joysticks_index1, joysticks_index2, data):
        future_joystick_data = []
        for i in range(joysticks_index1, joysticks_index2 + 1):
            key = list(data['joystick'].keys())[i]
            value = data['joystick'][key]
            future_joy_axes = value.axes
            future_linear_x = BagParser.joystickValue(
                future_joy_axes[4], -1.6)
            future_linear_y = BagParser.joystickValue(
                future_joy_axes[3], -1.6)
            future_angular_z = BagParser.joystickValue(
                future_joy_axes[0], -np.deg2rad(90.0), kDeadZone=0.0)
            future_joystick_data.append(
                [future_linear_x, future_linear_y, future_angular_z])
        return future_joystick_data

    @staticmethod
    def joystickValue(x, scale, kDeadZone=0.02):
        if kDeadZone != 0.0 and abs(x) < kDeadZone:
            return 0.0
        return ((x - np.sign(x) * kDeadZone) / (1.0 - kDeadZone) * scale)

    @staticmethod
    def odom_msg_list_to_list(odoms):
        tmp = []
        for odom in odoms:
            tmp.append([odom.pose.pose.position.x, odom.pose.pose.position.y,
                        [odom.pose.pose.orientation.x, odom.pose.pose.orientation.y,
                         odom.pose.pose.orientation.z, odom.pose.pose.orientation.w]])
        return tmp

    def save_data(self):
        with open(f"{self.pickle_dir}/{self.rosbag_name}.pkl", "wb") as file:

            my_dict_copy = self.sync_data.copy()
            del my_dict_copy['lidar']

            # dump the object into the file
            pickle.dump(my_dict_copy, file)


if __name__ == '__main__':
    # initialize nodes
    rospy.init_node('node_parser', anonymous=True)

    rosbag_path = rospy.get_param('rosbag_path')
    robot_name = rospy.get_param('robot_name')
    save_path = rospy.get_param('save_data_path')

    if not os.path.exists(save_path):
        os.makedirs(save_path)
    # read the rosbag file
    bag = rosbag.Bag(rosbag_path)

    # find root of the ros node and config file path
    package_root = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    config_file_path = os.path.join(
        package_root, 'config/'+str(robot_name)+'.yaml')


    info_dict = yaml.safe_load(bag._get_yaml_info())
    duration = info_dict['end'] - info_dict['start']
    play_duration = str(int(math.floor(duration) - 6))
    print('play duration: {}'.format(play_duration))
    bag.close()


    rosbag_play_process = subprocess.Popen(
        ['rosbag', 'play', rosbag_path, '-r', '1.0', '--clock', '-u', play_duration])

    bag_parser = BagParser(rosbag_path,config_file_path,save_path)
    bag_parser.parse()
    while not rospy.is_shutdown():
        # check if the python process is still running
        if rosbag_play_process.poll() is not None:
            print('rosbag process has stopped')
            bag_parser.save_data()

            exit(0)
