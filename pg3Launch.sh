#!/bin/bash
# pg3Launch.sh - launch sql files in postgres via pgadmin3
#
# - useful for right-clicking on sql files in file explorer to launch them
# - gdialog asks for db params
# - xdotool sends an F5 key to the pgadmin3 application to launch the query instantly

SQL_FILE=$1
HOST="my_host"
PORT="5432"
DBNAME="my_db"
ROLE="user"

params=($( \
  gdialog --title "Run SQL with params" \
          --inputbox "host port dbname role" 100 600 "$HOST $PORT $DBNAME $ROLE" \
   2>&1
 ))

HOST=${params[0]}
PORT=${params[1]}
DBNAME=${params[2]}
ROLE=${params[3]}

echo "connecting to host=$HOST port=$PORT dbname=$DBNAME role=$ROLE"
echo "- running $SQL_FILE"
pgadmin3 -qc "host=$HOST port=$PORT dbname=$DBNAME role=$ROLE" -f "$SQL_FILE" &
sleep .6
window=$(xdotool search --class pgadmin3 |tail -n 1)
xdotool key --window $window F5 #send F5 keystroke to window to execute the query

