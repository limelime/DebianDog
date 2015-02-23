#!/bin/sh
# Description: Repackage squashfs with post-boot/ directory in /root
# Author: Xuan Ngo
# Usage: mk-custom-squashfs.sh <DebianDog Original ISO> <Output Squash File>
# Requirements:
 #  - mksquashfs

DEBIAN_DOG_ISO=$1
OUTPUT_SQUASH_FILE=$2

### Error handling
if [ $# -eq 0 ]; then
  echo "ERROR: <DebianDog Original ISO> <Output Squash File> arguments are missing!"
  echo "Example:"
  echo "\t ./mk-custom-squashfs.sh /path-to/DebianDog-Wheezy-openbox_xfce.iso /path-where-to-create-squash-file"
  exit 1;
fi

### Variables
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

### Copy post-boot directory to /root.
cp -R post-boot ${NEW_SQUASH_DIR}/root/

### Make squashfs
rm -f ${OUTPUT_SQUASH_FILE}
mksquashfs ${NEW_SQUASH_DIR} ${OUTPUT_SQUASH_FILE}


### Clean up
lsof | grep iso
umount ${MOUNT_DEBIAN_DOG_ISO}
umount ${MOUNT_SQUASH}
umount ${MOUNT_DEBIAN_DOG_ISO}
umount ${MOUNT_SQUASH}
#rm -rf ${MOUNT_DEBIAN_DOG_ISO}
#rm -rf ${MOUNT_SQUASH}
