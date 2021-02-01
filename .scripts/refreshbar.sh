#!/bin/sh

xsetroot -name " BAT $( acpi | grep -o ',.*\%' | sed 's/[^0-9|%]*//g' ) | $( date +"%F %R" )"
