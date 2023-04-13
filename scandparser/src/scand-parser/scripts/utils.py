import rosbag
import sensor_msgs.point_cloud2 as pc2
from sensor_msgs.msg import PointCloud2
import numpy as np
import cv2
from termcolor import cprint

# BEV LiDAR image handler class
class BEVLidarImage:
    def __init__(self, x_range=(-20, 20),
                 y_range=(-20, 20),
                 z_range=(-1, 5),
                 resolution=0.05,
                 threshold_z_range=False):
        self.x_range = x_range
        self.y_range = y_range
        self.z_range = z_range
        self.resolution = resolution
        self.dx = x_range[1]/resolution
        self.dy = y_range[1]/resolution
        self.img_size = int(1 + (x_range[1] - x_range[0]) / resolution)
        self.threshold_z_range = threshold_z_range
        cprint('created the bev image handler class', 'green', attrs=['bold'])

    def get_bev_lidar_img(self, lidar_points):
        img = np.zeros((self.img_size, self.img_size))
        for point in lidar_points:
            if self.not_in_range_check(point[0], point[1], point[2]): continue
            ix = (self.dx + int(point[0] / self.resolution))
            iy = (self.dy - int(point[1] / self.resolution))
            z = point[2]
            if self.threshold_z_range:
                img[int(round(iy)), int(round(ix))] = 1 if z >= self.z_range[0] else 0
            else:
                img[int(round(iy)), int(round(ix))] = (z-self.z_range[0])/(self.z_range[1]-self.z_range[0])
        return img


    def not_in_range_check(self, x, y, z):
        if x < self.x_range[0] \
                or x > self.x_range[1] \
                or y < self.y_range[0] \
                or y > self.y_range[1] \
                or z < self.z_range[0] \
                or z > self.z_range[1]: return True
        return False

#!/usr/bin/env python

import rosbag
import numpy as np
import cv2
from termcolor import cprint

# Define the BEV Lidar class
class ScanImage:
    def __init__(self, x_range=(-20, 20),
                 y_range=(-20, 20),
                 z_range=(-1, 5),
                 resolution=0.05,
                 threshold_z_range=False):
        self.x_range = x_range
        self.y_range = y_range
        self.z_range = z_range
        self.resolution = resolution
        self.dx = x_range[1]/resolution
        self.dy = y_range[1]/resolution
        self.img_size = int(1 + (x_range[1] - x_range[0]) / resolution)
        self.threshold_z_range = threshold_z_range
        cprint('created the bev image handler class', 'green', attrs=['bold'])

    def get_scan_img(self, lidar_ranges, lidar_angles):
        img = np.zeros((self.img_size, self.img_size))
        for r, theta in zip(lidar_ranges, lidar_angles):
            if self.not_in_range_check(r, theta): continue
            x = r * np.cos(theta)
            y = r * np.sin(theta)
            ix = (self.dx + int(x / self.resolution))
            iy = (self.dy - int(y / self.resolution))
            if self.threshold_z_range:
                img[int(round(iy)), int(round(ix))] = 1 if self.z_range[0] <= 0 else 0
            else:
                img[int(round(iy)), int(round(ix))] = -self.z_range[0]/self.z_range[1]
        return img

    def not_in_range_check(self, r, theta):
        if r < self.z_range[0] \
                or r > self.z_range[1] \
                or theta < np.arctan2(self.y_range[0], self.x_range[1]) \
                or theta > np.arctan2(self.y_range[1], self.x_range[1]): return True
        return False


# 
# # Loop through the '/scan' topic messages in the ROS bag file
# for topic, msg, t in bag.read_messages(topics=['/scan']):
#     # Extract the lidar ranges and angles from the message
#     lidar_ranges = np.array(msg.ranges)
#     lidar_angles = np.arange(len(lidar_ranges))*msg.angle_increment + msg.angle_min
#
#     # Generate the BEV image
#     bev_img = bev_lidar.get_bev_lidar_img(lidar_ranges, lidar_angles)
#
#     # Show the BEV image
#     cv2.imshow('BEV LiDAR Image', bev_img)
#     cv2.waitKey(1)
#
# # Close the ROS bag file
# bag.close()
