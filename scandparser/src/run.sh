# #!/bin/bash
#
# # Set the path to the directory containing the rosbag files
# rosbag_dir=${1:-"/path/to/rosbag/directory"}
#
# # Loop through all rosbag files in the directory
# for rosbag_file in "$rosbag_dir"/*.bag; do
#   echo "Processing $rosbag_file..."
#
#   # Run the roslaunch file with the current rosbag file
#   roslaunch  scand-parser parser.launch rosbag_path:="$rosbag_file"
# done
#!/bin/bash

# Set the path to the directory containing the rosbag files
rosbag_dir=${1:-"/path/to/rosbag/directory"}

# Set the path to the directory to save the output files
save_dir=${2:-"/path/to/save/directory"}

# Loop through all rosbag files in the directory
for rosbag_file in "$rosbag_dir"/*.bag; do
  echo "Processing $rosbag_file..."

  # Run the roslaunch file with the current rosbag file and save path
  roslaunch  scand-parser parser.launch rosbag_path:="$rosbag_file" save_data_path:="$save_dir"
done
