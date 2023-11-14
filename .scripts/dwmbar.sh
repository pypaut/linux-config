#!/bin/sh


while :; do
    # Date
    time=$(date | awk '{ print $4 }' | cut -c1-5)
    day=$(date | awk '{ print $3" "$2 }')

    # Battery
    bat_name=$(upower -e | grep BAT)
    percentage_line=$(upower -i $bat_name | grep percentage)
    bat_level=$(echo $percentage_line | awk '{ print $2 }')

    state_line=$(upower -i $bat_name | grep state) && \
    state=$(echo $state_line| awk '{ print $2 }')

    smol_state="-"
    if [[ $state = "charging" ]]; then
        smol_state="+"
    fi

    # Volume
    sink=$(pacmd list-sinks | awk '/\*/,EOF {print $3; exit}')
    vol=$(pactl get-sink-volume ${sink} | awk '{print $5}')

    xsetroot -name " [$bat_level $smol_state]  [$time - $day] "
    sleep 1m
done
