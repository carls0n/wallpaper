# XFCE Wallpaper changer
Change your XFCE wallpaper on the fly by sending a kill -64 signal to this scripts PID. Requires shuf install

# Usage
* ./wallpaper.sh &<br>
* pgrep -f wallpaper.sh | xargs kill -64

# Automatically change wallpaper
If you would like to add a cronjob to automatically change the wallpaper every night at midnight for example, use the following
* crontab -e
* 0 0 * * * pgrep -f wallpaper.sh | xargs kill -64
