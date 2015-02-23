INSTALL_DATA_DIR=/root/post-boot/install-data
SCRIPT_NAME="$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"

# Install locale
apt-get -y install locales 
debconf-set-selections ${INSTALL_DATA_DIR}/locale-config.seed
# Manually configuration: dpkg-reconfigure locales

# Install Chinese fonts so that it display correctly in Iceweseal/Firefox and in the console.
apt-get -y install fonts-arphic-ukai fonts-arphic-uming

# Install localepurge to keep locale small
apt-get -y install localepurge

# References:
# -https://people.debian.org/~schultmc/locales.html
# -http://perlgeek.de/en/article/set-up-a-clean-utf8-environment