FROM ros:humble

COPY ./build.sh /fanuc-ws/build.sh
RUN apt update \
    && chmod +x /fanuc-ws/build.sh \
    && /fanuc-ws/build.sh

# RUN chmod +x /build.sh && /build.sh