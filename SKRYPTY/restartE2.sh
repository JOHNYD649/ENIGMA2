#!/bin/sh
#Franc - 2018 (PurE2)
#ExtraMenu=JOHNYD Restart E2 :ExtraMenu/StandbyEnter.sh

PATH=/sbin:/bin:/usr/sbin:/usr/bin

echo -n "Restarting E2... "
init 6
sleep 1