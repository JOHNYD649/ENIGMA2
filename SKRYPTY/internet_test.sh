#!/bin/sh
#ExtraMenu=JOHNYD Test połączenia z Internetem :ExtraMenu/internet_test.sh

ping -c 3 8.8.8.8 > /dev/null && echo "Połączenie OK" || echo "Brak internetu!"
