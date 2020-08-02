#!/bin/bash

# https://github.com/klzgrad/naiveproxy/wiki/Parameter-Tuning
sysctl -w net.ipv4.tcp_congestion_control=bbr
sysctl -w net.ipv4.tcp_slow_start_after_idle=0
# max open files
sysctl -w fs.file-max=51200
# max read buffer
sysctl -w net.core.rmem_max=67108864
# max write buffer
sysctl -w net.core.wmem_max=67108864
# default read buffer
sysctl -w net.core.rmem_default=65536
# default write buffer
sysctl -w net.core.wmem_default=65536
# max processor input queue
sysctl -w net.core.netdev_max_backlog=4096
# max backlog
sysctl -w net.core.somaxconn=4096
# resist SYN flood attacks
sysctl -w net.ipv4.tcp_syncookies=1
# reuse timewait sockets when safe
sysctl -w net.ipv4.tcp_tw_reuse=1
# turn off fast timewait sockets recycling
sysctl -w net.ipv4.tcp_tw_recycle=0
# short FIN timeout
sysctl -w net.ipv4.tcp_fin_timeout=30
# short keepalive time
sysctl -w net.ipv4.tcp_keepalive_time=1200
# outbound port range
sysctl -w net.ipv4.ip_local_port_range="10000 65000"
# max SYN backlog
sysctl -w net.ipv4.tcp_max_syn_backlog=4096
# max timewait sockets held by system simultaneously
sysctl -w net.ipv4.tcp_max_tw_buckets=5000
# TCP receive buffer
sysctl -w net.ipv4.tcp_rmem="4096 87380 67108864"
# TCP write buffer
sysctl -w net.ipv4.tcp_wmem="4096 65536 67108864"
# turn on path MTU discovery
sysctl -w net.ipv4.tcp_mtu_probing=1
# for high-latency network
sysctl -w net.core.default_qdisc=fq
sysctl -w net.ipv4.tcp_congestion_control=bbr

sysctl -w net.ipv6.conf.all.disable_ipv6=1
sysctl -w net.ipv6.conf.default.disable_ipv6=1
sysctl -w net.ipv6.conf.lo.disable_ipv6=1
sysctl -w net.ipv6.conf.venet0.disable_ipv6=1

