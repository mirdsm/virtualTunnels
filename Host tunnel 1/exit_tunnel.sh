#!/bin/bash


ovs-vsctl del-br0
ovs-vsctl del-br1

ifup etho
ifdown eth0
ifup eth0

