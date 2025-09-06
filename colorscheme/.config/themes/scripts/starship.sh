#!/bin/bash

# Applies the selected Catppuccin flavor to Starship.

# Define the paths and variables
STARSHIP_CONFIG_DIR="$HOME/.config/starship"
STARSHIP_CONFIG="$STARSHIP_CONFIG_DIR/starship.toml"
GLOBAL_THEMES_DIR="$HOME/.config/themes"

# Get the selected flavor from the first command-line argument
SELECTED_FLAVOR="$1"

if [ -z "$SELECTED_FLAVOR" ]; then
    echo "Error: No flavor provided. Exiting."
    exit 1
fi

FULL_STARSHIP_THEME_PATH="./themes/$SELECTED_FLAVOR.toml"

if [ -f "$STARSHIP_CONFIG" ]; then
    sed -i -r "s|^include = \".*\"$|include = \"$FULL_STARSHIP_THEME_PATH\"|" "$STARSHIP_CONFIG"
    echo "Starship theme updated to '$SELECTED_FLAVOR'."
else
    echo "Warning: Starship config file '$STARSHIP_CONFIG' not found. Skipping."
fi
