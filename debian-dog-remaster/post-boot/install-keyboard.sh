INSTALL_DATA_DIR=/root/post-boot/install-data
SCRIPT_NAME="$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"

# Set the keyboard
setxkbmap us -variant alt-intl

# Debug
# ' + e = é
# Right-Alt-comma + c = ç