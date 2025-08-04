#!/bin/sh
#ExtraMenu=JOHNYD oscam start :ExtraMenu/oscam_start.sh
CAM_PATH="/usr/softcams/oscam"
CAM_BIN="$CAM_PATH/oscam"

if [ -f "$CAM_BIN" ]; then
    echo "Uruchamiam OSCam..."
    killall oscam
    sleep 2
    $CAM_BIN -c /etc/tuxbox/config/oscam
else
    echo "Nie znaleziono pliku OSCam w $CAM_BIN"
fi
