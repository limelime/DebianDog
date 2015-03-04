INSTALL_DATA_DIR=./install-data
SCRIPT_NAME="$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"

# Need debconf-get-selections
apt-get -y install debconf-utils

# GUI to set mount of partition
apt-get -y install disk-manager

# Display directory structure in the form of a tree
apt-get -y install tree