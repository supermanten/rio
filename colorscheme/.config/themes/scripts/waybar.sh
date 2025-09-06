
#!/bin/bash

# ==============================================================================
# Waybar Theme Switcher
# This script applies a selected Waybar theme by creating a symbolic link.
# It is designed to be called with a flavor as a command-line argument.
# ==============================================================================

# Define the paths and variables
GLOBAL_THEMES_DIR="$HOME/.config/themes"
WAYBAR_THEMES_DIR="$GLOBAL_THEMES_DIR/waybar"
WAYBAR_CONFIG_DIR="$HOME/.config/waybar"
WAYBAR_COLOR_FILE="$WAYBAR_CONFIG_DIR/color.css"
WAYBAR_REFRESH_SCRIPT="$WAYBAR_CONFIG_DIR/scripts/wabar.sh"

# Get the selected flavor from the first command-line argument
SELECTED_FLAVOR="$1"

if [ -z "$SELECTED_FLAVOR" ]; then
    echo "Error: No flavor provided. Please pass a theme name like 'mocha' or 'latte'."
    exit 1
fi

# Construct the full path to the selected theme's CSS file
SOURCE_THEME_FILE="$WAYBAR_THEMES_DIR/$SELECTED_FLAVOR.css"

# Check if the source theme file exists
if [ ! -f "$SOURCE_THEME_FILE" ]; then
    echo "Error: Theme file '$SOURCE_THEME_FILE' not found."
    exit 1
fi

# Create a symbolic link to the selected theme file. The -f flag forces overwrite.
ln -sf "$SOURCE_THEME_FILE" "$WAYBAR_COLOR_FILE"

echo "Waybar theme successfully updated to '$SELECTED_FLAVOR'."

# Refresh Waybar
if [ -x "$WAYBAR_REFRESH_SCRIPT" ]; then
    "$WAYBAR_REFRESH_SCRIPT"
    echo "Waybar refreshed."
else
    echo "Warning: Waybar refresh script not found or not executable at '$WAYBAR_REFRESH_SCRIPT'."
fi

