FROM ubuntu:16.04
MAINTAINER sora <ppyyr@live.jp>
 
ENV DEBIAN_FRONTEND="noninteractive"
RUN apt-get update && \
    apt-get -y install expect software-properties-common && \
    add-apt-repository ppa:ubuntu-toolchain-r/test && \
    add-apt-repository ppa:openjdk-r/ppa && \
    apt-get update && \
    apt-get -y install openssh-server vim openjdk-8-jdk git git-core gnupg flex bison unzip tree \
    gperf build-essential zip curl zlib1g-dev libc6-dev lib32ncurses5-dev lib32z1 lib32ncurses5 \
    gcc-multilib x11proto-core-dev libx11-dev lib32z-dev libgl1-mesa-dev libxml2-dev \
    g++-multilib tofrodos python-markdown libxml2-utils xsltproc libssl-dev libxml-parser-perl \
    phablet-tools u-boot-tools libgmp3-dev gawk procmail autotools-dev m4 autoconf2.13  autoconf-archive \
    gnu-standards autoconf-doc libtool realpath dos2unix python bc python-crypto \
    libxslt-dev libxslt1-dev libncurses5 libncurses5-dev dpkg-dev libsdl1.2-dev libesd0-dev libreadline6-dev \
    libffi-dev python-mysqldb device-tree-compiler libc++-dev \
    python3-click-package gcc-4.8 gcc-4.8-multilib screen indent lftp lvm2 git-email automake \
    enca elinks sshfs bonnie doxygen gzip joe libmpfr-dev libmpc-dev libcloog-ppl-dev \
    linux-headers-generic u-boot-tools lzop pkg-config python-setuptools && mkdir -p /var/run/sshd && sudo easy_install pip && \
    pip install launchpadlib && pip install --upgrade setuptools && pip install --upgrade pip && \
    pip install -U pyopenssl && sudo easy_install cryptography==2.2.2 && \
    pip uninstall click && ln -s /usr/lib32/libstdc++.so.6 /usr/lib32/libstdc++.so && \
    ln -s /usr/lib/x86_64-linux-gnu/crt*.o /usr/lib/ && ln -s /lib/x86_64-linux-gnu/libz.so.1 /usr/lib/libz.so && \
    ln -fs /usr/bin/gcc-4.8 /usr/bin/gcc && \
    echo "dash dash/sh boolean false" | debconf-set-selections && \
    echo root:s | chpasswd && \
    sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    DEBIAN_FRONTEND=noninteractive dpkg-reconfigure dash

ADD run.sh /run.sh
RUN chmod 755 /run.sh
ENV USER=root
EXPOSE 22
CMD ["/run.sh"]
