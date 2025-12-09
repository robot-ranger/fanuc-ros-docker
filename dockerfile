FROM ros:humble

WORKDIR /fanuc-ws
COPY ./ .
RUN ls -la
RUN apt update \
    && chmod +x build.sh \
    && ./build.sh

# RUN chmod +x /build.sh && /build.sh