#!/bin/bash
# Create VFs
sudo echo 2 > /sys/class/net/ens2f0/device/sriov_numvfs
sudo echo 2 > /sys/class/net/ens2f1/device/sriov_numvfs
sudo echo 2 > /sys/bus/pci/devices/0000:25:00.0/sriov_numvfs
sudo ip link set ens2f0 vf 1 mac 00:11:22:33:44:66 vlan 1
sudo ip link set ens2f0 vf 0 mac 00:11:22:33:44:66 vlan 2
echo 2 > /sys/bus/pci/devices/0000:25:00.1/sriov_numvfs
sudo ip link set ens2f1 vf 1 mac 00:11:22:33:44:55 vlan 1
sudo ip link set ens2f1 vf 0 mac 00:11:22:33:44:55 vlan 2
# Set hugepages for all the sockets on the system
sudo sh -c "echo 16 > /sys/devices/system/node/node0/hugepages/hugepages-1048576kB/nr_hugepages"
sudo sh -c "echo 16 > /sys/devices/system/node/node1/hugepages/hugepages-1048576kB/nr_hugepages"
sudo sh -c "echo 16 > /sys/devices/system/node/node2/hugepages/hugepages-1048576kB/nr_hugepages"
sudo sh -c "echo 16 > /sys/devices/system/node/node3/hugepages/hugepages-1048576kB/nr_hugepages"
# Make sure to properly edit dpdk.sh and run with sudo before running sample-app
cd $XRAN_DIR/app
sudo ./dpdk.sh
cd $DIR_ROOT_PHY
