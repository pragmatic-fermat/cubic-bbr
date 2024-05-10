#!/bin/bash

sysctl -w net.ipv4.tcp_no_metrics_save=1

echo "before:"
ethtool -k eth0 | grep tcp-segmentation-offload
ethtool -K eth0 tso off
echo "after:"
ethtool -k eth0 | grep tcp-segmentation-offload

modprobe tcp_bbr 
sysctl net.ipv4.tcp_allowed_congestion_control
