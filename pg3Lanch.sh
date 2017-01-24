pgadmin3 -qc "host=dhpr-dev2 port=5432 dbname=dhpr-dev2 role=vaughan" -f "$1" &
sleep .6
window=$(xdotool search --class pgadmin3 |tail -n 1)
xdotool key --window $window F5 #send F5 keystroke to window to execute the query

