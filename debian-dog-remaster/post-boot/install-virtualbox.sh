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

# Add mount point
# Be careful of the VBOX_MNT_POINT path because /mnt & /media are exclude from RemasterDog script.
VBOX_MNT_POINT=/vbox/shared
FSTAB=/etc/fstab
cp -n ${FSTAB} ${FSTAB}.bck
mkdir -p ${VBOX_MNT_POINT}
echo "shared ${VBOX_MNT_POINT} vboxsf defaults 0 0" >> ${FSTAB}
mount -a

### References
# https://www.virtualbox.org/manual/ch04.html#sf_mount_manual