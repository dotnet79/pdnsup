#!/usr/bin/env bash

MYSQL_USER=powerdns
MYSQL_PASSWORD=Kalap123
MYSQL_HOST=127.0.0.1

SQLSELSOA=$(echo "SELECT content FROM records WHERE records.\`type\`=\"SOA\" AND NAME=\"$1\""  | mysql -u $MYSQL_USER -p$MYSQL_PASSWORD -h $MYSQL_HOST powerdns -s -N)

DATE=`date +%Y%m%d00`
DATE2=`echo $SQLSELSOA| awk '{print $3}'`


    if [ ${DATE::-2} = ${DATE2::-2} ]
      then
        UDATE1=$((DATE2 + 1))
        SQLINSSOA=`echo $SQLSELSOA|awk '{print $1" "$2" '$UDATE1' "$4" "$5" "$6" "$7}'`

      else
        SQLINSSOA=`echo $SQLSELSOA|awk '{print $1" "$2" '$DATE' "$4" "$5" "$6" "$7}'`
    fi

echo $SQLINSSOA

mysql -u $MYSQL_USER -p$MYSQL_PASSWORD -h $MYSQL_HOST powerdns -e \
"UPDATE records SET content=\"$SQLINSSOA\", change_date=\"`date +%s`\" WHERE records.\`type\`=\"SOA\" AND NAME=\"$1\""
