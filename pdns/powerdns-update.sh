#!/usr/bin/env sh

IP=`wget -qO- http://hu2.hu/whatismyip.php`
NAME=`sysctl kernel.hostname|awk '{print $3}'`
DOMAIN=hu2.hu
FDOMAIN=$NAME.$DOMAIN
USER=pdnsup
PASS=d386c800769d27c37bb17b652a4b06d5acd2e57a

#ssh -p22284 pdnsup@szaszsuli.hu "/home/pdnsup/powerdns-dynamic.sh $IP $DOMAIN"
ssh -i /usr/local/tools/id_rsa -p22284 $USER@$DOMAIN "$IP $FDOMAIN" #szerveren az authorized_keys -ben fel van veve command="./pdns/powerdns-dynamic.sh $SSH_ORIGINAL_COMMAND"

exit 0
