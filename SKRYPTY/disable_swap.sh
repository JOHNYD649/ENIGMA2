#!/bin/sh
#ExtraMenu=JOHNYD Wyłącz SWAP :ExtraMenu/disable_swap.sh

swapoff /media/hdd/swapfile && echo "SWAP wyłączony." || echo "Błąd wyłączania SWAP."
