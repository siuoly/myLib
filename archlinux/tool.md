# Fonts, fonts
path1: ~/.local/share/fonts/ , user manually installed, system-wise
path2: /usr/share/fonts ,  package mamager installed

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

# brightness
[from](https://unix.stackexchange.com/questions/526653/control-screen-brightness-in-i3)
```sh
pacman -S brightness
brightness s 50%   # +50%
```

# temperature color
```sh
pacman -S redshift
redshift -O 3500K

pacman -S xsct
xsct <temperature> <brightness>
e.g. xsct 3000 0.8
```

# keybaord repeat speed
```sh
x r rate 200 50 # 1:<time to starte repeat(ms)>  2:<repeat speed>
```

