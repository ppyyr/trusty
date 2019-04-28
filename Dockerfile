FROM ubuntu:14.04
MAINTAINER sora <ppyyr@live.jp>
 
# Set to 32bit
#RUN dpkg --add-architecture i386
#ADD sources.list /etc/apt/sources.list
 
RUN apt-get update && \
    apt-get -y install expect software-properties-common && \
    add-apt-repository ppa:ubuntu-toolchain-r/test && \
    add-apt-repository ppa:openjdk-r/ppa && \
    apt-get update && \
    apt-get -y install gcc-4.9 g++-4.9 cpp-4.9 openjdk-8-jdk git git-core gnupg flex bison \
    gperf build-essential zip curl zlib1g-dev libc6-dev lib32ncurses5-dev lib32z1 lib32ncurses5 \
    lib32bz2-1.0 x11proto-core-dev libx11-dev lib32readline-gplv2-dev lib32z-dev libgl1-mesa-dev \
    g++-multilib mingw32 tofrodos python-markdown libxml2-utils xsltproc libssl-dev libxml-parser-perl \
    phablet-tools u-boot-tools libgmp3-dev gawk procmail autotools-dev m4 autoconf2.13  autoconf-archive \
    gnu-standards autoconf-doc libtool libgmp3-dev realpath bc dos2unix python bc python-crypto \
    linux-headers-generic u-boot-tools lzop pkg-config && \
    ln -sf /bin/bash /bin/sh

ENV USER=root
