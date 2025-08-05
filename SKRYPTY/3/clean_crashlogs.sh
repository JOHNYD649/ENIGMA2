#!/bin/sh
#ExtraMenu=JOHNYD Usuń crashlogi z systemu :ExtraMenu/clean_crashlogs.sh

find /home/root/ -name "enigma2_crash_*" -exec rm -f {} \;
echo "Wszystkie crashlogi zostały usunięte."
