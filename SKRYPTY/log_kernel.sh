#!/bin/sh
#ExtraMenu=JOHNYD Zapis logów kernela :ExtraMenu/log_kernel.sh

dmesg > /media/hdd/kernel_log_$(date +%F).log
echo "Log kernela zapisany."
