#!/bin/sh
#ExtraMenu=JOHNYD Pokaż adres MAC :ExtraMenu/show_mac.sh

ifconfig | grep -i hwaddr
