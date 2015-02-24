INSTALL_DATA_DIR=/root/post-boot/install-data
SCRIPT_NAME="$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"

### Add .bashrc.
cp ${INSTALL_DATA_DIR}/bashrc_root /root/.bashrc
source /root/.bashrc