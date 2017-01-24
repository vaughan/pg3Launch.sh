#!/bin/bash
SQL_FILE=$1
HOST="dhpr-dev2"
PORT="5432"
DBNAME="dhpr-dev2"
ROLE="vaughan"

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
pgadmin3 -qc "host=$HOST port=$PORT dbname=$DBNAME role=$ROLE" -f "$SQL_FILE" &
sleep .6
window=$(xdotool search --class pgadmin3 |tail -n 1)
xdotool key --window $window F5 #send F5 keystroke to window to execute the query

