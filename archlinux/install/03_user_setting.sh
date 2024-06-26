## yay , login in user
pacman -S --noconfirm --needed git base-devel && git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si
# yay tool use package
yay -S flameshot ly xsct xst keyd ttf-comic-mono-git copytranslator-bin
# yay -S ttf-lxgw-wenkai ttf-maple
# pacman --noconfirm -S otf-comicshanns-nerd
sudo systemctl enable ly.service --now

## oh-my-zsh oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/popstas/zsh-command-time.git ~/.oh-my-zsh/custom/plugins/command-time

## install font, browser, vscode
sudo pacman -S --noconfirm noto-fonts-cjk noto-fonts-emoji ttf-firacode-nerd terminus-font # otf-droid-nerd # font 
wget -P $HOME https://github.com/subframe7536/maple-font/releases/download/v7.0-beta16/MapleMono-NF-CN.zip
sudo unzip $HOME/MapleMono-NF-CN.zip -d /usr/share/fonts/MapleMono
# fixme)) todo)) [TRACE] [WARN] [ERROR] [FATAL] [FATAL] 
# maple font usage [ https://github.com/subframe7536/maple-font/releases?page=1 ]
sudo pacman -S --noconfirm firefox # browser
sudo pacman -S --noconfirm rofi alacritty exa npm github-cli lazygit chezmoi # tool
sudo pacman -S --noconfirm fcitx5-im fcitx5-rime # fcitx5-chewing  IME input method
sudo pacman -S --noconfirm dua-client duf  # file tool
# pacman -S visual-studio-code-bin libreoffice-still-zh-tw pavucontrol # sound testing

## fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

## tailscale
curl -fsSL https://tailscale.com/install.sh | sh

## pyenv
curl https://pyenv.run | bash

## git setting
git config --global user.name "x260-siuoly"
git config --global user.email "louis@gmial.com"

## git-clone myLib nvim-old
ssh-keygen -t rsa
gh auth login
gh repo clone siuoly/myLib

## chezmoi
chezmoi init git@github.com:siuoly/dotfiles.git --apply

pacman -S nvm nodejs # node arch
# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash # node ubuntu
# nvm install 20

## nvim appimage:
#wget https://github.com/neovim/neovim/releases/download/v0.9.4/nvim.appimage
#mv nvim.appimage ~/.local/bin/nvim
#cd ~/.local/bin/
#ln -s nvim nv

## nvim install archhlinux
git clone https://github.com/neovim/neovim
sudo pacman -S --noconfirm base-devel cmake unzip ninja curl # archlinux
cd neovim && git checkout stable && make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install # archlinux install
sudo pacman -S --noconfirm tree-sitter-cli python-neovim # archlinux need for nvim

# # nvim install ubuntu
# git clone https://github.com/neovim/neovim
# sudo apt-get install ninja-build gettext cmake unzip curl # ubuntu
# cd neovim && git checkout stable && make CMAKE_BUILD_TYPE=RelWithDebInfo
# cd build && cpack -G DEB && sudo dpkg -i nvim-linux64.deb # ubuntu install
# pip install neovim # ubuntu need for nvim
# npm -g install tree-sitter-cli

git clone git@github.com:siuoly/LazyVim.config.git ~/.config/nvim
# # nvchad
# gh repo clone siuoly/nvim-basic-ide ~/.config/nvim-old
# git clone --branch v2.0 https://github.com/NvChad/Nvchad ~/.config/nvim && nvim
# ln -s ~/.config/nvim-old/custom ~/.config/nvim/lua
# ln -s ~/.config/nvim-old/ftplugin ~/.config/nvim

## keyd
sudo systemctl enable keyd --now
sudo ln -s ~/.config/keyd/default.conf /etc/keyd/
sudo keyd reload

## other setting
brightnessctl s 852
xsct 3000 0.8

# nvim other:
pacman -S --noconfirm sdcv translate-shell # 星際譯王, google online 多國翻譯

