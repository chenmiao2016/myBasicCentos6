FROM centos:6.6
MAINTAINER chen_miao 510473319@qq.com
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
RUN mkdir -p /etc/yum.repos.d/bak; \
  mv /etc/yum.repos.d/CentOS-* /etc/yum.repos.d/bak;
COPY Centos-6.repo /etc/yum.repos.d
COPY epel-6.repo /etc/yum.repos.d
COPY rc.local /etc/rc.d/rc.local
ENTRYPOINT ["/bin/sh","-c","/etc/rc.d/rc.local;/bin/bash"]

RUN chmod +x /etc/rc.d/rc.local; \
  rm -rf /var/lib/yum/history/*.sqlite;rm /var/lib/rpm/__db* -rf;rpm --rebuilddb;yum clean all; \
  yum install -y \
  openssh-server \
  openssh-clients \
  wget \
  rsync \
  expect \
  tar \
  which \
  zip \
  unzip \
  curl \
  git \
  curl \
  java-1.8.0-openjdk-devel; \
  ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime; \
  sed -i -e "s/#Port 22/Port 22/g" -e "s/#GSSAPIAuthentication no/GSSAPIAuthentication no/g" -e "s/GSSAPIAuthentication yes/#GSSAPIAuthentication yes/g" -e "s/#UseDNS yes/UseDNS no/g" /etc/ssh/sshd_config; \
  sed -i -e "s/GSSAPIAuthentication yes/GSSAPIAuthentication no/g" /etc/ssh/ssh_config; \
  sed -i "s/1024/unlimited/g" /etc/security/limits.d/90-nproc.conf; \
  rm -rf /etc/rc.d/rc3.d/*; \
  rm -rf /var/lib/yum/history/*.sqlite;rm /var/lib/rpm/__db* -rf;rpm --rebuilddb;yum clean all;