#!/bin/sh
#ExtraMenu=JOHNYD Wyłącz serwer SAMBA :ExtraMenu/stop_samba.sh

/etc/init.d/samba stop && echo "Samba zatrzymana."
