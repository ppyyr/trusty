FROM ubuntu:14.04
MAINTAINER sora <ppyyr@live.jp>
 
# Set to 32bit
#RUN dpkg --add-architecture i386
#ADD sources.list /etc/apt/sources.list
 
RUN apt-get update \
    && apt-get install -y openjdk-7-jdk python bc python-crypto linux-headers-generic u-boot-tools lzop \
    && apt-get install -y git-core gnupg flex bison gperf build-essential zip curl zlib1g-dev \
    gcc-multilib g++-multilib libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev \
    libx11-dev lib32z-dev libgl1-mesa-dev libxml2-utils xsltproc unzip

ENV USER=root
