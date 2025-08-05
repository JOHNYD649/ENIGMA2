#!/bin/sh
#ExtraMenu=JOHNYD Status WiFi :ExtraMenu/wifi_status.sh

iwconfig 2>/dev/null | grep -i --color quality
