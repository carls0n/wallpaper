#!/bin/bash

wallpaper_directory=/path/to/directory

# Trap signalrtmax SIGRTMAX
trap signalrtmax SIGRTMAX
trap "exit 0" SIGTERM SIGKILL SIGSTOP SIGINT

# Function to select a new random wallpaper that is different from the current one
get_new_wallpaper() {
local count=0
local new_wallpaper=""
current_wallpaper=$(/usr/bin/xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor`xrandr | grep -w connected | awk '{print $1}'`/workspace0/last-image)
while [[ -z "$new_wallpaper" || "$new_wallpaper" == "$current_wallpaper" ]]; do
((count++))
if (( count >= 10 )); then
return 1
fi
new_wallpaper=$(/usr/bin/find $wallpaper_directory -type f 2>/dev/null | /usr/bin/shuf -n 1)
done
if [[ -n "$new_wallpaper" && "$new_wallpaper" != "$current_wallpaper" ]]; then
echo "$new_wallpaper"
fi
return 0 # Return success
}

function signalrtmax {
SIGNAL_CAUGHT=true
nextImage
}

# Function to set the new wallpaper
function nextImage {
new_wallpaper=$(get_new_wallpaper)
/usr/bin/xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor`xrandr | grep -w connected | awk '{print $1}'`/workspace0/last-image -s "$new_wallpaper"
}

while :
do
sleep 0.01
done
