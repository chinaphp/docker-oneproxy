# TAGS 7.4.1708
FROM project42/s6-centos:latest

LABEL maintainer "Coffee <chinaphper@qq.com>"


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
    && mkdir -p /data 
 #   && curl -O http://www.onexsoft.com/software/oneproxy-rhel6-linux64-v6.2.0-ga.tar.gz \
 #   && tar zxf oneproxy-rhel6-linux64-v6.2.0-ga.tar.gz -C /data \
 #   && sed -i 's|#/bin/bash|#!/bin/bash|g' /data/oneproxy/demo.sh \
 #   && chmod +x /data/oneproxy/demo.sh

# RUN wget https://github.com/just-containers/s6-overlay/releases/download/${S6_OVERLAY_VERSION}/s6-overlay-amd64.tar.gz -O /tmp/s6-overlay-amd64.tar.gz \
#     && tar xzf /tmp/s6-overlay-amd64.tar.gz -C / --exclude="./bin" \
#     && tar xzf /tmp/s6-overlay-amd64.tar.gz -C /usr ./bin \
#     && rm -f /tmp/s6-overlay-amd64.tar.gz

# COPY rootfs /

ADD rootfs/etc/services.d/oneproxy etc/services.d/oneproxy
ADD oneproxy /data/oneproxy

#ADD proxy.conf /data/oneproxy/conf/proxy.conf

WORKDIR /data/oneproxy

EXPOSE 3306
EXPOSE 8080

ENTRYPOINT [ "/init" ]
