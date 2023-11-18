#
#對於一般使用者，還可以在 ~/.bashrc、~/.xinitrc 或是 ~/.xprofile 中設置語系，其中的不同處在於：
# .bashrc: 每次透過終端機登入時，讀取並運行其中的設定
# .xinitrc: 每次透過 startx 登入時，讀取並運行其中的設定
# .xprofile: 每次透過圖形登入器 (如 gdm) 登入時，讀取並運行其中的設定


# https://wiki.archlinuxcn.org/zh-tw/Fcitx
sudo -e /etc/environment
# add following environment variable to enable fcitx5
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx








