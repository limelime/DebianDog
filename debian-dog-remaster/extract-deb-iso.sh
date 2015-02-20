#!/bin/sh
# Description: Extract Debian ISO
# Author: Xuan Ngo
# Usage: extractdeb.sh <ISO file> <to directory>
# Reference: 
#	-https://wiki.debian.org/DebianInstaller/Preseed/EditIso
#	-https://codeghar.wordpress.com/2011/12/14/automated-customized-debian-installation-using-preseed/
#	-http://blog.ericwhite.ca/articles/2009/11/unattended-debian-lenny-install/
#	-http://www.hps.com/~tpg/notebook/autoinstall.php (A lot of tips)
#	-http://users.telenet.be/mydotcom/howto/boot/boot_linux.htm
#	-https://forums.virtualbox.org/viewtopic.php?f=10&t=46798
#	-https://lists.debian.org/debian-boot/2012/01/msg00016.html (isolinux)

ISO_FILE_PATH=$1
TO_DIR=$2

# Mount ISO
TMP_LOOP_DIR=/tmp/tmploopiso
mkdir ${TMP_LOOP_DIR}
mount -o loop ${ISO_FILE_PATH} ${TMP_LOOP_DIR}

# Clear ${TO_DIR} before copying
if [ -f ${TO_DIR} ]; then
	chmod -R 777 ${TO_DIR}
fi
rm -rf ${TO_DIR}
mkdir -p ${TO_DIR}

# Copy all files to ${TO_DIR}
cd ${TMP_LOOP_DIR}
cp -R * ${TO_DIR}
# cp: cannot create symbolic link ‘/media/sf_vm_sharedfolder/moddebdir/doc/FAQ/html/ch-uptodate.html’: Read-only file system
# bsdtar -C cd -xf your-image.iso 
# https://wiki.debian.org/DebianInstaller/Modify/CD#Debian-Installer:_How_to_modify_an_existing_CD_image

# Clean up mount process
#umount ${TMP_LOOP_DIR}
#rm -rf ${TMP_LOOP_DIR}

# Display info
echo "***************** Done *****************"
echo "All files of ${ISO_FILE_PATH} are copied into ${TO_DIR}."