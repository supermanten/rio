#!/bin/bash

# ==============================================================================
# Swww Wallpaper Switcher
# Applies a light or dark wallpaper based on a selected flavor.
# ==============================================================================

# Define the path to your wallpaper directory
WALL_DIR="$HOME/.config/images/wall"

# Define the wallpaper files
LIGHT_WALLPAPER="$WALL_DIR/light.png"
DARK_WALLPAPER="$WALL_DIR/dark.png"

# Get the selected flavor from the command-line argument
SELECTED_FLAVOR="$1"

# Check if a flavor was provided
if [ -z "$SELECTED_FLAVOR" ]; then
    echo "Error: No flavor provided. This script requires a flavor as an argument."
    exit 1
fi

# Use a case statement to select the correct wallpaper file
case "$SELECTED_FLAVOR" in
    "latte")
        THEME_TO_APPLY="$LIGHT_WALLPAPER"
        echo "Selected flavor is Latte. Applying light wallpaper."
        ;;
    "mocha" | "frappe" | "macchiato")
        THEME_TO_APPLY="$DARK_WALLPAPER"
        echo "Selected flavor is a dark theme. Applying dark wallpaper."
        ;;
    *)
        echo "Error: Invalid flavor '$SELECTED_FLAVOR'. Please provide a valid Catppuccin flavor."
        exit 1
        ;;
esac

# Check if the target wallpaper file exists
if [ ! -f "$THEME_TO_APPLY" ]; then
    echo "Error: Wallpaper file '$THEME_TO_APPLY' not found."
    exit 1
fi

# Apply the wallpaper using swww with the specified transition
# Ensure 'swww-daemon' is running before executing this command
swww img "$THEME_TO_APPLY" \
    --transition-type "grow" \
    --transition-step 100 \
    --transition-fps 60

echo "Wallpaper successfully updated with swww."
