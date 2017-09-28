#!/usr/bin/env bash
FILE1=powerdns-update.sh

mkdir -p /usr/local/tools/
wget --no-check-certificate https://raw.githubusercontent.com/dotnet79/pdnsup/master/pdns/$FILE1 -O /usr/local/tools/$FILE1
chmod +x /usr/local/tools/$FILE1

if [ `grep "powerdns-update.sh" /var/spool/cron/crontabs/root |wc -l` -eq 0 ]; then
        echo "*/15 * * * * /usr/local/tools/powerdns-update.sh" >>/var/spool/cron/crontabs/root
fi

if [ $? == 0 ]
then
    echo
    echo "A végrehajtás sikeres"
    echo
else
    echo
    echo "Hiba a végrehajtás során"
    echo
fi
exit 0
