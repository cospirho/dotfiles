#!/bin/bash

# vars you can edit
MING="kuro"

# Make directories
mkdir -p /home/$MING/Pictures/wallpapers
mkdir -p /home/$MING/Desktop

# Install paru
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ..
rm -rf paru

# Install packages
# paru -Qqen > ~/.config/setup/packages.txt
paru -S --needed - < packages.txt

# App drun shortcuts
sudo mkdir -p /home/$MIND/.local/share/applications
sudo cp ./applications/* /home/$MING/.local/share/applications/


#lightdm config
sudo cp ./lightdm/lightdm-gtk-greeter.conf /etc/lightdm/
# It only works if images are here....
sudo mkdir -p /usr/share/backgrounds
sudo cp ./lightdm/*.png /usr/share/backgrounds/
sudo cp ./lightdm/lightdm.png /home/$MING/Pictures/wallpapers/


#set permissions
for file in /home/$MING/.config/i3/scripts/*; do
    chmod +x $file
done

# Set wallpaper
exec --no-startup-id /home/$USER/.config/i3/scripts/set_wallpaper.sh

# ibus config
dconf load /desktop/ibus/ < ./ibus/ibus.conf
