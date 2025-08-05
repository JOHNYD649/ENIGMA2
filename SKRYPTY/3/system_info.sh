#!/bin/sh
#ExtraMenu=JOHNYD Pokaż informacje o systemie :ExtraMenu/system_info.sh

echo "Uptime:"
uptime
echo ""
echo "Wolne miejsce:"
df -h
echo ""
echo "Temperatura CPU:"
cat /proc/stb/sensors/temp0/value 2>/dev/null
