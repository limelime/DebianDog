INSTALL_DATA_DIR=/root/post-boot/install-data
SCRIPT_NAME="$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"

# Setup debconf parameters
export DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true DEBCONF_DEBUG=developer

# Set timezone
debconf-set-selections ${INSTALL_DATA_DIR}/tzdata-config.seed
dpkg-reconfigure tzdata

# Debug
# cat /etc/timezone