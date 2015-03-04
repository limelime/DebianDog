INSTALL_DATA_DIR=./install-data
SCRIPT_NAME="$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"
PACKAGE_DIR=${INSTALL_DATA_DIR}/packages

### Install mpv
# Need deb-multimedia repository.
# mpv is from DebianDog repository.
apt-get -y install mpv