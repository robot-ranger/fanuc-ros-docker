#!/bin/bash
source /opt/ros/humble/setup.bash
cd /fanuc-ws
echo "Installing dependencies"
rosdep update
pwd
rosdep install --ignore-src --from-paths src -y

echo "Building FANUC libraries"
colcon build --symlink-install --cmake-args -DBUILD_TESTING=1 -DBUILD_EXAMPLES=1