#!/bin/sh


sink=$(pacmd list-sinks | awk '/\*/,EOF {print $3; exit}')

mute_vol() {
    pactl set-sink-mute ${sink} toggle
}

decrease_vol() {
    pactl set-sink-volume ${sink} -5%
}

increase_vol() {
    pactl set-sink-volume ${sink} +5%
}

notify_vol() {
    vol=$(pactl get-sink-volume ${sink} | awk '{print $5}')
    notify-send "VOLUME: $vol"
}

case "$1" in
    "mut") mute_vol ;;
    "dec") decrease_vol ;;
    "inc") increase_vol ;;
    "") ;;
    *) echo "$1 : unrecognized command" ;;
esac

# notify_vol
