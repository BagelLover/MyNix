#!/bin/bash

# Directory containing your wallpapers
WALLPAPER_DIR="$HOME"

# Use Rofi to select a wallpaper
SELECTED_WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" \) | rofi -dmenu -i -p "Select Wallpaper")

# Debugging output
echo "Selected wallpaper: $SELECTED_WALLPAPER"

# Check if a wallpaper was selected
if [ -n "$SELECTED_WALLPAPER" ]; then
    # Run the selected wallpaper with wallust
    echo "Running wallust with $SELECTED_WALLPAPER"
    wallust run "$SELECTED_WALLPAPER"

    # Set the selected wallpaper as the desktop background using feh
    echo "Setting wallpaper with feh"
    feh --bg-scale "$SELECTED_WALLPAPER"

    # Reload awesome config
    echo "Reloading Awesome config"
    awesome-client 'awesome.restart()'
else
    echo "No wallpaper selected."
fi
