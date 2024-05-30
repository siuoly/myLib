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
pacman -S networkmanager strongswan network-manager-applet
pacman -S bluez  bluez-utils pulseaudio pulseaudio-bluetooth alsa-utils intel-ucode 
pacman -S xorg xorg-server xorg-xinit xterm fuse unzip upower python tlp 
pacman -S xclip ripgrep fd zoxide htop xdg-utils pacman-contrib brightnessctl
pacman -S fuse unzip upower tlp python 
pacman -S sudo zsh git openssh fakeroot base-devel wget # 開發工具
pacman -S grub efibootmgr
pacman -S maim feh yazi
nvtop # optional 


passwd # set root password
# create user
useradd -m -G sudo,wheel,audio,video,storage -s /bin/bash <user>
      "-m: create home directory, -g: set primary group(default same with <user>), -G: set list of groups, -s:set default shell"
passwd <user>

# privileged user set 特權使用者設定, 使其能用 sudo 命令
## 1. edit:/etc/sudoers 編輯該檔案, 取消108行註解
%wheel ALL=(ALL:ALL) ALL  # 所有屬於 wheel 群組的使用者可以使用任何(sudo)命令
"sudo是ubuntu,debian的群組，arch使用wheel群組來給使用者特權指令"
## 2.  /etc/sudoers 末行行加入內容:
echo "siuoly ALL=(ALL:ALL) ALL" >> /etc/sudoers  # 使用者 siuoly 可以使用 sudo 命令
## 3.
sudo usermod -aG wheel <username>  # 將使用者加入 wheel 群組


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
pacman -S noto-fonts-cjk noto-fonts-emoji ttf-firacode-nerd otf-droid-nerd # font 
pacman -S firefox
pacman -S fcitx5-im fcitx5-chewing fcitx5-rime # IME input method
pacman -S --noconfirm dua-client duf unarchiver  # file tool
pacman -S visual-studio-code-bin libreoffice-still-zh-tw pavucontrol # sound testing


## yay
pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si
# yay tool use packager
yay -S ly xsct xst keyd ttf-comic-mono-git rofi-bluetooth-git copytranslator-bin ttf-lxgw-wenkai
pacman -S otf-comicshanns-nerd

## tailscale
curl -fsSL https://tailscale.com/install.sh | sh

## nvim appimage:
wget https://github.com/neovim/neovim/releases/download/v0.9.4/nvim.appimage
mv nvim.appimage ~/.local/bin/nvim
cd ~/.local/bin/
ln -s nvim nv

## nvim install archhlinux
git clone https://github.com/neovim/neovim
sudo pacman -S --noconfirm base-devel cmake unzip ninja curl # archlinux
cd neovim && git checkout stable && make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install # archlinux install
sudo pacman -S --noconfirm python-neovim # archlinux need for nvim

# nvim install ubuntu
git clone https://github.com/neovim/neovim
cd neovim && git checkout stable && make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo apt-get install ninja-build gettext cmake unzip curl # ubuntu
cd build && cpack -G DEB && sudo dpkg -i nvim-linux64.deb # ubuntu install
pip install neovim # ubuntu need for nvim
# nvchad
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim

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

############# lvm #################################
物理卷 (PV) MBR GPT分区 被内核映射的设备
卷组 (VG) <LeftMouse>物理卷的一个组
逻辑卷 (LV)  "虚拟/逻辑卷" 
物理块 (PE) 一个卷组中最小的连续区域(默认为4 MiB)，
lvmdiskscan 列出可被用作物理卷的设备
pvcreate DEVICE 在列出的设备上创建物理卷： 
# pvcreate /dev/sda2
pvdisplay 你可以用以下命令查看已创建好的物理卷：
vgcreate <volume_group> <physical_volume> 创建卷组（VG）
# vgcreate VolGroup00 /dev/sda2
vgextend <卷组名> <物理卷> 让该卷组扩大到其他所有的物理卷:
# vgextend VolGroup00 /dev/sdb1
# vgextend VolGroup00 /dev/sdc
vgcreate VolGroup00 /dev/sda2 /dev/sdb1 /dev/sdc 一步创建卷组
lvcreate -L <卷大小> <"卷组名"> -n <卷名>
# lvcreate -L 10G VolGroup00 -n lvolhome
# lvcreate -L 30G lvm -n root
# lvcreate -L 8G lvm -n swap
# lvcreate -l 100% lvm -n home

mkfs.fat -F32 /dev/sda1 # Format the boot partition first
mkfs.ext4 /dev/lvm/root # Format the other partitions
mkfs.ext4 /dev/lvm/home
该逻辑卷创建完后，你就可以通过/dev/mapper/Volgroup00-lvolhome或/dev/VolGroup00/lvolhome来访问它。与卷组命名类似，你可以按你的需要将逻辑卷命名。

# edit /etc/mkinitcpio.conf,  add "lvm2" between block and filesystems
HOOKS=(base udev autodetect microcode modconf kms keyboard keymap consolefont block lvm2 filesystems fsck)
mkinitcpio -P
#################################################################################################3
# create swap 
## from https://linuxize.com/post/create-a-linux-swap-file/
sudo fallocate -l 8G /swapfile # or following ,optional
# sudo dd if=/dev/zero of=/swapfile bs=1024 count=1048576 # 1024*1024=1048576(1G)
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
      # edit /etc/fstab
      /swapfile swap swap defaults 0 0 # add new line
sudo swapon --show # test success
sudo free -h
# remove swap
sudo swapoff -v /swapfile
      # edit /etc/fstab
      /swapfile swap swap defaults 0 0 # remove line
sudo rm /swapfile
