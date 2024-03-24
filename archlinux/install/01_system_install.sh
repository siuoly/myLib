#
#Archlinux 安装教程超详细（2021.11.15）https://zhuanlan.zhihu.com/p/433920079
#Arch Linux安裝教學，KDE Plasma桌面＋中文輸入法 https://ivonblog.com/posts/install-archlinux/ 
#Arch Linux 基础安装 https://archlinuxstudio.github.io/ArchLinuxTutorial/#/rookie/basic_install?id=arch-linux-%e5%9f%ba%e7%a1%80%e5%ae%89%e8%a3%85

#1. vim /etc/pacman.d/mirrorlist

## mount partition
mount /dev/lvm00/root /mnt #主目錄掛接
mkdir -p /mnt/home
mkdir -p /mnt/boot
mount /dev/lvm00/home /mnt/home #主目錄掛接
mount /dev/sda1 /mnt/boot
swapon /dev/lvm00/swap && swapon --show && free -h

## pacman mirrorlist 前處理
systemctl stop reflector.service

## network connection
iwctl #执行iwctl命令，进入交互式命令行

pacman -Syy
pacman -S archlinux-keyring
pacstrap -K /mnt base linux linux-firmware vim dhcpcd networkmanager iwd 

# fstab 
genfstab -U /mnt >> /mnt/etc/fstab
cat /mnt/etc/fstab

# arch-chroot /mnt # go into th

