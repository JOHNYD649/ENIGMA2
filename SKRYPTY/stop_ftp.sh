#!/bin/sh
#ExtraMenu=JOHNYD Wyłącz serwer FTP :ExtraMenu/stop_ftp.sh

/etc/init.d/vsftpd stop && echo "FTP zatrzymany."
