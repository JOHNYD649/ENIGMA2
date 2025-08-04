#!/bin/sh
#ExtraMenu=JOHNYD Czyszczenie logów i tymczasowych plików :ExtraMenu/clean_tmp_logs.sh
echo "Czyszczenie logów i tymczasowych plików..."
rm -f /home/root/*.log
rm -f /home/root/enigma2_crash_*.log
rm -rf /tmp/*
rm -rf /var/log/*
sync
echo "Zakończono."
