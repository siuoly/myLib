# Fonts, fonts
path1: ~/.local/share/fonts/ , user manually installed, system-wise
path2: /usr/share/fonts ,  package mamager installed

put unzipped fonts at ~/.local/share/fonts/, thus fonts have been installed.

```sh
fc-list |sort # list all usable fonts
pacman -Qs fonts  # search installed package which name contain "fonts"
pacman -Qs ttf  
cd /usr/share/fonts
fd --type=file --extension=otf --extension=ttf --extension=ttc
```

CJK字型是包含所有中日韓統一表意文字的電腦字體。
宋體（或稱明體，歐美稱襯線體）、黑體（歐美稱非襯線體）、楷體、隸書體等多種類手寫體。 
黑體是漢字和其他東亞文字使用的字體。它的特點是筆畫厚度均勻，與白體相反，和拉丁字母的無襯線體（英語：sans-serif）屬於同類。
adobe-source-han-sans-tw-fonts: 思源黑體

    sans (sans-serif,無襯線字體)，通常這是大部份程式預設使用的字體
    serif (有襯線字體)
    monospace (等寬字體)，通常終端機會使用此字體

# brightness temperature color
```sh
pacman -S brightness redshift xsct
brightness s 50%   # or +50%
#bindsym XF86MonBrightnessUp exec --no-startup-id "brightnessctl s +10%"
#bindsym XF86MonBrightnessDown exec --no-startup-id "brightnessctl s 10%-"
redshift -O 3500K
xsct <temperature> <brightness> # xsct 3000 0.8
```

# keybaord repeat speed
```sh
xset r rate 200 50 # 1:<time to starte repeat(ms)>  2:<repeat speed>
```

# file explorer: ranger preview image
```conf
/home/siuoly/.config/ranger/rc.conf
set preview_images true
```

# power setting
```sh
upower -d 
tlp-stat -s # show tlp status
tlp-stat --battery  # show battery
tlp-stat -p # show cpu performance

# /etc/tlp.conf
START_CHARGE_THRESH_BAT1=80
STOP_CHARGE_THRESH_BAT1=95

#CPU_ENERGY_PERF_POLICY_ON_AC=balance_performance
#CPU_ENERGY_PERF_POLICY_ON_BAT=balance_power
#CPU_MIN_PERF_ON_BAT=0
#CPU_MAX_PERF_ON_BAT=30 --> 60
```

# rofi setting
```sh
rofi -dump-config > ./config/rofi/config.rasi
terminal: xst
```

# screenshot
```sh
pacman -S maim
maim home/$USER/Pictures/$(date).png
```

# sha256sum checksum
```sh
echo "$(cat archive.tar.gz.sha256) archive.tar.gz" | sha256sum --check --status
echo "028cfaaf551d64cbb2f39d15363ed78edb01e2673579b48cb694e3604207d656 nvim.appimage" |sha256sum --check
sha256sum <file> # manually comparing
```

# Thinkpad trackpoint speed small redpoint speed
```sh
echo 255 > /sys/bus/serio/devices/serio2/sensitivity  # origin:200
echo 255 > /sys/bus/serio/devices/serio2/speed   # origin:97
```

# man
```sh
man -k <search> # search target page
man -f <smail> # show shot description, the same woth `whatis <smail>`
man <page>.n  # open page (n), e.g.: man swapon.8
man n page # alias above
```

# media player
pacman -S mpv
# sound tune
pacman -S alsa-utils
alsamixer # terminal gui tune sound 
pacman -S pavucontrol
pavucontrol # better than alsamixer

# tailscale
pkill -9 NetworkManager # solve /etc/resolv.conf dns problem

# xst config
yay -S xst
~/.cache/yay/xst/src/xst/config.def.h: int scrollrate = 5; # default 1, make it speed up 
make && sudo make install

# disk partition
    > expand efi system partition
`yay -S gparted`




: vim: nospell:
