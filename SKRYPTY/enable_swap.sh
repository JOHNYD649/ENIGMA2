#!/bin/sh
#ExtraMenu=JOHNYD Włącz swap :ExtraMenu/enable_swap.sh

fallocate -l 256M /media/hdd/swapfile && chmod 600 /media/hdd/swapfile && mkswap /media/hdd/swapfile && swapon /media/hdd/swapfile
