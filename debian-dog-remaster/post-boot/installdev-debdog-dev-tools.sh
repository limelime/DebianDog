INSTALL_DATA_DIR=./install-data
SCRIPT_NAME="$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"

# Need debconf-get-selections
apt-get -y install debconf-utils

apt-get -y install disk-manager