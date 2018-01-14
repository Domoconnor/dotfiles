#!/bin/sh
lock() {
	icon="$HOME/Documents/dotfiles/i3-gaps/lock.png"
	tmpbg='/tmp/screen.png'

	(( $# )) && { icon=$1; }

	scrot "$tmpbg"
	convert "$tmpbg" -scale 5% -scale 2000% "$tmpbg"
	convert "$tmpbg" "$icon" -gravity center -composite -matte "$tmpbg"
	i3lock -u -i "$tmpbg"    
}

case "$1" in
    lock)
        lock
        ;;
    logout)
        i3-msg exit
        ;;
    suspend)
        lock && systemctl suspend
        ;;
    hibernate)
        lock && systemctl hibernate
        ;;
    reboot)
        systemctl reboot
        ;;
    shutdown)
        systemctl poweroff
        ;;
    *)
        echo "Usage: $0 {lock|logout|suspend|hibernate|reboot|shutdown}"
        exit 2
esac

exit 0
