# Description: This script should be executed on the first boot.
# Author: Xuan Ngo

SCRIPT_NAME="$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"

### Error handling.
FIRST_BOOT_LOCK=firstboot.lock
if [ -f ${FIRST_BOOT_LOCK} ]; then

  echo "Error: ${SCRIPT_NAME} failed!"
  cat ${FIRST_BOOT_LOCK}
  exit 1;
fi

DATE_STRING=`date +"%Y-%m-%d_%0k.%M.%S %Z"`
echo "${SCRIPT_NAME} ran on ${DATE_STRING}" >> ${FIRST_BOOT_LOCK};

### Install
# Make sure script files are listed in alphabetical order.

# Execute base scripts
sh install-00-00.sh

# Execute script with install-<letter>*.sh
for scriptfile in $( ls install-[aA-zZ]*.sh ); do
    echo "Running ${scriptfile}..."
    sh ${scriptfile}
done



