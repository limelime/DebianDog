INSTALL_DATA_DIR=/root/post-boot/install-data
SCRIPT_NAME="$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"

### Preload *.deb: Copy *.deb to /var/cache/apt/archives.
DEB_CACHE_DIR=/var/cache/apt/archives/
cp -Rf ${INSTALL_DATA_DIR}/apt-i386/archives/* ${DEB_CACHE_DIR} 

### Comment out deb-multimedia
SOURCE_LIST=/etc/apt/sources.list
cp ${SOURCE_LIST} ${SOURCE_LIST}.bck
sed -i "s/\(^deb.*deb-multimedia.*\)/#\1/" ${SOURCE_LIST}

### Update apt-get
apt-get update

### Test
# ls /var/cache/apt/archives/ | grep "\.deb"