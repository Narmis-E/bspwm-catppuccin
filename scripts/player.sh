#!/usr/bin/env bash

playerctlstatus=$(playerctl status > /dev/null 2>&1)
#playerctlstatus=$(playerctl status)
title=$(playerctl metadata | grep title | cut -c 35-)
#polybar-msg cmd show
#polybar-msg cmd hide
echo "e"
#if [ $playerctlstatus =~ "Playing" ]; then 
#   echo "%{A1:playerctl pause:}  %{A}$title" 
#elif [ $playerctlstatus = "Paused" ]; then
#   echo "%{A1:playerctl play:}  %{A}$title"  
#else
#   echo "ea"
#fi
