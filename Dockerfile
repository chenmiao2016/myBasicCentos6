FROM scratch
MAINTAINER chen_miao 510473319@qq.com
ADD centos-6.6-20150304_1234-docker.tar.xz /
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
RUN mkdir -p /etc/yum.repos.d/bak; \
  mv /etc/yum.repos.d/CentOS-* /etc/yum.repos.d/bak;
COPY Centos-6.repo /etc/yum.repos.d/bak
COPY epel-6.repo /etc/yum.repos.d/bak
COPY CentOS-Local6.repo /etc/yum.repos.d
COPY rc.local /etc/rc.d/rc.local
ENTRYPOINT ["/bin/sh","-c","/etc/rc.d/rc.local;/bin/bash"]

RUN chmod +x /etc/rc.d/rc.local; \
  rm -rf /var/lib/yum/history/*.sqlite;rm /var/lib/rpm/__db* -rf;rpm --rebuilddb;yum clean all; \
  ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime; \  
  rm -rf /etc/rc.d/rc3.d/*; 
