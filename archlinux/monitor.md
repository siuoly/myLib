
# xrandr
multiple screen usage
```sh
# when plugged HDMI ,setting it the second screen
xrandr --output HDMI-2 --auto --right-of eDP-1   
xrandr --output HDMI-2 --off    # close the second screen

xrandr --auto  # auto setting current screen
xrandr --output LVDS1 --mode 1024x768  # indicate mode, 
xrandr --output LVDS1 --mode 1024x768 --rate 75
xrandr --output LVDS1 --rate 75  # update speed rate
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

# add virtual screen for deskreen ,weylus
```sh
cvt 1200 900 # get mode line format
 xrandr --newmode "1200x900_60.00"   88.50  1200 1272 1392 1584  900 903 907 934 -hsync +vsync
 xrandr --addmode HDMI-1  "1200x900_60.00"  # recommend use HDMI, DP has unknown bugs.
 xrandr --output HDMI-1 --mode "1200x900_60.00" --below HDMI-2
```
> ref: https://bbs.archlinux.org/viewtopic.php?id=286384
> 

# tools
```sh
yay -S arandr # gui tool manage monitor
yay -S lxrandr-gtk3 # light weight manage monitor
```



vim: nospell
