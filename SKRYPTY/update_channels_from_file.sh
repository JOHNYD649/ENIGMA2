#!/bin/sh
#ExtraMenu=JOHNYD Aktualizacja listy kanałów z pliku :ExtraMenu/update_channels_from_file.sh

FILE="/media/hdd/userbouquet.favourites.tv"
[ -f "$FILE" ] && cp "$FILE" /etc/enigma2/ && echo "Lista zaktualizowana." || echo "Brak pliku do aktualizacji."
