INSTALL_DATA_DIR=./install-data
SCRIPT_NAME="$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"

### Preload *.deb: Copy *.deb to /var/cache/apt/archives.
DEB_CACHE_DIR=/var/cache/apt/archives/
cp -Rf ${INSTALL_DATA_DIR}/apt-i386/archives/* ${DEB_CACHE_DIR} 

### Comment out deb-multimedia
SOURCE_LIST=/etc/apt/sources.list
cp ${SOURCE_LIST} ${SOURCE_LIST}.bck
sed -i "s/\(^deb.*deb-multimedia.*\)/#\1/" ${SOURCE_LIST}

#dpkg -i ${INSTALL_DATA_DIR}/packages/deb-multimedia-keyring_2014.2_all.deb

### Upgrade Debian
apt-get update

apt-get -y dist-upgrade

### Test
# ls /var/cache/apt/archives/ | grep "\.deb"