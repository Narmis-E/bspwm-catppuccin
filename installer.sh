#! /bin/bash

###### Narmis BSPWM Rice Installer ######

if [ "$EUID" -ne 0 ]; then
	echo "Please run as root (for copying files over to filesystem.)"
	exit
fi

read -p "This script is capable of replacing directories and files inside the /home/$USER dir. Proceed? [Y/n]: " accept

if [ "$accept" = "" ]; then
	echo "Making directories..." && sleep 1
	cd $HOME/.dotfiles && mkdir $HOME/Downloads/git && cd $HOME/Downloads/git
	
	echo "Installing packages..." && sleep 2
	pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
	yay -S catppuccin-gtk-theme-mocha zscroll-git picom-pijulius-git 
	sudo pacman -S bspwm sxhkd polybar lxappearance-gtk3 lxsession brightnessctl papirus-icon-theme playerctl rofi nitrogen tint2 neovim thunar

	echo "Installing catppuccin papirus-folders..." && sleep 2
	cd $HOME/Downloads/git/
	git clone https://github.com/catppuccin/papirus-folders.git && cd papirus-folders
	sudo cp -r src/* /usr/share/icons/Papirus
	./papirus-folders -C cat-mocha-red --theme Papirus

	echo "Installing and symlinking dots..." && sleep 2
	chmod 755 $HOME/.dotfiles/bspwm/bspwmrc $HOME/.dotfiles/sxhkd/sxhkdrc $HOME/.dotfiles/polybar/launch.sh $HOME/.dotfiles/polybar/scripts/cava.sh $HOME/.dotfiles/polybar/scripts/dexcom.sh $HOME/.dotfiles/polybar/scripts/playerctl.sh $HOME/.dotfiles/rofi/scripts/bluetooth.sh $HOME/.dotfiles/rofi/scripts/power-menu.sh $HOME/.dotfiles/rofi/scripts/wifi-menu.sh

	###### BSPWM ################################################################################
	[ -d "$HOME/.config/bspwm" ] && echo "Directory $HOME/.config/bspwm exists, replace? [Y/n]: "
	read bspwm_accept
	if [ "$bspwm_accept" = "" ]; then
		rm -rf $HOME/.config/bspwm
		echo "Removed $HOME/.config/bspwm"
	else
		echo "Skipped directory."
	fi
	ln -sf $HOME/.dotfiles/bspwm $HOME/.config/
	#############################################################################################

	###### SXHKD ################################################################################
	[ -d "$HOME/.config/sxhkd" ] && echo "Directory $HOME/.config/sxhkd exists, replace? [Y/n]: "
	read sxhkd_accept
	if [ "$sxhkd_accept" = "" ]; then
		rm -rf $HOME/.config/sxhkd
		echo "Removed $HOME/.config/sxhkd"
	else
		echo "Skipped directory."
	fi
	ln -sf $HOME/.dotfiles/sxhkd $HOME/.config/
	#############################################################################################

	###### POLYBAR ##################################################################################
	[ -d "$HOME/.config/polybar" ] && echo "Directory $HOME/.config/polybar exists, replace? [Y/n]: "
	read poly_accept
	if [ "$poly_accept" = "" ]; then
		rm -rf $HOME/.config/polybar
		echo "Removed $HOME/.config/polybar"
	else
		echo "Skipped directory."
	fi
	ln -sf $HOME/.dotfiles/polybar $HOME/.config/
	#################################################################################################

	###### TINT2 ################################################################################
	[ -d "$HOME/.config/tint2" ] && echo "Directory $HOME/.config/tint2 exists, replace? [Y/n]: "
	read tint_accept
	if [ "$tint_accept" = "" ]; then
		rm -rf $HOME/.config/tint2
		echo "Removed $HOME/.config/tint2"
	else
		echo "Skipped directory."
	fi
	ln -sf $HOME/.dotfiles/tint2 $HOME/.config/
	#############################################################################################

	###### NEOFETCH ###################################################################################
	[ -d "$HOME/.config/neofetch" ] && echo "Directory $HOME/.config/neofetch exists, replace? [Y/n]: "
	read neo_accept
	if [ "$neo_accept" = "" ]; then
		rm -rf $HOME/.config/neofetch
		echo "Removed $HOME/.config/neofetch"
	else
		echo "Skipped directory."
	fi
	ln -sf $HOME/.dotfiles/neofetch $HOME/.config/
	###################################################################################################

	###### NEOVIM #############################################################################
	[ -d "$HOME/.config/nvim" ] && echo "Directory $HOME/.config/nvim exists, replace? [Y/n]: "
	read $vim_accept
	if [ "$vim_accept" = "" ]; then
		rm -rf $HOME/.config/nvim
		echo "Removed $HOME/.config/nvim"
	else
		echo "Skipped directory."
	fi
	ln -sf $HOME/.dotfiles/nvim $HOME/.config/
	###########################################################################################

	###### ROFI ###############################################################################
	[ -d "$HOME/.config/rofi" ] && echo "Directory $HOME/.config/rofi exists, replace? [Y/n]: "
	read rofi_accept
	if [ "$rofi_accept" = "" ]; then
		rm -rf $HOME/.config/rofi
		echo "Removed $HOME/.config/rofi"
	else
		echo "Skipped directory."
	fi
	ln -sf $HOME/.dotfiles/rofi $HOME/.config/
	###########################################################################################

	echo "Adding Iosevka Nerd Font..." && sleep 1
	sudo cp ~/.dotfiles/fonts/'Iosevka Term Nerd Font Complete.ttf' /usr/share/fonts
else
	echo "Exited."
	exit
fi


