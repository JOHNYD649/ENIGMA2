#!/bin/sh
#ExtraMenu=JOHNYD openvpn runner :ExtraMenu/openvpn_runner.sh
CONFIG_FILE="/etc/openvpn/client.ovpn"

if [ -f "$CONFIG_FILE" ]; then
    echo "Uruchamiam OpenVPN z $CONFIG_FILE..."
    openvpn --config "$CONFIG_FILE" --daemon
else
    echo "Brak pliku konfiguracyjnego OpenVPN: $CONFIG_FILE"
fi
