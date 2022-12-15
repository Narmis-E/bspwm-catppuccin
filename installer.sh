#! /bin/bash

###### Narmis BSPWM Rice Installer ######

if [ "$EUID" -ne 0 ]; then
	echo "Please run as root (for copying files over to filesystem.)"
	exit
fi

echo "This script is capable of replacing directories and files inside the /home/$HOME dir. \nProceed? [Y/n]: "
read accept
if [ accept == ""]; then
else
	exit
fi

echo "Making directories..." && sleep 1
cd ~ && mkdir .dotfiles && mkdir ~/Downloads/git

echo "Installing packages..." && sleep 2
yay -S catppuccin-gtk-theme-mocha zscroll-git picom-pijulius-git 
sudo pacman -S bspwm sxhkd polybar lxappearance-gtk3 lxsession brightnessctl papirus-icon-theme playerctl rofi nitrogen tint2 nvim thunar

echo "Installing catppuccin papirus-folders..." && sleep 2
cd ~/Downloads/git/
git clone https://github.com/catppuccin/papirus-folders.git && cd papirus-folders
sudo cp -r src/* /usr/share/icons/Papirus
./papirus-folders -C cat-mocha-red --theme Papirus

echo "Installing and symlinking dots..." && sleep 2
cd ~ && git clone https://github.com/narmis-e/dotfiles && cp dotfiles .dotfiles && rm -rf dotfiles && cd .dotfiles
chmod 755 bspwm/bspwmrc sxhkd/sxhkdrc polybar/launch.sh polybar/scripts/cava.sh polybar/scripts/dexcom.sh polybar/scripts/playerctl.sh rofi/scripts/bluetooth.sh rofi/scripts/power-menu.sh rofi/scripts/wifi-menu.sh

###### BSPWM ################################################################################
[ -d "$HOME/.config/bspwm" ] && echo "Directory $HOME/.config/bspwm exists, replace? [Y/n]: "
read accept
if [ accept == "" ]; then
	rm -rf $HOME/.config/bspwm
	echo "Removed $HOME/.config/bspwm"
else
	echo "Skipped directory."
fi
ln -sf $HOME/.dotfiles/bspwm $HOME/.config/
#############################################################################################

###### SXHKD ################################################################################
[ -d "$HOME/.config/sxhkd" ] && echo "Directory $HOME/.config/sxhkd exists, replace? [Y/n]: "
read accept
if [ accept == "" ]; then
	rm -rf $HOME/.config/sxhkd
	echo "Removed $HOME/.config/sxhkd"
else
	echo "Skipped directory."
fi
ln -sf $HOME/.dotfiles/sxhkd $HOME/.config/
#############################################################################################

###### POLYBAR ##################################################################################
[ -d "$HOME/.config/polybar" ] && echo "Directory $HOME/.config/polybar exists, replace? [Y/n]: "
read accept
if [ accept == "" ]; then
	rm -rf $HOME/.config/polybar
	echo "Removed $HOME/.config/polybar"
else
	echo "Skipped directory."
fi
ln -sf $HOME/.dotfiles/polybar $HOME/.config/
#################################################################################################

###### TINT2 ################################################################################
[ -d "$HOME/.config/tint2" ] && echo "Directory $HOME/.config/tint2 exists, replace? [Y/n]: "
read accept
if [ accept == "" ]; then
	rm -rf $HOME/.config/tint2
	echo "Removed $HOME/.config/tint2"
else
	echo "Skipped directory."
fi
ln -sf $HOME/.dotfiles/tint2 $HOME/.config/
#############################################################################################

###### NEOFETCH ###################################################################################
[ -d "$HOME/.config/neofetch" ] && echo "Directory $HOME/.config/neofetch exists, replace? [Y/n]: "
read accept
if [ accept == "" ]; then
	rm -rf $HOME/.config/neofetch
	echo "Removed $HOME/.config/neofetch"
else
	echo "Skipped directory."
fi
ln -sf $HOME/.dotfiles/neofetch $HOME/.config/
###################################################################################################

###### NEOVIM #############################################################################
[ -d "$HOME/.config/nvim" ] && echo "Directory $HOME/.config/nvim exists, replace? [Y/n]: "
read accept
if [ accept == "" ]; then
	rm -rf $HOME/.config/nvim
	echo "Removed $HOME/.config/nvim"
else
	echo "Skipped directory."
fi
ln -sf $HOME/.dotfiles/nvim $HOME/.config/
###########################################################################################

###### ROFI ###############################################################################
[ -d "$HOME/.config/rofi" ] && echo "Directory $HOME/.config/rofi exists, replace? [Y/n]: "
read accept
if [ accept == "" ]; then
	rm -rf $HOME/.config/rofi
	echo "Removed $HOME/.config/rofi"
else
	echo "Skipped directory."
fi
ln -sf $HOME/.dotfiles/rofi $HOME/.config/
###########################################################################################

echo "Adding Iosevka Nerd Font..." && sleep 1
sudo cp ~/.dotfiles/fonts/'Iosevka Term Nerd Font Complete.ttf' /usr/share/fonts
