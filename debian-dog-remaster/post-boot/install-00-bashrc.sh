INSTALL_DATA_DIR=./install-data
SCRIPT_NAME="$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"

### Add .bashrc.
cp ${INSTALL_DATA_DIR}/bashrc_root /root/.bashrc
source /root/.bashrc


### Test
# Open another terminal, you should get color with ls command.