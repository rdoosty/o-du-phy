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
pushd .
CUR_DIR=`pwd`
export GTEST_ROOT="$CUR_DIR/googletest-release-1.7.0"
export RTE_SDK="$CUR_DIR/dpdk-stable-19.11.8"
export RTE_TARGET=x86_64-native-linuxapp-icc
export XRAN_DIR="$CUR_DIR/fhi_lib"
cd $XRAN_DIR
source ./build.sh
popd
