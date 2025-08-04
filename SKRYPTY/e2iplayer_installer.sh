#!/bin/sh
#ExtraMenu=JOHNYD instalator E2iPlayer :ExtraMenu/e2iplayer_installer.sh
echo "Pobieram instalator E2iPlayer..."
cd /tmp
wget https://gitlab.com/zice/e2iplayer/-/raw/master/Install.sh -O - | sh
