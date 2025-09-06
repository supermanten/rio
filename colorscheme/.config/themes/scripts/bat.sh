#!/bin/bash

# Applies the selected Catppuccin flavor to Bat.

# Define the paths and variables
BAT_CONFIG_DIR="$HOME/.config/bat"
BAT_CONFIG="$BAT_CONFIG_DIR/config"
GLOBAL_THEMES_DIR="$HOME/.config/themes"

# Get the selected flavor from the first command-line argument
SELECTED_FLAVOR="$1"

if [ -z "$SELECTED_FLAVOR" ]; then
    echo "Error: No flavor provided. Exiting."
    exit 1
fi

FULL_BAT_THEME_NAME="Catppuccin $(echo "$SELECTED_FLAVOR" | sed 's/\b./\u&/g')"

if [ -f "$BAT_CONFIG" ]; then
    sed -i -r "s|^--theme=.*$|--theme=\"$FULL_BAT_THEME_NAME\"|" "$BAT_CONFIG"
    echo "Bat theme updated to '$SELECTED_FLAVOR'."
else
    echo "Warning: Bat config file '$BAT_CONFIG' not found. Skipping."
fi
