#!/bin/sh
#ExtraMenu=JOHNYD Synchronizacja czasu :ExtraMenu/ntpupdate.sh

echo "Synchronizacja czasu z tempus2.gum.gov.pl"
echo
ntpdate -u tempus2.gum.gov.pl
echo
exit 0
