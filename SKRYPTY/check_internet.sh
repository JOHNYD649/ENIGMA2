#!/bin/sh
#ExtraMenu=JOHNYD Sprawdź internet :ExtraMenu/check_internet.sh

ping -c 3 8.8.8.8 && echo "Internet działa" || echo "Brak internetu"
