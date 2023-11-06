
# xrandr
multiple screen usage
```
# when plugged HDMI ,setting it the second screen
xrandr --output HDMI-2 --auto --right-of eDP-1   
xrandr --output HDMI-2 --off    # close the second screen
```

# autorandr
## https://github.com/phillipberndt/autorandr
automatically using xrandr setting
```
md ~/config/autorandr
autorandr --savea single # generate for single screen setting
autorandr --save dual    # generate for dual screen setting
autorandr --change   # automatically load screen setting

~/.config/autorandr/setting.ini
[config]
skip-options=gamma  
# skip gamma setting for xsct
```


vim: nospell
