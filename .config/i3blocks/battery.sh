#!/bin/bash

BAT=$(acpi -b | grep -E -o '[0-9][0-9]?%')

# Full and short texts
echo "BAT: $BAT"
echo "BAT: $BAT"
# echo \033[38;2;0;0;0m

# Set urgent flag below 5% or use orange below 20%
# [ ${BAT%?} -le 5 ] && exit 33
# [ ${BAT%?} -le 20 ] && echo "#FF8000"

exit 0
