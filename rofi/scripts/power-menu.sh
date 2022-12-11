#! /bin/sh

chosen=$(printf "  Power Off\n  Restart\n  Lock\n  Sign Out" | rofi -dmenu -i -theme-str '@import "simple-tokyonight.rasi"')

case "$chosen" in
	"  Power Off") systemctl poweroff ;;
	"  Restart") systemctl reboot ;;
	"  Lock") i3lock-fancy ;;
	"  Sign Out") bspc quit ;;

	*) exit 1 ;;
esac
