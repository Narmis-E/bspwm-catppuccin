#!/usr/bin/env bash

playerctlstatus=$(playerctl status 2> /dev/null)
title=$(playerctl metadata | grep title | cut -c 35-)

if [[ $playerctlstatus ==  "" ]]; then
    `polybar-msg cmd hide > /dev/null`
elif [[ $playerctlstatus =~ "Playing" ]]; then
    `polybar-msg cmd show > /dev/null`
    echo "%{A1:playerctl pause:}   %{A}$title"
else
    `polybar-msg cmd show > /dev/null`
    echo "%{A1:playerctl play:}   %{A}$title"
fi
