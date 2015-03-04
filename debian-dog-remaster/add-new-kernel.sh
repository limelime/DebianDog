#!/bin/sh
# Description: 
# Author: Xuan Ngo
# Usage:
 #    ./build-new-kernel.sh <../live/> <../isolinux/live.cfg> 
# Requirements:
 #  - 

LIVE_DIR=$1
LIVE_CFG=$2

KERNELS_DIR=kernels
KERNEL_NAME=Debian-kernel-3.14-686-Pae

### Extract the kernel.
WORK_DIR=${KERNELS_DIR}/${KERNEL_NAME}
rm -rf ${WORK_DIR}
mkdir -p ${WORK_DIR}
tar -xvzf ${KERNELS_DIR}/026-kernel-3.14-Pae.tar.gz -C ${WORK_DIR}

### Copy kernel files
cp -R ${WORK_DIR}/* ${LIVE_DIR} 

### Add boot-entry
SEARCH_TERM="DebianDog-3.14-686-Pae"
if ! grep -q "${SEARCH_TERM}" ${LIVE_CFG} 
then
  echo "">>${LIVE_CFG}
  cat boot-entry-3.14-686-pae.txt >> ${LIVE_CFG}
fi

### Clean up
# rm -rf ${WORK_DIR}