#!/bin/bash
wget https://fast.dpdk.org/rel/dpdk-19.11.8.tar.xz
tar -xf dpdk-19.11.8.tar.xz
pushd .
cd dpdk-stable-19.11.8
# Here apply patch from section A.2.3 https://docs.o-ran-sc.org/projects/o-ran-sc-o-du-phy/en/latest/Setup-Configuration_fh.html
source ../dpdk-patch.sh
./usertools/dpdk-setup.sh
# Select 42 to select x86_64-native-linuxapp-icc and build,
# in the next step select 49 to install VFIO module,
# then 65 to exit
popd
wget https://github.com/google/googletest/archive/refs/tags/release-1.7.0.tar.gz
tar -xf release-1.7.0.tar.gz
cd googletest-release-1.7.0
cmake .
make -j
cd ..
source /opt/intel/oneapi/compiler/2021.1.1/env/vars.sh
CUR_DIR=`pwd`
export GTEST_ROOT="$CUR_DIR/googletest-release-1.7.0"
export RTE_SDK="$CUR_DIR/dpdk-stable-19.11.8"
export RTE_TARGET=x86_64-native-linuxapp-icc
export XRAN_DIR="$CUR_DIR/fhi_lib"
cd $XRAN_DIR
source ./build.sh
# Create VFs
echo 2 > /sys/class/net/enp37s0f0/device/sriov_numvfs
echo 2 > /sys/class/net/enp37s0f1/device/sriov_numvfs
echo 2 > /sys/bus/pci/devices/0000:25:00.0/sriov_numvfs
sudo ip link set enp37s0f0 vf 1 mac 00:11:22:33:44:66 vlan 1
sudo ip link set enp37s0f0 vf 0 mac 00:11:22:33:44:66 vlan 2
echo 2 > /sys/bus/pci/devices/0000:25:00.1/sriov_numvfs
sudo ip link set enp37s0f1 vf 1 mac 00:11:22:33:44:55 vlan 1
sudo ip link set enp37s0f1 vf 0 mac 00:11:22:33:44:55 vlan 2
# Set hugepages for all the sockets on the system
sudo sh -c "echo 16 > /sys/devices/system/node/node0/hugepages/hugepages-1048576kB/nr_hugepages"
sudo sh -c "echo 16 > /sys/devices/system/node/node1/hugepages/hugepages-1048576kB/nr_hugepages"
sudo sh -c "echo 16 > /sys/devices/system/node/node2/hugepages/hugepages-1048576kB/nr_hugepages"
sudo sh -c "echo 16 > /sys/devices/system/node/node3/hugepages/hugepages-1048576kB/nr_hugepages"
# Make sure to properly edit dpdk.sh and run before running code
