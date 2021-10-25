#!/bin/bash
function get_volume {
	pulsemixer --get-volume | awk '{print $1;}'
}
function send_notification {
    volume=`get_volume`
    bar=$(seq -s "▮" $(($volume / 5)) | sed 's/[0-9]//g')
    notify-send "Volume" "$bar"
}
function get_mute {
	pulsemixer --get-mute
}
case $1 in
    up)
	pulsemixer --unmute
	pulsemixer --change-volume +10
	send_notification
	;;
    down)
	pulsemixer --unmute
	pulsemixer --change-volume -10
	send_notification
	;;
    mute)
	pulsemixer --toggle-mute
	;;
esac
