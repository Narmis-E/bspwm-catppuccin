#! /bin/bash

yay -S catppuccin-gtk-theme-mocha zscroll-git
sudo pacman -S lxappearance-gtk3 lxsession brightnessctl papirus-icon-theme playerctl

mkdir ~/Downloads/git && cd ~/Downloads/git/
git clone https://github.com/catppuccin/papirus-folders.git && cd papirus-folders
sudo cp -r src/* /usr/share/icons/Papirus
./papirus-folders -C cat-mocha-red --theme Papirus
