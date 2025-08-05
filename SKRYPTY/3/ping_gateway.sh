#!/bin/sh
#ExtraMenu=JOHNYD Ping bramy :ExtraMenu/ping_gateway.sh

ip route | grep default | awk '{print $3}' | xargs ping -c 4
