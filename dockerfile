FROM ros:humble

COPY ./ /fanuc-ws
RUN ls -la /fanuc-ws
RUN apt update \
    && chmod +x /fanuc-ws/build.sh \
    && cd /fanuc-ws \
    && /bin/bash -c "source /opt/ros/humble/setup.bash && /fanuc-ws/build.sh"

# RUN chmod +x /build.sh && /build.sh