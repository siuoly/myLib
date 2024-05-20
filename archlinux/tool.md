# arch tools
## package mamager
### pacman usage
```sh
"search"
pacman -Ss "keyword.."  # find package from online by any length of keyword
pacman -Qs "keyword.." # find package from local installed packages
pacman -Qm # list AUR package (not found in sync db)

sudo pacman -S "package" # install package , nage must match exclude package version
sudo pacman -R "package" # remove package
sudo pacman -Rs "package" # remove package and its dependency not used by other packages
sudo pacman -R $(pacman -Qtdq) # remove all package not be dependency

pacmam -Qi "pacmam" # print info of the package
pacman -Ql "package" # list all file which created by the package
pacman -Qo "executable_cmd/file"  # find package by execuble or file

pacman -Sy # update database, -Syy force even if it is latest

pacman -Qqtd # find package installed as dependency but now not be dependent(orphan)
```
### yay
```sh
yay -Ps # list system package statistic info
pacman -Rns yay # remove uninstall yay
```
## ubuntu tools
apt list --installed
dpkg -l

## Fonts, fonts
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

## brightness temperature color
```sh
pacman -S brightness redshift xsct
brightness s 50%   # or +50%
#bindsym XF86MonBrightnessUp exec --no-startup-id "brightnessctl s +10%"
#bindsym XF86MonBrightnessDown exec --no-startup-id "brightnessctl s 10%-"
redshift -PO 3500K
xsct <temperature> <brightness> # xsct 3000 0.8
```
## i3 disable screen saver
`exec --no-startup-id xset dpms 600 0 0 s off`

## ranger 
https://gist.github.com/heroheman/aba73e47443340c35526755ef79647eb

- **space**: toggle mark
- **yt**: copy marked file
- **dt**: cut marked file
- **pp**: paste file

- `:mkdir **DIRNAME**` : create new dir
- **F7**  : create new dir(mkdir)
- `:touch **FILE**` :create new file
- **Insert** :create new file(touch)
- **cw**: rename a:file A:extension
- **gL**:jump dir of link file

- **c-n**: new tabs
- **c-w**:*del tab*
- **tab**:"move tab"
- **shift-tab**:"move tab"

`. ranger` or `source ranger`: when exit ranger, move to last directory
- **ctrl-l**: redraw window(for preview window)
- **i**:display file(larger preview)


### preview pdf
uncomment scope.sh:163 application/pdf)....
`pacman -S poppler`

## file explorer: ranger preview image
```conf
/home/siuoly/.config/ranger/rc.conf
set preview_images true
```

## rofi setting
```sh
rofi -dump-config > ./config/rofi/config.rasi
terminal: xst
```

## screenshot
```sh
pacman -S maim
maim home/$USER/Pictures/$(date).png
```

## sha256sum checksum
```sh
echo "$(cat archive.tar.gz.sha256) archive.tar.gz" | sha256sum --check --status
echo "028cfaaf551d64cbb2f39d15363ed78edb01e2673579b48cb694e3604207d656 nvim.appimage" |sha256sum --check
sha256sum <file> # manually comparing
```

## man
```sh
man -k <search> # search target page
man -f <smail> # show shot description, the same woth `whatis <smail>`
man <page>.n  # open page (n), e.g.: man swapon.8
man n page # alias above
```

## media player
pacman -S mpv

## sound tune
```sh
pacman -S alsa-utils
alsamixer # terminal gui tune sound 
pacman -S pavucontrol
pavucontrol # better than alsamixer
```

## tailscale

`pkill -9 NetworkManager` # solve /etc/resolv.conf dns problem

## xst config
yay -S xst
~/.cache/yay/xst/src/xst/config.def.h: int scrollrate = 5; # default 1, make it speed up 
make && sudo make install

## disk partition
expand efi system partition: `yay -S gparted`
## ttyd
share terminal on browser
使用情境，在A電腦上，*臨時*分享其terminal，給B主機（手機,電腦,平板）的瀏覽器上使用。

```sh
pacman -S ttyd
ttyd zsh
ip -brief addr # find my ip address
 # another PC, iphone browser-> url:IP:7681 ,then can run the brower
```

## gotty
```sh
pacman -S gotty  # old version
pacman -S gotty-client # 在terminal 開啓別人分享的terminal
```

## dictionary
```sh
pacman -S translate-shell # google online 多國翻譯
trans "good" # goodl dictionary
trans :zh-TW "good" # chinese
trans :zh-TW+en "good"  # output chinese + english

pacman -S wudao-dict-git # 有道字典命令行版, 剛好足夠
wd "good"

pacman -S sdcv  # offline 星際譯王 starDict
```

