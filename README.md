## XFCE Wallpaper Changer
Change your XFCE wallpaper on the fly by sending a kill -64 signal to this scripts PID.<br>


## Basic Usage
start wallpaper.sh in the background
```
./wallpaper.sh &
```
You can then obtain the PID of the running script and send the kill -64 signal like this
```
pidof -x wallpaper.sh
```
```
kill -64 PID
```

## Automatically Change Wallpaper
If you would like to add a cronjob to automatically change the wallpaper every night at midnight for example,<br>

```
crontab -e
```
```
0 0 * * * pgrep wallpaper.sh | xargs kill -64
