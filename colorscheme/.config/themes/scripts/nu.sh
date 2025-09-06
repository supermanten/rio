#!/bin/bash

# Applies the selected Catppuccin flavor to Nushell.

# Define the paths and variables
NU_CONFIG_DIR="$HOME/.config/nushell"
NU_CONFIG="$NU_CONFIG_DIR/config.nu"
GLOBAL_THEMES_DIR="$HOME/.config/themes"

# Get the selected flavor from the first command-line argument
SELECTED_FLAVOR="$1"

if [ -z "$SELECTED_FLAVOR" ]; then
    echo "Error: No flavor provided. Exiting."
    exit 1
fi

FULL_NU_THEME_PATH="~/.config/nushell/themes/catppuccin_${SELECTED_FLAVOR}.nu"

if [ -f "$NU_CONFIG" ]; then
    sed -i -r "s|^use .*$|use $FULL_NU_THEME_PATH|" "$NU_CONFIG"
    echo "Nushell theme updated to '$SELECTED_FLAVOR'."
else
    echo "Warning: Nushell config file '$NU_CONFIG' not found. Skipping."
fi
