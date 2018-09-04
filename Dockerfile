# TAGS 6.2.0
FROM project42/s6-centos:latest

LABEL maintainer "Coffee <chinaphper@qq.com>"
ENV TZ 'Asia/Shanghai'
ENV DB1 192.168.31.246:3306

RUN set -ex \ 
    && yum install -y initscripts \
                    #  git \
                    #   iproute \
                    #   iptraf \
                    #   lsof \
                    #   net-tools \
                    #   nmap \
                    #   tcpdump \
                    #   traceroute \
                    #   unzip \
                    #   vim \
                      wget \
                    #   xz \
    && yum clean all \
    && rm -rf /var/cache/yum \
    && mkdir -p /data \
   && curl -O http://www.onexsoft.com/software/oneproxy-rhel6-linux64-v6.2.0-ga.tar.gz \
   && tar zxf oneproxy-rhel6-linux64-v6.2.0-ga.tar.gz -C /data 
  #  && sed -i "s|proxy-master-addresses.2   = db2:3306@default|proxy-master-addresses.2   = $DB1@default|g" /data/oneproxy/conf/proxy.conf
  #  && sed -i 's|#/bin/bash|#!/bin/bash|g' /data/oneproxy/demo.sh \
  #  && chmod +x /data/oneproxy/demo.sh

ADD rootfs/etc/services.d/oneproxy etc/services.d/oneproxy

#COPY proxy.conf /data/oneproxy/conf/proxy.conf

# VOLUME [ "/data/oneproxy/conf/proxy.conf" ]

WORKDIR /data/oneproxy

ENV PROXYUSERLIST=default:test/1378F6CC3A8E8A43CA388193FBED5405982FBBD3@test

EXPOSE 3306
EXPOSE 8080

ENTRYPOINT [ "/init" ]
