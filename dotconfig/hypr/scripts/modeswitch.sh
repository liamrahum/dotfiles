#!/usr/bin/env sh

## main script ##
CFGDIR="$HOME/.config"
X_MODE=$1

## check mode ##
if [ "$X_MODE" == "dark" ] || [ "$X_MODE" == "light" ] ; then
    S_MODE="$X_MODE"

elif [ "$X_MODE" == "switch" ] ; then
    X_MODE=`readlink $CFGDIR/swww/wall.set | awk -F "." '{print $NF}'`
    if [ "$X_MODE" == "dark" ] ; then
        S_MODE="light"
        flatpak --user override --env=GTK_THEME=Graphite-Light

    elif [ "$X_MODE" == "light" ] ; then
        S_MODE="dark"
        flatpak --user override --env=GTK_THEME=Graphite-Dark

    else
        echo "ERROR: unable to fetch wallpaper mode."
    fi

else
    echo "ERROR: unknown mode, use 'dark', 'light' or 'switch'."
    exit 1
fi

### Firefox/Librewolf ###
ln -fs $CFGDIR/nwg-look/Firefox-Theme-Colors/${S_MODE}.css $CFGDIR/nwg-look/Firefox-Theme-Colors/theme.css

### kitty ###
ln -fs $CFGDIR/kitty/themes/${S_MODE}.conf $CFGDIR/kitty/themes/theme.conf
killall -SIGUSR1 kitty

### hyprland ###
ln -fs $CFGDIR/hypr/${S_MODE}.conf $CFGDIR/hypr/theme.conf

### qt5ct ###
ln -fs $CFGDIR/qt5ct/colors/${S_MODE}.conf $CFGDIR/qt5ct/colors/theme.conf

### rofi ###
ln -fs $CFGDIR/rofi/${S_MODE}.rasi $CFGDIR/rofi/theme.rasi

### waybar ###
ln -fs $CFGDIR/waybar/${S_MODE}.css $CFGDIR/waybar/style.css

### swwwallpaper ###
x=`echo $S_MODE | cut -c 1`
bash $CFGDIR/swww/swwwallpaper.sh -$x

#sleep 1
#killall -SIGUSR2 waybar
#nohup waybar &

