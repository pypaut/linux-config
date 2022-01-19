#!/bin/sh


source="alsa_input.pci-0000_00_1f.3.analog-stereo"

mute_vol() {
    pactl set-source-mute ${source} toggle
}

decrease_vol() {
    pactl set-source-volume ${source} -5%
}

increase_vol() {
    pactl set-source-volume ${source} +5%
}

case "$1" in
    "mut") mute_vol ;;
    "dec") decrease_vol ;;
    "inc") increase_vol ;;
    "") ;;
    *) echo "$1 : unrecognized command" ;;
esac
