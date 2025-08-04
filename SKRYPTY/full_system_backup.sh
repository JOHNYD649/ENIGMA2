#!/bin/sh
#ExtraMenu=JOHNYD full system backup :ExtraMenu/full_system_backup.sh
echo "Wykonuję pełny backup systemu (image)..."
BACKUP_DIR="/media/hdd/fullbackup"
mkdir -p "$BACKUP_DIR"
dd if=/dev/mtd0 of=$BACKUP_DIR/kernel.backup bs=1024
dd if=/dev/mtd1 of=$BACKUP_DIR/rootfs.backup bs=1024
echo "Backup zakończony w $BACKUP_DIR"
