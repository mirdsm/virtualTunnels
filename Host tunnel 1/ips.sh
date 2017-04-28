#!/bin/bash

ovs-vsctl add-port br1 ips1 -- set interface ips1 type=ipsec_gre options:remote_ip=192.168.1.31 options:psk=test123
