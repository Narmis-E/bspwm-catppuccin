#!/usr/bin/env bash
killall -q polybar
# wait untill process is down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
# Launch bars
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar powermenu 2>&1 | tee -a /tmp/polybar1.log & disown
polybar timespace 2>&1 | tee -a /tmp/polybar2.log & disown
polybar playerctl 2>&1 | tee -a /tmp/polybar2.log & disown
polybar cava 2>&1 | tee -a /tmp/polybar2.log & disown
polybar dexcom 2>&1 | tee -a /tmp/polybar2.log & disown
polybar net 2>&1 | tee -a /tmp/polybar2.log & disown
polybar sysinfo 2>&1 | tee -a /tmp/polybar2.log & disown
