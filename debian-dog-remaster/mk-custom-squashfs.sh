#!/bin/sh
# Description: 
# Author: Xuan Ngo
# Usage: mk-custom-squashfs.sh <DebianDog Original ISO> <Output Squash File>
# Reference: 

DEBIAN_DOG_ISO=$1
OUTPUT_SQUASH_FILE=$1

WORKING_DIR=/tmp
MOUNT_DEBIAN_DOG_ISO=${WORKING_DIR}/mnt-debian-dog-iso
MOUNT_SQUASH=${WORKING_DIR}/mnt-squash
NEW_SQUASH_DIR=${WORKING_DIR}/new-squash

### Extract DebianDog's squashfs
rm -rf ${MOUNT_DEBIAN_DOG_ISO}
mkdir -p ${MOUNT_DEBIAN_DOG_ISO}
mount -o loop ${DEBIAN_DOG_ISO} ${MOUNT_DEBIAN_DOG_ISO}

rm -rf ${MOUNT_SQUASH}
mkdir -p ${MOUNT_SQUASH}
mount -t squashfs ${MOUNT_DEBIAN_DOG_ISO}/live/01-filesystem.squashfs ${MOUNT_SQUASH}

rm -rf ${NEW_SQUASH_DIR}
mkdir -p ${NEW_SQUASH_DIR}
cp -R ${MOUNT_SQUASH}/* ${NEW_SQUASH_DIR}


### Clean up
umount ${MOUNT_DEBIAN_DOG_ISO}
umount ${MOUNT_SQUASH}