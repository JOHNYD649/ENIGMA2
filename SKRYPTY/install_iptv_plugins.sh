#!/bin/sh
#ExtraMenu=JOHNYD Instalacja IPTV pluginów :ExtraMenu/install_iptv_plugins.sh
echo "Instalacja IPTV pluginów..."
opkg update
opkg install enigma2-plugin-extensions-jedimakerxtream
opkg install enigma2-plugin-extensions-serviceapp
opkg install enigma2-plugin-extensions-xtreamtv
echo "Instalacja zakończona."
