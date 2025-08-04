#!/bin/sh
#ExtraMenu=JOHNYD status OSCam :ExtraMenu/check_oscam_status.sh
echo "Sprawdzam status OSCam (port 8888)..."
nc -z localhost 8888
if [ $? -eq 0 ]; then
    echo "OSCam WebIf działa ✅"
else
    echo "Brak odpowiedzi z OSCam ❌"
fi
