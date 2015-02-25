INSTALL_DATA_DIR=/root/post-boot/install-data
SCRIPT_NAME="$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"

### Install VirtualBox Guest Additions.

# Install needed packages to install guest additions.
apt-get -y install bzip2
apt-get -y install dkms build-essential linux-headers-$(uname -r)

# Mount VBoxGuestAdditions.iso
VBOX_GUEST_ISO_DIR=./tmp-vbox-guest-addtions
mkdir ${VBOX_GUEST_ISO_DIR}
mount -o loop ${INSTALL_DATA_DIR}/VBoxGuestAdditions.iso ${VBOX_GUEST_ISO_DIR}

# Execute VBoxLinuxAdditions.run
cd ${VBOX_GUEST_ISO_DIR}
./VBoxLinuxAdditions.run
cd ..

# Clean up.
umount ${VBOX_GUEST_ISO_DIR}
rm -rf ${VBOX_GUEST_ISO_DIR}