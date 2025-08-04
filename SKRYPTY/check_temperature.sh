#!/bin/sh
#ExtraMenu=JOHNYD Temperatura tunera :ExtraMenu/check_temperature.sh
echo "Temperatura tunera:"
if [ -f /proc/stb/sensors/temp0/value ]; then
    TEMP=$(cat /proc/stb/sensors/temp0/value)
    echo "$TEMP °C"
else
    echo "Brak danych o temperaturze."
fi
