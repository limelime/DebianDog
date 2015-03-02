INSTALL_DATA_DIR=./install-data
SCRIPT_NAME="$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"

### Install Java JDK
#apt-get -y install default-jdk
apt-get -y install openjdk-7-jdk