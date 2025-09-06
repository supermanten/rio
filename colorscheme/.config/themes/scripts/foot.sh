#!/bin/bash

# Applies the selected Catppuccin flavor to the Foot terminal.

# Define the paths and variables
FOOT_CONFIG_DIR="$HOME/.config/foot"
FOOT_INI="$FOOT_CONFIG_DIR/foot.ini"
GLOBAL_THEMES_DIR="$HOME/.config/themes"

# Get the selected flavor from the first command-line argument
SELECTED_FLAVOR="$1"

if [ -z "$SELECTED_FLAVOR" ]; then
    echo "Error: No flavor provided. Exiting."
    exit 1
fi

FULL_FOOT_THEME_NAME="catppuccin-$SELECTED_FLAVOR.ini"

if [ -f "$FOOT_INI" ]; then
    sed -i -r "s|^include=.*$|include=$GLOBAL_THEMES_DIR/foot/$FULL_FOOT_THEME_NAME|" "$FOOT_INI"
    echo "Foot theme updated to '$SELECTED_FLAVOR'."
else
    echo "Warning: Foot config file '$FOOT_INI' not found. Skipping."
fi

# Reload Foot by sending SIGHUP to all running foot processes
pkill -USR1 foot && echo "Foot terminal reloaded." || echo "No running Foot process found."


