rm ~/.config/pulse/*
pulseaudio -k
sleep 5
pulseaudio --start
