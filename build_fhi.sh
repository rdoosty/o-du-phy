#!/bin/bash
pushd .
cd $DIR_WIRELESS_WLS
source ./build.sh
cd $DIR_WIRELESS_ORAN_5G_FAPI/build
source ./build.sh
cd $XRAN_DIR
source ./build.sh
popd
