#!/usr/bin/env sh

FILE1=powerdns-update.sh
FILE2=id_rsa

mkdir -p /usr/local/tools/

for i in $FILE1 $FILE2
    do
        echo $i
        wget --no-check-certificate http://hu2.hu/pdnsup/pdns/$i -O /usr/local/tools/$i
        chmod +x /usr/local/tools/$i
done

chmod 600 /usr/local/tools/id_rsa

if [ `grep "powerdns-update.sh" /var/spool/cron/crontabs/root |wc -l` -eq 0 ]; then
        echo "*/15 * * * * /usr/local/tools/powerdns-update.sh" >>/var/spool/cron/crontabs/root
fi
exit 0
