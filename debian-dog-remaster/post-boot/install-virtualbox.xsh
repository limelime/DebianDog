INSTALL_DATA_DIR=/root/post-boot/install-data
SCRIPT_NAME="$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"

# Install VirtualBox Guest Additions.
apt-get -y install bzip2
apt-get -y install dkms build-essential linux-headers-$(uname -r)