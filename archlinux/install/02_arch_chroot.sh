# time, language , hostname, host
ln -sf /usr/share/zoneinfo/Asia/Taipei /etc/localtime
hwclock --systohc
# vim /etc/locale.gen
echo "en_US.UTF-8 UTF-8"  >> /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8"    >>/etc/locale.conf
echo "arch-x260"           >> /etc/hostname  # set hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1 localhost"       >> /etc/hosts
echo "127.0.1.1 arch-x260" >> /etc/hosts

## IME setting
sudo echo "export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx" | sudo tee /etc/environment

passwd # set root password
useradd -m -G sudo,wheel,audio,video,storage -s /bin/bash siuoly # create user
        # -m: create home directory, -g: set primary group, -G: set list of groups, -s:set default shell
passwd siuoly

# privileged user set 特權使用者設定, 使其能用 sudo 命令
## 1. edit:/etc/sudoers 編輯該檔案, 取消108行註解
%wheel ALL=(ALL:ALL) ALL  # 所有屬於 wheel 群組的使用者可以使用任何(sudo)命令
   #"sudo是ubuntu,debian的群組，arch使用wheel群組來給使用者特權指令"

# ## 2.  /etc/sudoers 末行行加入內容:
# echo "siuoly ALL=(ALL:ALL) ALL" >> /etc/sudoers  # 使用者 siuoly 可以使用 sudo 命令

# ## 3.
# sudo usermod -aG wheel <username>  # 將使用者加入 wheel 群組

#NOTE:
# adduser is better than useradd, it is script

# pacman firmware install, base tool
pacman -S --noconfirm strongswan networkmanager-l2tp network-manager-applet\
 bluez  blueman pulseaudio pulseaudio-bluetooth alsa-utils intel-ucode \
 xorg xorg-server xorg-xinit xterm xdg-utils fuse unzip upower python tlp \
 xclip ripgrep fd zoxide htop pacman-contrib brightnessctl\
 fuse unzip upower tlp python lvm2\
 sudo zsh git openssh fakeroot base-devel wget\
 grub efibootmgr\
 maim feh yazi
# nvtop bluez-utils # optional 

# i3wm
pacman -S --noconfirm i3-wm polybar
# in ~/.xinitrc: add exec i3

# grub
# GRUB_CMDLINE_LINUX_DEFAULT="quiet splash nomodeset nvidia_drm.modeset=1"  # nvidia only
grub-install --target=x86_64-efi --bootloader-id=<GRUB> --efi-directory=/boot
grub-mkconfig -o /boot/grub/grub.cfg
ls /boot

systemctl enable NetworkManager
systemctl enable sshd.service
systemctl enable bluetooth.service
# exit arch
# umount /mnt/boot && umount /mnt
# reboot
#############################################################33

