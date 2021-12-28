#!/bin/sh


while true; do
    sleep 60

    # Battery percentage level
    percentage_line=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage) && \
    bat_lvl_str="${percentage_line##* }" && \
    bat_lvl_str=$(echo $bat_lvl_str | sed s/%//g) && \
    bat_lvl_int=$(expr $bat_lvl_str)

    # Battery state
    state_line=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep state) && \
    state_str="${state_line##* }"

    # Debug
    # echo "Battery level : $bat_lvl_int%\nBattery state : $state_str"

    if [ $state_str = "discharging" -a $bat_lvl_int -le 20 ]; then
        notify-send "Power outage!" "You might want to plug sometimes."
        paplay $HOME/.scripts/bark.ogg
    fi
done
