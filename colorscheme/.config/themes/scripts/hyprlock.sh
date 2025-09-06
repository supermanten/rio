#!/bin/bash

# ==============================================================================
# Hyprlock Theme Switcher
# Applies a selected Catppuccin flavor to Hyprlock by updating the
# configuration's source file.
# ==============================================================================

# Define the paths and variables
GLOBAL_THEMES_DIR="$HOME/.config/themes"
HYPRLOCK_CONFIG_FILE="$HOME/.config/hypr/hyprlock.conf"

# Get the selected flavor from the first command-line argument
SELECTED_FLAVOR="$1"

if [ -z "$SELECTED_FLAVOR" ]; then
    echo "Error: No flavor provided. This script is intended to be called with a flavor as an argument."
    exit 1
fi

# Check if the Hyprland themes directory exists
if [ ! -d "$GLOBAL_THEMES_DIR/hyprland" ]; then
    echo "Error: Hyprland themes directory not found at '$GLOBAL_THEMES_DIR/hyprland'."
    exit 1
fi

# Construct the full path to the selected theme's .conf file
SOURCE_THEME_FILE="$GLOBAL_THEMES_DIR/hyprland/$SELECTED_FLAVOR.conf"

# Check if the source theme file exists
if [ ! -f "$SOURCE_THEME_FILE" ]; then
    echo "Error: Theme file '$SOURCE_THEME_FILE' not found."
    exit 1
fi

# Use sed to replace the 'source' line in the hyprlock.conf file
sed -i -r "s|^source = .*$|source = $SOURCE_THEME_FILE|" "$HYPRLOCK_CONFIG_FILE"

echo "Hyprlock theme successfully updated to '$SELECTED_FLAVOR'."
