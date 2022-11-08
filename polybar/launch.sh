#!/usr/bin/env bash
killall -q polybar
# wait untill process is down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
# Launch bars
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar bar1 2>&1 | tee -a /tmp/polybar1.log & disown
polybar bar2 2>&1 | tee -a /tmp/polybar2.log & disown
polybar bar3 2>&1 | tee -a /tmp/polybar2.log & disown
polybar bar4 2>&1 | tee -a /tmp/polybar2.log & disown
polybar bar5 2>&1 | tee -a /tmp/polybar2.log & disown
