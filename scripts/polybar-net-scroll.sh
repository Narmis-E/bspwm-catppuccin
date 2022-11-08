#!/bin/bash

ssid=`nmcli -t -f name connection show --active`
ipaddr=`ip a | grep "scope global" | grep -Po '(?<=inet )[\d.]+'`
net="$ssid $ipaddr" 
echo "$net" | zscroll -l 20
