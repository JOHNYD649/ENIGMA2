#!/bin/sh
#ExtraMenu=JOHNYD Sprawdź połączenie z Internetem :ExtraMenu/check_internet.sh

ping -c 3 8.8.8.8 && echo "Połączenie OK" || echo "Brak połączenia"
