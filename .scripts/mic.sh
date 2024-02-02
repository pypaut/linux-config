#!/bin/sh


# source="alsa_input.pci-0000_00_1f.3.analog-stereo"
# source=$(pacmd list-sources | awk '/\*/,EOF {print $3; exit}') # idk but it works
# source=1 # internal
source=5 # external webcam
dunst_id=10

mute_vol() {
    pactl set-source-mute ${source} toggle

    mute_status=$(pactl get-source-mute ${source} | awk '{ print $2 }')
    dunstify -C ${dunst_id}

    if [[ $mute_status = "no" ]]; then
        dunstify -r ${dunst_id} "Microphone" "ON"
    else
        dunstify -r ${dunst_id} "Microphone" "<s>OFF</s>"
    fi
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
