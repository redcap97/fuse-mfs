FROM ubuntu
MAINTAINER Akira Midorikawa <redcap97@gmail.com>
ADD build /
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y git build-essential pkg-config fuse libfuse-dev
ENTRYPOINT /build
