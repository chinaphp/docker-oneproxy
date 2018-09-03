#!/bin/bash
#
export ONEPROXY_HOME=/data/oneproxy
ulimit -c unlimited

# valgrind --leak-check=full \
  # ${ONEPROXY_HOME}/bin/oneproxy --defaults-file=${ONEPROXY_HOME}/conf/proxy.conf

  /data/oneproxy/bin/oneproxy --defaults-file=/data/oneproxy/conf/proxy.conf && bash
