#!/bin/sh
#ExtraMenu=JOHNYD Włącz serwer FTP :ExtraMenu/start_ftp.sh

/etc/init.d/vsftpd start && echo "FTP uruchomiony."
