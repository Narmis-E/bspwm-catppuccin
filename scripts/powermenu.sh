#! /bin/sh

chosen=$(printf "  Power Off\n  Restart\n  Lock\n  Sign Out" | rofi -dmenu -i -theme-str '@import "squared-material-red.rasi"')

case "$chosen" in
	"  Power Off") xfce4-session-logout --halt --fast ;;
	"  Restart") xfce4-session-logout --reboot --fast ;;
	"  Lock") i3lock-fancy ;;
	"  Sign Out") xfce4-session-logout --logout ;;

	*) exit 1 ;;
esac
