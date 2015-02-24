INSTALL_DATA_DIR=/root/post-boot/install-data
SCRIPT_NAME="$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"

### Comment out deb-multimedia
SOURCE_LIST=/etc/apt/sources.list
cp ${SOURCE_LIST} ${SOURCE_LIST}.bck
sed -i "s/\(^deb.*deb-multimedia.*\)/#\1/" ${SOURCE_LIST}

### Update apt-get
apt-get update