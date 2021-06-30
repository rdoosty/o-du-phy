#!/bin/bash
cd $DIR_ROOT_PHY
wget http://static.dpdk.org/rel/dpdk-19.11.tar.xz
tar -xf dpdk-19.11.tar.xz
cd dpdk-19.11
# Here apply patch from section A.2.3 https://docs.o-ran-sc.org/projects/o-ran-sc-o-du-phy/en/latest/Setup-Configuration_fh.html
source $DIR_ROOT_PHY/dpdk-patch.sh
./usertools/dpdk-setup.sh
# Select 39 to select x86_64-native-linuxapp-icc and build,
# in the next step select 46 to install VFIO module,
# then 62 to exit
cd $DIR_ROOT_PHY
wget https://github.com/google/googletest/archive/refs/tags/release-1.7.0.tar.gz
tar -xf release-1.7.0.tar.gz
cd googletest-release-1.7.0
cmake .
make -j
cd $DIR_ROOT_PHY
