#!/bin/sh
#ExtraMenu=JOHNYD Sprawdź temperaturę tunera :ExtraMenu/temp_check.sh

echo "Temperatura tunera:"
cat /proc/stb/fp/temp_sensor_avs
