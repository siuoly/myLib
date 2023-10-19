# Fonts, fonts
path1: ~/.local/share/fonts/ , user manually installed, system-wise
path2: /usr/share/fonts ,  package mamager installed

```sh
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

