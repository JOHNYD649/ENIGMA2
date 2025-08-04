#!/bin/sh
#ExtraMenu=JOHNYD Sprawdzanie połączenia z internetem :ExtraMenu/check_internet.sh
echo "Sprawdzanie połączenia z internetem..."
ping -c 3 8.8.8.8 > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "Internet działa ✅"
else
    echo "Brak internetu ❌"
fi
