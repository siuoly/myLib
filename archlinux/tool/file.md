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
  /home/siuoly/.config/yazi
├──  flavors
├──  keymap.toml
├──  theme.toml
├──  yazi.toml
├──  keymap.toml.bak
└──  plugins
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
rustypaste https://github.com/orhun/rustypaste #A minimal file upload/pastebin service.

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

