FROM ros:humble

COPY ./build.sh /fanuc-ws/build.sh
RUN apt update \
    && apt install git-lfs -y \
    && git lfs install

RUN mkdir -p /fanuc-ws/src \
    && cd /fanuc-ws/src \
    && git clone https://github.com/FANUC-CORPORATION/fanuc_description \
    && git clone --recurse-submodules https://github.com/FANUC-CORPORATION/fanuc_driver

RUN cd /fanuc-ws \
    && rosdep update \
    && rosdep install --from-paths src --ignore-src -r -y

RUN /bin/bash -c "source /opt/ros/humble/setup.bash \
    && colcon build --symlink-install --cmake-args -DBUILD_TESTING=1 -DBUILD_EXAMPLES=1 \
    && echo \"source /opt/ros/\$ROS_DISTRO/setup.bash\" >> ~/.bashrc \
    && echo \"source /fanuc-ws/install/setup.bash\" >> ~/.bashrc"
