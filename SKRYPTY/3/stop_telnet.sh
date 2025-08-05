#!/bin/sh
#ExtraMenu=JOHNYD Wyłącz serwer Telnet :ExtraMenu/stop_telnet.sh

/etc/init.d/telnet stop && echo "Telnet zatrzymany."
