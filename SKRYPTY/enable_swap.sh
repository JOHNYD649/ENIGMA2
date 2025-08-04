#!/bin/sh
#ExtraMenu=JOHNYD Włącz SWAP :ExtraMenu/enable_swap.sh

swapon /media/hdd/swapfile && echo "SWAP włączony." || echo "Błąd włączania SWAP."
