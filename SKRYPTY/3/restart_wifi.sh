#!/bin/sh
#ExtraMenu=JOHNYD Restart WiFi dongla :ExtraMenu/restart_wifi.sh

ifconfig wlan0 down
sleep 2
ifconfig wlan0 up
echo "Restart WiFi zakończony."
