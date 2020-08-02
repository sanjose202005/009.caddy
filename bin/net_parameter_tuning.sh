#!/bin/bash

# https://github.com/klzgrad/naiveproxy/wiki/Parameter-Tuning
sysctl -w net.ipv4.tcp_congestion_control=bbr                    &> /dev/null
sysctl -w net.ipv4.tcp_slow_start_after_idle=0                   &> /dev/null
# max open files
sysctl -w fs.file-max=51200                                      &> /dev/null
# max read buffer
sysctl -w net.core.rmem_max=67108864                             &> /dev/null
# max write buffer
sysctl -w net.core.wmem_max=67108864                             &> /dev/null
# default read buffer
sysctl -w net.core.rmem_default=65536                            &> /dev/null
# default write buffer
sysctl -w net.core.wmem_default=65536                            &> /dev/null
# max processor input queue
sysctl -w net.core.netdev_max_backlog=4096                       &> /dev/null
# max backlog
sysctl -w net.core.somaxconn=4096                                &> /dev/null
# resist SYN flood attacks
sysctl -w net.ipv4.tcp_syncookies=1                              &> /dev/null
# reuse timewait sockets when safe
sysctl -w net.ipv4.tcp_tw_reuse=1                                &> /dev/null
# turn off fast timewait sockets recycling
sysctl -w net.ipv4.tcp_tw_recycle=0                              &> /dev/null
# short FIN timeout
sysctl -w net.ipv4.tcp_fin_timeout=30                            &> /dev/null
# short keepalive time
sysctl -w net.ipv4.tcp_keepalive_time=1200                       &> /dev/null
# outbound port range
sysctl -w net.ipv4.ip_local_port_range="10000 65000"             &> /dev/null
# max SYN backlog
sysctl -w net.ipv4.tcp_max_syn_backlog=4096                      &> /dev/null
# max timewait sockets held by system simultaneously
sysctl -w net.ipv4.tcp_max_tw_buckets=5000                       &> /dev/null
# TCP receive buffer
sysctl -w net.ipv4.tcp_rmem="4096 87380 67108864"                &> /dev/null
# TCP write buffer
sysctl -w net.ipv4.tcp_wmem="4096 65536 67108864"                &> /dev/null
# turn on path MTU discovery
sysctl -w net.ipv4.tcp_mtu_probing=1                             &> /dev/null
# for high-latency network
sysctl -w net.core.default_qdisc=fq                              &> /dev/null
sysctl -w net.ipv4.tcp_congestion_control=bbr                    &> /dev/null

sysctl -w net.ipv6.conf.all.disable_ipv6=1                       &> /dev/null
sysctl -w net.ipv6.conf.default.disable_ipv6=1                   &> /dev/null
sysctl -w net.ipv6.conf.lo.disable_ipv6=1                        &> /dev/null
sysctl -w net.ipv6.conf.venet0.disable_ipv6=1                    &> /dev/null

