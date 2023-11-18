#!/bin/bash

ln -snf ~/repos/dotfiles/dotconfig/* ~/.config/
ln -snf ~/repos/dotfiles/home/.* ~/
sudo ln -snf ~/repos/dotfiles/dotconfig/dwm/scripts/showclipboard /usr/bin/
