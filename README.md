## XFCE Wallpaper Changer
Change your XFCE wallpaper on the fly by sending a kill -64 signal to this scripts PID.<br>


## Basic Usage
```
./wallpaper.sh &
```
```
pgrep wallpaper.sh | xargs kill -64
```

## Automatically Change Wallpaper
If you would like to add a cronjob to automatically change the wallpaper every night at midnight for example,<br>

```
crontab -e
```
```
0 0 * * * pgrep wallpaper.sh | xargs kill -64
