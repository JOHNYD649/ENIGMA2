#!/bin/bash
#ExtraMenu=JOHNYD Generator srvid :ExtraMenu/oscam-srvid-generator-twojeip.sh


HEADER="
#################################################################################
### script is designed to download and replace the 'oscam.srvid' file
### as the '.srvid' generator is used the online web-page: HTTP://KOS.TWOJEIP.NET
### script written by s3n0, 2021-02-17: https://github.com/s3n0
#################################################################################
"

#################################################################################

find_oscam_cfg_dir()
{
    RET_VAL=""
    DIR_LIST="/etc /var /usr /config"
    for FOLDER in $DIR_LIST; do
        FILEPATH=$(find "${FOLDER}" -iname "oscam.conf" | head -n 1)
        [ -f "$FILEPATH" ] && { RET_VAL="${FILEPATH%/*.conf}"; break; }
    done

    if [ -z "$RET_VAL" ]; then
        OSCAM_BIN=$(find /usr/bin -iname 'oscam*' | head -n 1)
        if [ -z "$OSCAM_BIN" ]; then
            echo -e "ERROR !\nOscam binary file was not found in folder '/usr/bin'.\nAlso, do not find the Oscam configuration directory.\nThe script will be terminated."
            exit 1
        else
            RET_VAL="$($OSCAM_BIN -V | grep -i 'configdir' | awk '{print substr($2,0,length($2)-1)}')"
        fi
    fi

    [ -z "$RET_VAL" ] && echo "WARNING ! Oscam configuration directory not found !"
    echo "$RET_VAL"
}

#################################################################################

echo "$HEADER"

URL="http://kos.twojeip.net/download.php?download[]=pack-abscbn&download[]=pack-akta&download[]=pack-austriasat&download[]=pack-bis&download[]=pack-boom&download[]=pack-bulsatcom&download[]=pack-cslink&download[]=pack-canaldigitaal&download[]=pack-canaldigitalnordic&download[]=pack-canalsat&download[]=pack-multicanal&download[]=pack-polsat&download[]=pack-dsmart&download[]=pack-dmc&download[]=pack-digitalb&download[]=pack-digitalplusa&download[]=pack-digitalplush&download[]=pack-digiturk&download[]=pack-dolcetv&download[]=pack-focussat&download[]=pack-fransat&download[]=pack-hdplus&download[]=pack-hellohd&download[]=pack-kabeld&download[]=pack-kabelkiosk&download[]=pack-cplus26e&download[]=pack-mtv&download[]=pack-maxtv&download[]=pack-mediaset&download[]=pack-meo&download[]=pack-mobistar&download[]=pack-mcafrica&download[]=pack-mytv&download[]=pack-ncplus&download[]=pack-nos&download[]=pack-orfdigital&download[]=pack-ote&download[]=pack-orange&download[]=pack-orangepl&download[]=pack-orbit&download[]=pack-showtime&download[]=pack-platformadv&download[]=pack-platformahd&download[]=pack-rai&download[]=pack-digitv&download[]=pack-raduga&download[]=pack-ssr&download[]=pack-satellitebg&download[]=pack-skygermany&download[]=pack-skydigital&download[]=pack-skyitalia&download[]=pack-skylink&download[]=pack-tvvlaanderen&download[]=pack-tvp&download[]=pack-telesat&download[]=pack-tvnakarte&download[]=pack-tivusat&download[]=pack-totaltv&download[]=pack-tring&download[]=pack-upc&download[]=pack-viasat&download[]=pack-visiontv&download[]=pack-vivacom"
#### # # # # # # # # # # # # #   downloading  :     pack-hdplus      +     pack-mtv      +     pack-skylink     +      pack-austriasat      +     pack-orfdigital      +     pack-skygermany
#### You must to find the correct package names (or full URL) directly on the website HTTP://KOS.TWOJEIP.NET - in the URL address of the downloaded file
#### !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

OSCAM_CFGDIR=$(find_oscam_cfg_dir)

[ -z "$OSCAM_CFGDIR" ] && { echo "ERROR ! Oscam cfg-directory not found !"; exit 1; }

cp -f "${OSCAM_CFGDIR}/oscam.srvid" "/tmp/oscam.srvid_backup"

echo -e "Downloading file...\n- from: ${URL}\n- to: ${OSCAM_CFGDIR}/oscam.srvid"
if wget --spider "${URL}" 2>/dev/null; then          # check the existence of an online file or web-page
    wget -q -O "${OSCAM_CFGDIR}/oscam.srvid" "${URL}"
    echo "...done !"
else
    echo "...ERROR - online URL ${URL} does not exist !"
    exit 1
fi

exit 0
