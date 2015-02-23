# Description: This script will run only once and after the first boot.
# Author: Xuan Ngo

POST_BOOT_DIR=/root/post-boot

### Add .bashrc.
cp ${POST_BOOT_DIR}/bashrc_root /root/.bashrc


### Preload *.deb: Copy *.deb to /var/cache/apt/archives.
DEB_CACHE_DIR=/var/cache/apt/archives/
cp -Rf ${POST_BOOT_DIR}/apt-i386/archives/* ${DEB_CACHE_DIR} 

### Install packages/applications
apt-get update
  
sh install-scite.sh
sh install-chinese-fonts.sh


