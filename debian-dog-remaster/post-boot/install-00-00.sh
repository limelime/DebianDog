INSTALL_DATA_DIR=./install-data
SCRIPT_NAME="$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"

# Execute base scripts in the following order:
sh install-00-kernel.sh
sh install-00-bashrc.sh
sh install-00-proxy.sh
sh install-00-apt-get-update.sh
sh install-00-locale.sh

