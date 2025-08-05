#!/bin/sh
#ExtraMenu=JOHNYD Lista usług :ExtraMenu/list_services.sh

systemctl list-units --type=service
