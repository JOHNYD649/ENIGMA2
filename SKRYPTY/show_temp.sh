#!/bin/sh
#ExtraMenu=JOHNYD Temperatura CPU :ExtraMenu/show_temp.sh

cat /sys/class/thermal/thermal_zone0/temp | awk '{print $1/1000 "°C"}'
