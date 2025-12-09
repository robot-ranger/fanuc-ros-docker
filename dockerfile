FROM ros:humble

COPY ./ /fanuc-ws
RUN ls -la /fanuc-ws/src
RUN apt update \
    && chmod +x /fanuc-ws/build.sh \
    && /fanuc-ws/build.sh

# RUN chmod +x /build.sh && /build.sh