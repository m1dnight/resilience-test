#!/bin/bash

# 1vu = 4 requests
echo "root soft nofile 5000" >> /etc/security/limits.conf
echo "root hard nofile 1048576" >> /etc/security/limits.conf

sysctl -w net.ipv4.ip_local_port_range="16384 65000"

echo "sysctl -w net.ipv4.tcp_tw_reuse=1" >> /etc/sysctl.conf