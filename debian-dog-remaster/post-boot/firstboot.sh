# Description: This script will run only once and after the first boot.
# Author: Xuan Ngo

POST_BOOT_DIR=/root/post-boot

### Add .bashrc.
cp ${POST_BOOT_DIR}/bashrc_root /root/.bashrc


### Preload *.deb: Copy *.deb to /var/cache/apt/archives.
DEB_CACHE_DIR=/var/cache/apt/archives/
cp -Rf ${POST_BOOT_DIR}/apt-i386/archives/* ${DEB_CACHE_DIR} 

### Modify sources.list
# Disable the cdrom path from the apt sources.list automatically.
sed -i 's/^deb cdrom/#deb/' /etc/apt/sources.list
cat ${POST_BOOT_DIR}/add-sources.list >> /etc/apt/sources.list
aptitude -y update

### Install other packages
# These packages are need to install VirtualBox Guest Additions.
	aptitude -y install bzip2
	aptitude -y install dkms build-essential linux-headers-$(uname -r)
