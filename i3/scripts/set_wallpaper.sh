#!/bin/bash
wallpaper_dir="$HOME/Pictures/wallpapers"
wallpaper=$(ls $wallpaper_dir | shuf -n 1)
feh --bg-fill $wallpaper_dir/$wallpaper
