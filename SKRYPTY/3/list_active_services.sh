#!/bin/sh
#ExtraMenu=JOHNYD Lista aktywnych usług :ExtraMenu/list_active_services.sh

ps | grep -v grep | grep -e telnet -e ftp -e enigma2
