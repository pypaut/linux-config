# Statusbar loop
while true; do
   xsetroot -name " BAT $( acpi | grep -o '...\%' ) | $( date +"%F %R" )"
   sleep 10
done &
