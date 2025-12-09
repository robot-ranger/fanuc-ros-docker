#!/bin/bash
echo "Installing and configuring git-lfs"
sudo apt install git-lfs
git lfs install

echo "Creating workspace"
mkdir -p /fanuc-ws/src
cd /fanuc-ws/src
git clone https://github.com/FANUC-CORPORATION/fanuc_description
git clone --recurse-submodules https://github.com/FANUC-CORPORATION/fanuc_driver
cd /fanuc-ws
echo "Installing dependencies"
rosdep update
rosdep install --ignore-src --from-paths src -y

echo "Building FANUC libraries"
# Source ROS setup before building
source /opt/ros/$ROS_DISTRO/setup.bash
colcon build --symlink-install --cmake-args -DBUILD_TESTING=1 -DBUILD_EXAMPLES=1
echo "source /opt/ros/$ROS_DISTRO/setup.bash" >> ~/.bashrc
echo "source /fanuc-ws/install/setup.bash" >> ~/.bashrc
