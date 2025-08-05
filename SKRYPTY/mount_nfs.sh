#!/bin/sh
#ExtraMenu=JOHNYD Zamontuj udział NFS :ExtraMenu/mount_nfs.sh

mount -t nfs 192.168.1.100:/nfs/share /media/net/nfs && echo "Zamontowano NFS."
