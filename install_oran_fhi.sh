# make sure to have enabled intel_iommu (intel_iommu=on) and set iommu to pt (iommu=pt) in grub
wget https://fast.dpdk.org/rel/dpdk-19.11.8.tar.xz
tar -xf dpdk-19.11.8.tar.xz
#cd ~/dpdk-stable-19.11.8
# here apply patch from section A.2.3 https://docs.o-ran-sc.org/projects/o-ran-sc-o-du-phy/en/latest/Setup-Configuration_fh.html
# ./usertools/dpdk-setup.sh
# select 42 to select x86_64-native-linuxapp-icc and build
# next step select 49 to install VFIO module
# then 65 to exit
echo 2 > /sys/class/net/enp37s0f0/device/sriov_numvfs
echo 2 > /sys/class/net/enp37s0f1/device/sriov_numvfs
echo 2 > /sys/bus/pci/devices/0000:25:00.0/sriov_numvfs
sudo ip link set enp37s0f0 vf 1 mac 00:11:22:33:44:66 vlan 1 
sudo ip link set enp37s0f0 vf 0 mac 00:11:22:33:44:66 vlan 2
echo 2 > /sys/bus/pci/devices/0000:25:00.1/sriov_numvfs
sudo ip link set enp37s0f1 vf 1 mac 00:11:22:33:44:55 vlan 1 
sudo ip link set enp37s0f1 vf 0 mac 00:11:22:33:44:55 vlan 2
wget https://github.com/google/googletest/archive/refs/tags/release-1.7.0.tar.gz
tar -xf release-1.7.0.tar.gz
cd googletest-release-1.7.0
cmake .
make -j
cd ..
git clone https://github.com/o-ran-sc/o-du-phy.git
cd o-du-phy
git apply common.hpp.diff
cd ..
#source /opt/intel/oneapi/compiler/2021.1.1/env/vars.sh
export GTEST_ROOT=`pwd`/googletest-release-1.7.0
export RTE_SDK=`pwd`/dpdk-stable-19.11.8
export RTE_TARGET=x86_64-native-linuxapp-icc