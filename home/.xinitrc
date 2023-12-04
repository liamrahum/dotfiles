while true
	do
    xset -dpms
    setterm -blank 0 -powerdown 0
    xset s off
    
    setxkbmap -model pc104 -layout us,il -variant ,, -option grp:alt_shift_toggle
    xrandr --output DP-4 --mode 2560x1080 --rate 144
    while xsetroot -name "$(date "+%a, %b %d %H:%M:%S")"
    do
	    sleep 1
    done &
    /usr/local/bin/dwm 2> /dev/null
done

