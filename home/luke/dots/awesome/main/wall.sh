# Directory containing your wallpapers
WALLPAPER_DIR="$HOME/Pictures"

# Use Rofi to select a wallpaper
SELECTED_WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" \) | rofi -dmenu -no-click-to-exit -show-icons -i -p "$WALLPAPER_DIR")

# Check if a wallpaper was selected
if [ -n "$SELECTED_WALLPAPER" ]; then
    # Run the selected wallpaper with wallust
    wallust run "$SELECTED_WALLPAPER"

    # Set the selected wallpaper as the desktop background using feh
    feh --bg-center "$SELECTED_WALLPAPER"

    # Reload awesome config
    awesome-client 'awesome.restart()'
fi
