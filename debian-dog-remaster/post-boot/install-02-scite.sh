INSTALL_DATA_DIR=/root/post-boot/install-data
SCRIPT_NAME="$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"

# Remove current default text editor
apt-get -y remove leafpad

# Install Scite
apt-get -y intsall scite

# Modify Scite configurations
SCITE_CONFIG_FILE=/etc/scite/SciTEGlobal.properties
if [ ! -f ${SCITE_CONFIG_FILE}.bck ]; then
	cp -n ${SCITE_CONFIG_FILE} ${SCITE_CONFIG_FILE}.bck
	cat ${INSTALL_DATA_DIR}/scite-config.txt >> ${SCITE_CONFIG_FILE}
	
	# Debug: sed "s/open.filter=\\\/open.filter=\\\xuan\\n\$(all.files)\\\xuan\\nxuan/" /etc/scite/SciTEGlobal.properties | grep xuan
  sed -i "s/open.filter=\\\/open.filter=\\\\\n\$(all.files)\\\\\n/" /etc/scite/SciTEGlobal.properties

else
  echo "Error: ${SCRIPT_NAME} failed!"
  echo "${SCITE_CONFIG_FILE}.bck already exists."
fi

