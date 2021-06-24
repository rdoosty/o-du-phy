#!/bin/bash
source /opt/intel/oneapi/compiler/2021.1.1/env/vars.sh intel64
pushd .
CUR_DIR=`pwd`
export GTEST_ROOT="$CUR_DIR/googletest-release-1.7.0"
export RTE_SDK="$CUR_DIR/dpdk-stable-19.11.8"
export RTE_TARGET=x86_64-native-linuxapp-icc
export XRAN_DIR="$CUR_DIR/fhi_lib"
cd $XRAN_DIR
source ./build.sh
popd
