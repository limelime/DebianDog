INSTALL_DATA_DIR=./install-data
SCRIPT_NAME="$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"
PACKAGE_DIR=${INSTALL_DATA_DIR}/packages

### Install mpv
dpkg -i ${PACKAGE_DIR}/mpv_0.8.0dd_i386.deb
# Install dependencies
apt-get -y -f install