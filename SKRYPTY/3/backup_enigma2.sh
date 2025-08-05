#!/bin/sh
#ExtraMenu=JOHNYD Backup ustawień Enigma2 :ExtraMenu/backup_enigma2.sh

BACKUP_DIR="/media/hdd/backup"
mkdir -p "$BACKUP_DIR"
tar -czvf "$BACKUP_DIR/enigma2_settings_$(date +%F_%H-%M).tar.gz" /etc/enigma2 /etc/network/interfaces /etc/fstab /etc/hostname /etc/hosts
echo "Backup zakończony: $BACKUP_DIR"
