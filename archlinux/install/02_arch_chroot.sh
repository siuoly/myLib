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

# create user
passwd # root password change
useradd -m -g users -G wheel,audio,video,storage -s /bin/bash siuoly # <user>
passwd siuoly #<user>
# edit:/etc/sudoers
# user ALL=(ALL:ALL) ALL #在"root ALL=(ALL:ALL) ALL"的下一行加入內容:
echo "siuoly ALL=(ALL:ALL) ALL" >> /etc/sudoers

# pacman firmware install, base tool
pacman -S strongswan network-manager-applet\
 bluez  bluez-utils pulseaudio pulseaudio-bluetooth alsa-utils intel-ucode \
 xorg xorg-server xorg-xinit xterm xdg-utils fuse unzip upower python tlp \
 xclip ripgrep fd zoxide htop pacman-contrib brightnessctl\
 fuse unzip upower tlp python lvm2\
 sudo zsh git openssh fakeroot base-devel wget\
 grub efibootmgr\
 maim feh ranger
# nvtop # optional 

# i3wm
pacman -S i3-wm polybar
# in ~/.xinitrc: add exec i3

# grub
# GRUB_CMDLINE_LINUX_DEFAULT="quiet splash nomodeset nvidia_drm.modeset=1"  # nvidia only
grub-install --target=x86_64-efi --bootloader-id=<GRUB> --efi-directory=/boot
grub-mkconfig -o /boot/grub/grub.cfg
ls /boot

systemctl enable NetworkManager
systemctl enable sshd.service
# exit arch
# umount /mnt/boot && umount /mnt
# reboot
#############################################################33

