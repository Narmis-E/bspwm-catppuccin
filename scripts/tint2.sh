killall -q tint2
tint2 & disown
sleep 0.1 &&
if pgrep -x "tint2" > /dev/null ; then
xdo above -t "$(xdo id -N Bspwm -n root | sort | head -n 1)" $(x>
fi
