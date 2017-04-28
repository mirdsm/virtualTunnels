#!/bin/bash


ovs-vsctl del-br br0
ovs-vsctl del-br br1
ifup eth0
ifdown eth0
ifup eth0

ovs-vsctl add-br br0
ovs-vsctl add-br br1
ovs-vsctl add-port br0 eth0
ifconfig eth0 0 && ifconfig br0 192.168.1.30 netmask 255.255.255.0
route add default gw 192.168.1.1 br0
ifconfig br1 10.1.2.10 netmask 255.255.255.0
ovs-vsctl add-port br1 gen1 -- set interface gen1 type=geneve options:remote_ip=192.168.1.31 options:df_default=false
ifconfig br0 mtu 1370
ethtool -K genev_sys_6081 tso off
