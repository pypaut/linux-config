# Statusbar loop
while true; do
   xsetroot -name " BAT $( acpi | grep -o '...\%' ) | $( date +"%F %R" )"
   sleep 10
done &

# For Archlinux i3

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

exec i3
