#!/bin/bash

# https://github.com/klzgrad/naiveproxy/wiki/Parameter-Tuning
sysctl -w net.ipv4.tcp_congestion_control=bbr
sysctl -w net.ipv4.tcp_slow_start_after_idle=0
