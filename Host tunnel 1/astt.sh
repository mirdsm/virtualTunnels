
#!/bin/bash
#ConfigureGreTun


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

ovs-vsctl add-port br1 st1 -- set interface st1 type=stt options:remote_ip=192.168.1.31 options:df_default=false
ifconfig br0 mtu 1420
ifconfig br1 mtu 1420
ifconfig eth0 mtu 1420

#ifconfig br0 mtu 60000
#ifconfig br1 mtu 60000
#ifconfig eth0 mtu 60000
#ethtool -K gre_sys tso off
