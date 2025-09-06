#!/bin/bash

# Applies the selected Catppuccin flavor to Btop.

# Define the paths and variables
BTOP_CONFIG_DIR="$HOME/.config/btop"
BTOP_CONFIG="$BTOP_CONFIG_DIR/btop.conf"
GLOBAL_THEMES_DIR="$HOME/.config/themes"

# Get the selected flavor from the first command-line argument
SELECTED_FLAVOR="$1"

if [ -z "$SELECTED_FLAVOR" ]; then
    echo "Error: No flavor provided. Exiting."
    exit 1
fi

FULL_BTOP_THEME_NAME="catppuccin_$SELECTED_FLAVOR.theme"

if [ -f "$BTOP_CONFIG" ]; then
    sed -i -r "s|^color_theme = \".*\"$|color_theme = \"$FULL_BTOP_THEME_NAME\"|" "$BTOP_CONFIG"
    echo "Btop theme updated to '$SELECTED_FLAVOR'."
else
    echo "Warning: Btop config file '$BTOP_CONFIG' not found. Skipping."
fi