下載字典
 1. https://blog.yuaner.tw/old/%E7%9B%AE%E5%89%8D%E6%AE%98%E7%95%99%E7%9A%84%E6%98%9F%E9%9A%9B%E8%AD%AF%E7%8E%8B%E5%AD%97%E5%85%B8%E6%AA%94/
 2. https://kdr2.com/resource/stardict.html
```sh
bunzip2 ***.tar.bz2
tar jxvf xxxx.tar.bz2 -C $HOME/.stardict/dic/ # 解壓縮字典到指定目錄
sdcv -l # list available dict
sdcv "good" 
mkdir -p $HOME/.stardict/dic/  # 字典路徑位置
touch $HOME/.sdcv_history # 搜尋記錄檔
```
## goldendict
```sh
yay -S goldendict-ng-git
```
## chezmoi
```sh
 ## first use
sh -c "$(curl -fsLS get.chezmoi.io)" # not autocompletitioin
pacman -S chezmoi # package manager, have autocompletitioin
 # install and apply
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply $GITHUB_USERNAME  # public
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply git@github.com:$GITHUB_USERNAME/dotfiles.git # private

 ## daily command
chezmoi add <file>
chezmoi re-add # add all files which been record
chezmoi edit <file>
chezmoi diff
chezmoi -v apply
chezmoi -nv apply
chezmoi  update # pull&&apply

 # git commit
chezmoi cd
chezmoi add .
chezmoi commit -m "Initial commit"

 ## github create new repo name XXX/dotfiles
git remote add origin <repo_url>
git branch -M main
git push -u origin main

 # for second machine
chezmoi init https://github.com/$GITHUB_USERNAME/dotfiles.git  # public
chezmoi init git@github.com:$GITHUB_USERNAME/dotfiles.git # private
chezmoi update -v  # pull and apply change
 # one line init and apply,
chezmoi init --apply https://github.com/$GITHUB_USERNAME/dotfiles.git
chezmoi init --apply git@github.com:$GITHUB_USERNAME/dotfiles.git # private

 # advanced usage
chezmoi add .nanorc # 添加文件
chezmoi add -x .config/fish/functions/ # 添加文件夹
chezmoi add -xa .config/fish/functions # 递归添加文件夹和子目录下的全部内容
chezmoi add -T .xprofile # 添加临时内容
chezmoi add .tmux.conf --follow # 添加软链接对应的原始内容，而不是软链接符号
chezmoi managed # 列出所管理的内容路径
chezmoi archive --output=dotfiles.tar # 一次打包成压缩包放 U 盘上硬件备份
```

## clock
```sh
yay -S tty-clock # terminal clock
tty-clock -t -c -C6 # 12hour, center, color
```
edit ~/.zshrc ,keybinding CTRL-O to call clock:
`bindkey -s "^o" "tty-clock -t -c -C6" `

## xdotool
send key to terminal by command to focus program pragramatially, used by script
```sh
xdotool key alt+t
xdotool key ctrl+shift+Page_Up
xdotool key shift+Home
xdotool key ctrl+l BackSpace
```

## zoxide
qucik jump directory tool
pacman -S zoxide
apt install zoxide

## ifuse
iphone mount on linux system
```sh
pacman -S ifuse
ifuse <directory>
fusermount -u <directory> # umount
```
## nvtop
nvidia graphic card usage monitor
```sh
wget https://github.com/Syllo/nvtop/releases/download/3.1.0/nvtop-x86_64.AppImage -O ~/.local/bin/nvtop
chmod +x ~/.local/bin/nvtop
nvtop
```
## unzip each type file
```sh
pacman -S unrar # rar file
unrar <file>
tar xvf FILE.tar.gz # tar.gz file
gzip -dk file.gz # gz file
gzip -d FILE.gz # gz file, remove origin file
unzip FILE.zip # zip file
unzip -l FILE.zip # show zip content
```
## gnuplot
plot by command tool
```sh
gnuplot -e  "set terminal png size 800,600;  plot [-4:4] exp(-x**2 / 2)" >a.png # save file, or "| icat" draw on terminal
gnuplot -e  "set terminal png size 800,600;  set output 'a.png'  plot [-4:4] exp(-x**2 / 2)"  # save a.png
```
## zsh plugins
`git clone https://github.com/popstas/zsh-command-time.git ~/.oh-my-zsh/custom/plugins/command-time`
show command cost time

