#!/bin/bash
source /opt/intel/oneapi/compiler/2021.1.1/env/vars.sh intel64
pushd .
cd $DIR_WIRELESS_WLS
source ./build.sh
cd $DIR_WIRELESS_ORAN_5G_FAPI/build
source ./build.sh
cd $XRAN_DIR
source ./build.sh
popd
