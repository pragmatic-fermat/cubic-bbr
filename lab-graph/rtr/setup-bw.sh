#!/bin/bash
#
set -x

## ver Inet et clients
iface_0="eth0"
sudo tc qdisc del dev $iface_0 root
sudo tc qdisc add dev $iface_0 root handle 1: htb default 3
sudo tc class add dev $iface_0 parent 1: classid 1:3 htb rate 10Mbit
sudo tc qdisc add dev $iface_0 parent 1:3 handle 3: bfifo limit 0.1MB

## Ver srv
iface_1="eth1"
sudo tc qdisc del dev $iface_1 root
sudo tc qdisc add dev $iface_1 root handle 1: htb default 3
sudo tc class add dev $iface_1 parent 1: classid 1:3 htb rate 10Mbit
sudo tc qdisc add dev $iface_1 parent 1:3 handle 3: bfifo limit 0.1MB
