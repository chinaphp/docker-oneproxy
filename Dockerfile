FROM centos:centos6
LABEL maintainer "Coffee <chinaphper@qq.com>"

RUN yum update -y
RUN yum install -y initscripts \
    && mkdir -p /data \
    && curl -O http://www.onexsoft.com/software/oneproxy-rhel6-linux64-v6.2.0-ga.tar.gz \
    && tar zxf oneproxy-rhel6-linux64-v6.2.0-ga.tar.gz -C /data

ADD proxy.conf /data/oneproxy/conf/proxy.conf
RUN chmod +x /data/oneproxy/demo.sh

EXPOSE 3306

ENTRYPOINT [ "/data/oneproxy/demo.sh" ]
CMD [ "bash" ]