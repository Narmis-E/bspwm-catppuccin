#! /bin/bash

###### Narmis BSPWM Rice Installer ######

read -p "This script is capable of replacing directories and files inside the /home/$USER dir. Proceed? [Y/n]: " accept

if [ "$accept" = "" ]; then
	echo "Making directories..." && sleep 1
	cd $HOME/.dotfiles && mkdir $HOME/Downloads/git && cd $HOME/Downloads/git
	
	echo "Installing packages..." && sleep 1
	sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
	yay -S catppuccin-gtk-theme-mocha zscroll-git picom-pijulius-git xcursor-breeze bspwm-rounded-corners-git
	sudo pacman -S sxhkd polybar lxappearance-gtk3 lxsession brightnessctl papirus-icon-theme playerctl rofi nitrogen tint2 neovim thunar exa dunst

	echo "Installing catppuccin papirus-folders..." && sleep 1
	cd $HOME/Downloads/git/
	git clone https://github.com/catppuccin/papirus-folders.git && cd papirus-folders
	sudo cp -r src/* /usr/share/icons/Papirus
	./papirus-folders -C cat-mocha-red --theme Papirus

	echo "Installing vim-plug..." && sleep 1
	sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

	echo "Installing and symlinking dots..." && sleep 1
	chmod 755 $HOME/.dotfiles/bspwm/bspwmrc $HOME/.dotfiles/sxhkd/sxhkdrc $HOME/.dotfiles/polybar/launch.sh $HOME/.dotfiles/polybar/scripts/cava.sh $HOME/.dotfiles/polybar/scripts/dexcom.sh $HOME/.dotfiles/polybar/scripts/playerctl.sh $HOME/.dotfiles/rofi/scripts/bluetooth.sh $HOME/.dotfiles/rofi/scripts/power-menu.sh $HOME/.dotfiles/rofi/scripts/wifi-menu.sh && echo ""

	###### BSPWM ################################################################################
	[ -d "$HOME/.config/bspwm" ] && echo "Directory $HOME/.config/bspwm exists, replace? [Y/n]: " && read bspwm_accept
	if [ "$bspwm_accept" = "" ]; then
		rm -rf $HOME/.config/bspwm
		echo "Removed $HOME/.config/bspwm"
	else
		echo "Skipped directory."
	fi
	ln -sf $HOME/.dotfiles/bspwm $HOME/.config/

	###### SXHKD ################################################################################
	[ -d "$HOME/.config/sxhkd" ] && echo "Directory $HOME/.config/sxhkd exists, replace? [Y/n]: " && read sxhkd_accept
	if [ "$sxhkd_accept" = "" ]; then
		rm -rf $HOME/.config/sxhkd
		echo "Removed $HOME/.config/sxhkd"
	else
		echo "Skipped directory."
	fi
	ln -sf $HOME/.dotfiles/sxhkd $HOME/.config/

	###### POLYBAR ##################################################################################
	[ -d "$HOME/.config/polybar" ] && echo "Directory $HOME/.config/polybar exists, replace? [Y/n]: " && read poly_accept
	if [ "$poly_accept" = "" ]; then
		rm -rf $HOME/.config/polybar
		echo "Removed $HOME/.config/polybar"
	else
		echo "Skipped directory."
	fi
	ln -sf $HOME/.dotfiles/polybar $HOME/.config/

	###### TINT2 ################################################################################
	[ -d "$HOME/.config/tint2" ] && echo "Directory $HOME/.config/tint2 exists, replace? [Y/n]: " && read tint_accept
	if [ "$tint_accept" = "" ]; then
		rm -rf $HOME/.config/tint2
		echo "Removed $HOME/.config/tint2"
	else
		echo "Skipped directory."
	fi
	ln -sf $HOME/.dotfiles/tint2 $HOME/.config/

	###### NEOFETCH ###################################################################################
	[ -d "$HOME/.config/neofetch" ] && echo "Directory $HOME/.config/neofetch exists, replace? [Y/n]: " && read neo_accept
	if [ "$neo_accept" = "" ]; then
		rm -rf $HOME/.config/neofetch
		echo "Removed $HOME/.config/neofetch"
	else
		echo "Skipped directory."
	fi
	ln -sf $HOME/.dotfiles/neofetch $HOME/.config/

	###### NEOVIM ################################################################################################
	[ -d "$HOME/.config/nvim" ] && echo "Directory $HOME/.config/nvim exists, replace? [Y/n]: " && read vim_accept
	if [ "$vim_accept" = "" ]; then
		rm -rf $HOME/.config/nvim
		echo "Removed $HOME/.config/nvim"
	else
		echo "Skipped directory."
	fi
	ln -sf $HOME/.dotfiles/nvim $HOME/.config/

	###### ROFI ###################################################################################################
	[ -d "$HOME/.config/rofi" ] && echo "Directory $HOME/.config/rofi exists, replace? [Y/n]: " && read rofi_accept
	if [ "$rofi_accept" = "" ]; then
		rm -rf $HOME/.config/rofi
		echo "Removed $HOME/.config/rofi"
	else
		echo "Skipped directory."
	fi
	ln -sf $HOME/.dotfiles/rofi $HOME/.config/
	
	###### TERMITE #########################################################################################################
	[ -d "$HOME/.config/termite" ] && echo "Directory $HOME/.config/termite exists, replace? [Y/n]: " && read termite_accept
	if [ "$termite_accept" = "" ]; then
		rm -rf $HOME/.config/termite
		echo "Removed $HOME/.config/termite"
	else
		echo "Skipped directory."
	fi
	ln -sf $HOME/.dotfiles/termite $HOME/.config/

	###### DUNST #########################################################################################################
	[ -d "$HOME/.config/dunst" ] && echo "Directory $HOME/.config/dunst exists, replace? [Y/n]: " && read dunst_accept
	if [ "$dunst_accept" = "" ]; then
		rm -rf $HOME/.config/dunst
		echo "Removed $HOME/.config/dunst"
	else
		echo "Skipped directory."
	fi
	ln -sf $HOME/.dotfiles/dunst $HOME/.config/

	###### PICOM #####################################################################################################
	[ -d "$HOME/.config/picom" ] && echo "Directory $HOME/.config/picom exists, replace? [Y/n]: " && read picom_accept
	if [ "$picom_accept" = "" ]; then
		rm -rf $HOME/.config/picom
		echo "Removed $HOME/.config/picom"
	else
		echo "Skipped directory."
	fi
	ln -sf $HOME/.dotfiles/picom $HOME/.config/

	###########################################

	###### WALLPAPERS #####################################
	ln -sf $HOME/.dotfiles/images/wallpapers $HOME/Pictures
	###### BASHRC #########################################
	ln -sf $HOME/.dotfiles/bash/.bashrc $HOME/
	###### GTK-3.0 ######################################
	ln -sf $HOME/.dotfiles/gtk-3.0/gtk.css $HOME/.config/
	ln -sf $HOME/.dotfiles/gtk-3.0/settings.ini $HOME/.config
	#########################################################
	
	echo "Adding fonts and applying GTK-3 config..." && sleep 1
	sudo cp $HOME/.dotfiles/fonts/'Iosevka Term Nerd Font Complete.ttf' /usr/share/fonts
	sudo cp $HOME/.dotfiles/fonts/'DejaVuSansMono-wifi-ramp.ttf' /usr/share/fonts

	echo "Run ':PlugInstall' inside of nvim to install all of the plugins. Installation complete!"

	###### END OF INSTALLER ######################################################################
else
	echo "Exited."
				exit
fi
