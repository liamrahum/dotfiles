#!/bin/bash

./link.sh

# Install yay
cd $HOME/repos
git clone https://aur.archlinux.org/yay-bin
cd yay-bin
makepkg -si 

# Get wallpapers
cd $HOME/repos
git clone https://github.com/wallpapers

# Install fonts
cd $HOME
git clone https://github.com/liamrahum/fonts .fonts

# Set fastest mirrors
sudo pacman -S reflector --noconfirm
sudo reflector --country Israel,Germany -f 10 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
sudo pacman -Sy

yay -S --noconfirm hyprland hyprshot hyprpicker waybar kitty brave-bin nautilus cliphist neovim swww nwg-look-bin rofi-lbonn-wayland-git wlogout zsh xdg-desktop-portal-gtk xdg-desktop-portal-hyprland tesseract-data-heb tesseract-data-eng tesseract-data-osd tesseract wlsunset swaync pop-icon-theme
