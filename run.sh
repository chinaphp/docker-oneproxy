#/bin/bash
#
export ONEPROXY_HOME=/usr/local/oneproxy
ulimit -c unlimited

# valgrind --leak-check=full \
  ${ONEPROXY_HOME}/bin/oneproxy --defaults-file=${ONEPROXY_HOME}/conf/proxy.conf