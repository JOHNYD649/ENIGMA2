#!/bin/sh
#ExtraMenu=JOHNYD Odmontuj dysk USB :ExtraMenu/umount_usb.sh

umount /media/usb && echo "USB odmontowane." || echo "Nie udało się odmontować."
