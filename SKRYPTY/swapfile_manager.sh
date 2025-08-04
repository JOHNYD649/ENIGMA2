#!/bin/sh
#ExtraMenu=JOHNYD swapfile manager :ExtraMenu/swapfile_manager.sh
SWAPFILE="/media/hdd/swapfile"

if [ ! -f "$SWAPFILE" ]; then
    echo "Tworzę plik swap 128MB..."
    dd if=/dev/zero of=$SWAPFILE bs=1M count=128
    mkswap $SWAPFILE
fi

swapon $SWAPFILE
echo "SWAP aktywowany."
free -m
