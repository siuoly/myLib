## zoxide: cd replacement
> qucik jump directory tool
pacman -S zoxide
apt install zoxide

## rsync: copy and paste
rsync -ah -P source destination # show copy progress

## trash: remove to trash
```sh
pacman -S trash-cli
 # /home/siuoly/.local/share/Trash
trash FILE
trash-restore FILE
```

## File Explore
### yazi
```sh
pacman -S yazi
# config folder  #  https://github.com/sxyazi/yazi/tree/latest/yazi-config/preset
#   /home/siuoly/.config/yazi
# .zshrc for moving to focusing directory when exit.
function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
```

### ranger 
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

#### tips
- preview pdf
  `pacman -S poppler`
  uncomment scope.sh:163 application/pdf)....
- column ratio
  :set columnratio 3,7 # large iamge preview window

- ranger preview image
  /home/siuoly/.config/ranger/rc.conf: set preview_images true

## dua,duf: disk usage tool
pacman -S dua-cli # analysis disk usage, for deleting largest file/directory \
pacman -S duf # better df


## zip:
```sh
pacman -S unarchiver # support diff encode(e.g. gbk), diff format(e.g. zip,rar,tar,gz)
unar -p PASSWD -o DIR  FILE.zip 
unar -e GBK  FILE.zip 
lsar FILE.zip # show info

pacman -S unrar # rar file
unrar <file>
tar xvf FILE.tar.gz # tar.gz file
tar xvzf FILE.tar.gz # ok
gzip -dk file.gz # gz file
gzip -d FILE.gz # gz file, remove origin file
unzip FILE.zip # zip file
unzip -l FILE.zip # show zip content

zip FILE.zip FILE1 FILE2 FILE3 # zip files
zip -r FILE.zip FILE1 DIR1  # zip directory
```

## iphone transfer file
### http method
https://pairdrop.net/   https://www.sharedrop.io/ https://snapdrop.net/
> 不能在 commandline 綁定目錄麻煩, 僅僅傳輸單一檔案簡單

opendrop # airdrop 模擬功能

pip install qr-filetransfer # python webserver
qr-filetransfer file
qr-filetransfer dir # zip files
qr-filetransfer -r dir # iphone upload to the dir

copyparty https://github.com/9001/copyparty


### usb transfer
https://github.com/doronz88/pymobiledevice3 # usb python transfer
https://github.com/alibaba/tidevice https://github.

### file server
dufs https://github.com/orhun/rustypaste # https file server transfer
pip install pyftpdlib # python ftp server
sambda server docker

### other host server
croc https://github.com/schollz/croc  # for cmdline transfer file
rustypaste https://github.com/orhun/rustypaste # A minimal file upload/pastebin service.

### ifuse
iphone mount on linux system
```sh
pacman -S ifuse
ifuse <directory>
fusermount -u <directory> # umount
```
## disk partition
expand efi system partition: `yay -S gparted`

## network browser
### samba
1. mount smb directory
sudo mount -t cifs -o username="siuoly",password="1234",uid=$(id -u),gid=$(id -g) //localhost/backupShare LOCAL_DIR
> uid,gid for edit permission, backupShare: is smb name,  LOCAL_DIR: local filesystem mounted dir 

2. thundar
pacman -S gvfs 
url bar: smb://localhost/backupshare/

## htop-vim: system monitor
```sh
git clone https://github.com/KoffeinFlummi/htop-vim.git
sudo pacman -S ncurses automake autoconf gcc 
# sudo apt install libncursesw5-dev autotools-dev autoconf automake build-essential
cd htop-vim && ./autogen.sh && ./configure && make
# cp htop ~/.local/bin  # local install
sudo make install
```

## cat
### bat
`wegt https://github.com/sharkdp/bat/releases/download/v0.24.0/bat_0.24.0_amd64.deb`
`sudo dpkg -i bat_0.24.0_amd64.deb` ubuntu
`pacman -S bat` archlinux
```sh
fd .. -X bat # open search by bat
fd .. --exec bat
yaml2json .travis.yml | json_pp | bat -l json # indicate lang from stdin
curl -s https://sh.rustup.rs | bat
```
### fzf
```sh
fd --type f --strip-cwd-prefix --color=always| fzf --ansi
# Setting fd as the default source for fzf
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix'
# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# default preview option
export FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --preview 'fzf-preview.sh {}'"

export FZF_PREVIEW_COMMAND="bat --style=numbers,changes --wrap never --color always {} || cat {} || tree -C {}"
export FZF_CTRL_T_OPTS="--min-height 30 --preview-window down:60% --preview-window noborder --preview '($FZF_PREVIEW_COMMAND) 2> /dev/null'"
```
