FROM centos:centos6
LABEL maintainer "Coffee <chinaphper@qq.com>"

RUN curl -O http://www.onexsoft.com/software/oneproxy-rhel6-linux64-v6.2.0-ga.tar.gz \
    && tar zxf oneproxy-rhel6-linux64-v6.2.0-ga.tar.gz -C /usr/local

ADD run.sh /usr/local/oneproxy/run.sh
RUN chmod +x /usr/local/oneproxy/run.sh

EXPOSE 3306

CMD ["/usr/local/oneproxy/run.sh"]