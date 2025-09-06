#!/bin/bash

# Applies the selected Catppuccin flavor to Bottom.

# Define the paths and variables
BOTTOM_CONFIG_DIR="$HOME/.config/bottom"
BOTTOM_CONFIG="$BOTTOM_CONFIG_DIR/bottom.toml"
GLOBAL_THEMES_DIR="$HOME/.config/themes"

# Get the selected flavor from the first command-line argument
SELECTED_FLAVOR="$1"

if [ -z "$SELECTED_FLAVOR" ]; then
    echo "Error: No flavor provided. Exiting."
    exit 1
fi

FULL_BOTTOM_THEME_PATH="$GLOBAL_THEMES_DIR/bottom/$SELECTED_FLAVOR.toml"

if [ -f "$BOTTOM_CONFIG" ]; then
    sed -i -r "s|^theme = \".*\"$|theme = \"$FULL_BOTTOM_THEME_PATH\"|" "$BOTTOM_CONFIG"
    echo "Bottom theme updated to '$SELECTED_FLAVOR'."
else
    echo "Warning: Bottom config file '$BOTTOM_CONFIG' not found. Skipping."
fi
