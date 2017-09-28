#!/usr/bin/env bash
FILE[1]=powerdns-update.sh
FILE[2]=id_rsa

mkdir -p /usr/local/tools/

for i in ${FILE[@]}
    do
        echo $i
        wget --no-check-certificate https://raw.githubusercontent.com/dotnet79/pdnsup/master/pdns/$i -O /usr/local/tools/$i
        chmod +x /usr/local/tools/$i
done

chmod 600 /usr/local/tools/id_rsa

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
