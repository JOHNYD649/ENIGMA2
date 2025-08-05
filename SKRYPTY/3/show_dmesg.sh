#!/bin/sh
#ExtraMenu=JOHNYD Log systemowy dmesg :ExtraMenu/show_dmesg.sh

dmesg | tail -n 50
