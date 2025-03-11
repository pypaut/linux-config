#!/bin/sh


while true; do
    sleep 60

    # Battery percentage level
    bat_name=$(upower -e | grep BAT)
    percentage_line=$(upower -i $bat_name | grep percentage) && \
    bat_lvl_str="${percentage_line##* }" && \
    bat_lvl_str=$(echo $bat_lvl_str | sed s/%//g) && \
    bat_lvl_int=$(expr $bat_lvl_str)

    # Battery state
    state_line=$(upower -i $bat_name | grep state) && \
    state_str="${state_line##* }"

    # Debug
    # echo "Battery level : $bat_lvl_int%\nBattery state : $state_str"

    if [ $state_str = "discharging" -a $bat_lvl_int -le 20 ]; then
        dunstify "Power outage" "Plug in now."
        paplay $HOME/.scripts/bark.ogg
    elif [ $state_str = "charging" -a $bat_lvl_int -ge 80 ]; then
        dunstify "Over 9000" "You can pull the plug."
        paplay $HOME/.scripts/bark.ogg
    fi
done
