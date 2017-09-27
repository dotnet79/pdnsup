#!/usr/bin/env bash

MYSQL_USER=powerdns
MYSQL_PASSWORD=Kalap123
MYSQL_HOST=127.0.0.1

#myvariable=$(mysql -u $MYSQL_USER -p$MYSQL_PASSWORD -h $MYSQL_HOST powerdns -se \'UPDATE records SET CONTENT=\"$1\", CHANGE_DATE=\"`date +%s`\" WHERE name=\"$2\"\')
#exec $myvariable
#echo $myvariable

mysql -u $MYSQL_USER -p$MYSQL_PASSWORD -h $MYSQL_HOST powerdns -e \
"UPDATE records SET CONTENT=\"$1\", CHANGE_DATE=\"`date +%s`\" WHERE name=\"$2\""

