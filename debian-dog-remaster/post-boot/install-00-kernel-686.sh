INSTALL_DATA_DIR=./install-data
SCRIPT_NAME="$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"

/opt/bin/update-dpkg-686-pae