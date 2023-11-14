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

notify_mute() {
    mute_status=$(pactl get-sink-mute ${sink} | awk '{ print $2 }')
    if [ "$mute_status" = "yes" ]; then
        dunstify -C ${dunst_id}
        dunstify -r ${dunst_id} "VOLUME: MUTED"
    else
        notify_vol;
    fi
}

notify_vol() {
    vol=$(pactl get-sink-volume ${sink} | awk '{print $5}')
    mute_status=$(pactl get-sink-mute ${sink} | awk '{ print $2 }')
    dunstify -C ${dunst_id}

    # if [[ $mute_status = "yes" ]]; then
    #     dunstify -r ${dunst_id} "Volume: $vol" "MUTED"
    # else
    #     dunstify -r ${dunst_id} "Volume: $vol" "SOUND"
    # fi

    dunstify -r ${dunst_id} "Volume: $vol"
}

# update_dwm_bar() {
#     dwmbar_pid-$(ps aux | grep /bin/sh | grep dwmbar | awk '{ print $2 }')
#     kill -9 $dwmbar_pid
#     ~/.scripts/dwmbar.sh &
# }

case "$1" in
    "mut") mute_vol ;;
    "dec") decrease_vol && notify_vol ;;
    "inc") increase_vol && notify_vol ;;
    "") ;;
    *) echo "$1 : unrecognized command" ;;
esac

# update_dwm_bar
