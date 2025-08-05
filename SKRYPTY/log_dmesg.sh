#!/bin/sh
#ExtraMenu=JOHNYD Log dmesg :ExtraMenu/log_dmesg.sh

dmesg > /tmp/dmesg.log && echo "Zapisano do /tmp/dmesg.log"
