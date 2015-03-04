#!/bin/sh
# Description: 
# Author: Xuan Ngo
# Usage:
#       ./build-new-kernel.sh <../live/> <../isolinux/live.cfg> 
# Requirements:
#  - 
# Note: 
#       -http://murga-linux.com/puppy/viewtopic.php?p=774459#774459

LIVE_DIR=$1
LIVE_CFG=$2

KERNELS_DIR=kernels
BOOT_ENTRIES_DIR=./boot-entries

### Extract the kernel.
unzip ${KERNELS_DIR}/022-kernel-686-pae.zip -d ${LIVE_DIR}


### Add boot-entry
BOOT_NAME=DebianDog-3.2.0-4-686-Pae
if ! grep -q "${BOOT_NAME}" ${LIVE_CFG} 
then
  echo "">>${LIVE_CFG}
  cat ${BOOT_ENTRIES_DIR}/boot-entry-3.2.0-4-686-pae.txt >> ${LIVE_CFG}
fi

