#!/bin/bash
set -x

SRV="10.124.0.3"
## vers Internet et Clients
OUTIF="eth0"
## Vers Srv
INTIF="eth1"

sysctl -w net.ipv4.tcp_no_metrics_save=1 
echo "net.ipv4.ip_forward = 1" | sudo tee -a /etc/sysctl.conf
sysctl -p

iptables -t nat -A POSTROUTING -o $INTIF -j MASQUERADE
iptables -t nat -A PREROUTING -i $OUTIF -p tcp --dport 5000:5999 -j DNAT --to-destination $SRV 
iptables -t nat -A PREROUTING -i $OUTIF -p udp --dport 5000:5999 -j DNAT --to-destination $SRV 
