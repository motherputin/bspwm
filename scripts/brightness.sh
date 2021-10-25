#!/bin/bash
function get_brightness {
	light | cut -d . -f 1
}

function send_notification {
    brightness=`get_brightness`
    bar=$(seq -s "▮" $(($brightness / 5)) | sed 's/[0-9]//g')
    notify-send "Brightness" "$bar"
}

case $1 in
    up)
	light -A 10
        send_notification
        ;;
    down)
	light -U 10
        send_notification
        ;;
esac
