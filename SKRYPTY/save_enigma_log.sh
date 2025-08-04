#!/bin/sh
#ExtraMenu=JOHNYD Zapisz logi Enigmy do pliku :ExtraMenu/save_enigma_log.sh

dmesg > /media/hdd/enigma_log_$(date +%F).log
echo "Log zapisany na /media/hdd"
