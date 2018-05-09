#!/usr/bin/env bash

MYSQL_USER=powerdns
MYSQL_PASSWORD=Kalap123
MYSQL_HOST=127.0.0.1

#myvariable=$(mysql -u $MYSQL_USER -p$MYSQL_PASSWORD -h $MYSQL_HOST powerdns -se \'UPDATE records SET CONTENT=\"$1\", CHANGE_DATE=\"`date +%s`\" WHERE name=\"$
#exec $myvariable
#echo $myvariable

#mysql -u $MYSQL_USER -p$MYSQL_PASSWORD -h $MYSQL_HOST powerdns -e \
#"SELECT * FROM records WHERE name=\"$1\""

SQLSELIP=$(echo "SELECT content FROM records WHERE name=\"$1\"" | mysql -u $MYSQL_USER -p$MYSQL_PASSWORD -h $MYSQL_HOST powerdns -s -N)
echo $SQLSELIP


#"SELECT name \
#FROM records \
#WHERE name = '$1' \
#INTO OUTFILE '/tmp/orders.csv' \
#FIELDS TERMINATED BY ',' \
#ENCLOSED BY '"' \
#LINES TERMINATED BY '\n';"
