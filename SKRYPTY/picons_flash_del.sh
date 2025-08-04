#!/bin/sh
#ExtraMenu=JOHNYD Remove all picons form flash :ExtraMenu/picons_flash_del.sh

echo "remove all picon from flash"
rm -rf /usr/share/enigma2/picon > /dev/null 2>&1
echo -e "\nPicon removed\n"

exit 0
