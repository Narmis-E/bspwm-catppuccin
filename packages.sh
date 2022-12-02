#! /bin/bash

my_dir=`dirname $0`

yay -S catppuccin-gtk-theme-mocha zscroll-git
sudo pacman -S bspwm sxhkd polybarlxappearance-gtk3 lxsession brightnessctl papirus-icon-theme playerctl rofi nitrogen tint2

mkdir ~/Downloads/git && cd ~/Downloads/git/
git clone https://github.com/catppuccin/papirus-folders.git && cd papirus-folders
sudo cp -r src/* /usr/share/icons/Papirus
./papirus-folders -C cat-mocha-red --theme Papirus
sudo mv $my_dir/fonts/'Iosevka Term Nerd Font Complete.ttf' /usr/share/fonts
