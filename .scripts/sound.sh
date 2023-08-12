#!/bin/sh


sink=$(pacmd list-sinks | awk '/\*/,EOF {print $3; exit}')
dunst_id=10

mute_vol() {
    pactl set-sink-mute ${sink} toggle
}

decrease_vol() {
    pactl set-sink-volume ${sink} -5%
}

increase_vol() {
    pactl set-sink-volume ${sink} +5%
}

# TODO: strikethrough text when muted (instead of "mute: yes")
notify_vol() {
    vol=$(pactl get-sink-volume ${sink} | awk '{print $5}')
    mute_status=$(pactl get-sink-mute ${sink} | awk '{ print $2 }')
    dunstify -C ${dunst_id}
    dunstify -r ${dunst_id} "VOLUME: $vol" "MUTED: ${mute_status}"
}

case "$1" in
    "mut") mute_vol ;;
    "dec") decrease_vol ;;
    "inc") increase_vol ;;
    "") ;;
    *) echo "$1 : unrecognized command" ;;
esac

notify_vol
