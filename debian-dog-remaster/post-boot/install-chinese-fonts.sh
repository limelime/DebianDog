INSTALL_DATA_DIR=/root/post-boot/install-data
SCRIPT_NAME="$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"

### Install Chinese fonts so that it display correctly in Iceweseal/Firefox and in the console.
apt-get -y install fonts-arphic-ukai fonts-arphic-uming

### Test
# Open http://ctext.org/zh



# Other languages: http://meta.wikimedia.org/wiki/List_of_Wikipedias
