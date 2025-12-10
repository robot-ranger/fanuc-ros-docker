FROM ros:humble

COPY ./build.sh /fanuc-ws/build.sh
RUN chmod u+x /fanuc-ws/build.sh \
    && apt update \
    && apt install git-lfs -y \
    && git lfs install

RUN mkdir -p /fanuc-ws/src \
    && cd /fanuc-ws/src \
    && git clone https://github.com/FANUC-CORPORATION/fanuc_description \
    && git clone --recurse-submodules https://github.com/FANUC-CORPORATION/fanuc_driver

RUN cd /fanuc-ws \
    && rosdep update \
    && rosdep install --from-paths src --ignore-src -r -y

RUN /fanuc-ws/build.sh
