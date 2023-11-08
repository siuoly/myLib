#
#Archlinux 安装教程超详细（2021.11.15）https://zhuanlan.zhihu.com/p/433920079
#Arch Linux安裝教學，KDE Plasma桌面＋中文輸入法 https://ivonblog.com/posts/install-archlinux/ 
#Arch Linux 基础安装 https://archlinuxstudio.github.io/ArchLinuxTutorial/#/rookie/basic_install?id=arch-linux-%e5%9f%ba%e7%a1%80%e5%ae%89%e8%a3%85
## pacman mirrorlist 前處理
systemctl stop reflector.service
## network connection
iwctl                           #执行iwctl命令，进入交互式命令行
device list                     #列出设备名，比如无线网卡看到叫 wlan0
station wlan0 scan              #扫描网络
station wlan0 get-networks      #列出网络 比如想连接YOUR-WIRELESS-NAME这个无线
station wlan0 connect YOUR-WIRELESS-NAME #进行连接 输入密码即可
exit                            #成功后exit退出

## clean old disk
lsblk 
cfdisk /dev/sd<n>  # 選擇gpt分區
# new : 創建新分區, 若沒有 efi 者 ，type 選項 改變分區類型
fdisk -l #查看修改情況
mkfs.ext4 /dev/sda<n> # 把主要空間硬碟格式化 ext4
mkfs.fat -F32 /dev/sda1  #把efi 磁碟格式化 為fat32, 雙系統不需要此步驟
mkfs.vfat /dev/sda1  # 第二種efi格式
lsblk -f 查看分區格式
mount /dev/sda<n> /mnt #主目錄掛接
mkdir /mnt/boot    # efi 分區掛接
mount /dev/sda1 /mnt/boot

# pacman mirrorlist 更新
# 生成器 https://archlinux.org/mirrorlist/?country=TW&protocol=http&protocol=https&ip_version=4
vim /etc/pacman.d/mirrorlist
Server = https://mirror.archlinux.tw/ArchLinux/$repo/os/$arch
Server = https://free.nchc.org.tw/arch/$repo/os/$arch

pacman -Syy
pacstrap -K /mnt base linux linux-firmware nano # /mnt/boot 可能裝不下，移除fallback檔案
pacstrap /mnt dhcpcd networkmanager iwd # 網路工具

# fstab 
genfstab -U /mnt >> /mnt/etc/fstab
cat /mnt/etc/fstab

arch-chroot /mnt

# time, language , hostname, host
ln -sf /usr/share/zoneinfo/Asia/Taipei /etc/localtime
hwclock --systohc

vim /etc/locale.gen
en_US.UTF-8 UTF-8  # uncomment
locale-gen
echo "LANG=en_US.UTF-8" >>/etc/locale.conf

echo "HostName-eg-ArchLinux" >> /etc/hostname  # set hostname

echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1 localhost" >> /etc/hosts
echo "127.0.1.1 HostName-eg-ArchLinux" >> /etc/hosts

# pacman firmware install, base tool
pacman -S networkmanager strongswan
pacman -S bluez  bluez-utils pulseaudio pulseaudio-bluetooth intel-ucode 
pacman -S xorg xorg-server xinit xterm fuse unzip upower python tlp 
pacman -S xclip ripgrep zoxide htop pacman-contrib brightnessctl
pacman -S fuse unzip upower tlp python 
pacman -S sudo zsh git openssh fakeroot base-devel wget # 開發工具
pacman -S grub efibootmgr
pacman -S maim feh ranger
nvtop # optional 


# create user
passwd # root password change
useradd -m -g users -G wheel,audio,video,storage -s /bin/bash <user>
passwd <user>
vim /etc/sudoers
user ALL=(ALL:ALL) ALL #在"root ALL=(ALL:ALL) ALL"的下一行加入內容:


# grub
# GRUB_CMDLINE_LINUX_DEFAULT="quiet splash nomodeset nvidia_drm.modeset=1"  # nvidia only
grub-install --target=x86_64-efi --bootloader-id=GRUB --efi-directory=/boot
grub-mkconfig -o /boot/grub/grub.cfg
ls /boot

# i3wm
pacman -S i3wm polybar
# in ~/.xinitrc: add exec i3

# kde
pacman -S plasma-meta kde-applications plasma-wayland-session packagekit-qt5 konsole dolphin plasma-nm  networkmanager-l2tp kscreen sddm-kcm
systemctl enable sddm.service # sddm (login window tool)

# exit
systemctl enable NetworkManager
systemctl enable sshd.service
exit
umount /mnt/boot
umount /mnt
shutdown now
    拔掉開機隨身碟後重開機。
#############################################################33
pacman -S noto-fonts-cjk noto-fonts-emoji # font
pacman -S firefox
pacman -S fcitx5-im fcitx5-chewing fcitx5-rime # inputmethod

## yay
pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si
# yay use packager
yay ly xsct xst keyd ttf-comic-mono-git rofi-bluetooth-git
pacman -S otf-comicshanns-nerd

## tailscale
curl -fsSL https://tailscale.com/install.sh | sh

## nvim:
wget https://github.com/neovim/neovim/releases/download/v0.9.4/nvim.appimage

mv nvim.appimage ~/.local/bin/nvim
cd ~/.local/bin/
ln -s nvim nv
pip install neovim


## oh-my-zsh oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
     # .zshrc
ZSH_THEME="tjkirch"
plugins=(git last-working-dir sudo)

## pyenv
curl https://pyenv.run | bash

echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init -)"' >> ~/.zshrc

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

## copytranslator
