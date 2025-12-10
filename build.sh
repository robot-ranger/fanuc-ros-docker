#!/bin/bash

echo "Building FANUC libraries"
# Source ROS setup before building
source /opt/ros/$ROS_DISTRO/setup.bash
colcon build --symlink-install --cmake-args -DBUILD_TESTING=1 -DBUILD_EXAMPLES=1
echo "source /opt/ros/$ROS_DISTRO/setup.bash" >> ~/.bashrc
echo "source /fanuc-ws/install/setup.bash" >> ~/.bashrc
