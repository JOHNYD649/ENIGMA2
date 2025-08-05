#!/bin/sh
#ExtraMenu=JOHNYD Usuń stare nagrania :ExtraMenu/record_cleanup.sh

find /media/hdd/movie -type f -mtime +30 -name "*.ts" -exec rm -f {} \;
echo "Stare nagrania usunięte."
