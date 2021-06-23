#!/bin/bash
## make sure to have enabled intel_iommu (intel_iommu=on) and set iommu to pt (iommu=pt) in grub
# Add the following line to /etc/default/grub:
# GRUB_CMDLINE_LINUX="console=ttyS0,115200 intel_iommu=on iommu=pt nmi_watchdog=0 softlockup_panic=0 audit=0 intel_pstate=disable cgroup_memory=1 cgroup_enable=memory mce=off idle=poll hugepagesz=1G hugepages=16 hugepagesz=2M hugepages=0 default_hugepagesz=1G isolcpus=4-63 rcu_nocbs=4-63 kthread_cpus=0-3 irqaffinity=0-3 nohz_full=4-63"
# Then run: sudo grub-update
# Reboot the server

export DIR_ROOT=/scratch/
#set the L1 binary root DIR
export DIR_ROOT_L1_BIN=$DIR_ROOT/FlexRAN
#set the phy root DIR
export DIR_ROOT_PHY=$DIR_ROOT/o-du-phy
#set the DPDK root DIR
#export DIR_ROOT_DPDK=/home/dpdk-19.11
#set the GTEST root DIR
#export DIR_ROOT_GTEST=/home/gtest/gtest-1.7.0

export DIR_WIRELESS_TEST_5G=$DIR_ROOT_L1_BIN/testcase
export DIR_WIRELESS_SDK=$DIR_ROOT_L1_BIN/sdk/build-avx512-icc
export DIR_WIRELESS_TABLE_5G=$DIR_ROOT_L1_BIN/l1/bin/nr5g/gnb/l1/table
#source /opt/intel/system_studio_2019/bin/iccvars.sh intel64 -platform linux
export XRAN_LIB_SO=true
export RTE_TARGET=x86_64-native-linuxapp-icc
#export RTE_SDK=$DIR_ROOT_DPDK
#export DESTDIR=""
#export GTEST_ROOT=$DIR_ROOT_GTEST

export ORAN_5G_FAPI=true
export DIR_WIRELESS_WLS=$DIR_ROOT_PHY/wls_lib
export DEBUG_MODE=true
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$DIR_WIRELESS_WLS:$XRAN_DIR/lib/build
export DIR_WIRELESS=$DIR_ROOT_L1_BIN/l1
export DIR_WIRELESS_ORAN_5G_FAPI=$DIR_ROOT_PHY/fapi_5g
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$DIR_ROOT_L1_BIN/libs/cpa/bin

source install_oran_fhi.sh
