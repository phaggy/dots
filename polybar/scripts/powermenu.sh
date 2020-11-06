#!/usr/bin/env bash

## Author : Aditya Shakya (adi1090x)
## Mail : adi1090x@gmail.com
## Github : @adi1090x
## Reddit : @adi1090x

rofi_command="rofi -theme ~/.config/polybar/themes/powermenu"
uptime=$(uptime -p | sed -e 's/up //g')

# Options
shutdown=" 󰚦 " 
reboot="󰜉"
lock="󰌾"
suspend="󰒲"
logout="󰍃"

# Variable passed to rofi
options="$shutdown\n$reboot\n$lock\n$suspend\n$logout"

chosen="$(echo -e "$options" | $rofi_command -p "UP - $uptime" -dmenu -selected-row 2)"
case $chosen in
    $shutdown)
        shutdown -h now
        ;;
    $reboot)
        systemctl reboot
        ;;
    $lock)
        betterlockscreen -l
        ;;
    $suspend)
        amixer set Master mute
        betterlockscreen -s blur
        ;;
    $logout)
        bspc quit
        ;;
esac

