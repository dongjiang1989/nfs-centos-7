FROM centos:centos7

ENV container=docker

RUN rpmkeys --import file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7 && \
    yum -y --setopt=tsflags=nodocs install nfs-utils && \
    mkdir -p /exports && \
    yum clean all
    
RUN yum -y install httpd; yum clean all; systemctl enable httpd.service

EXPOSE 80
CMD ["/usr/sbin/init"]
