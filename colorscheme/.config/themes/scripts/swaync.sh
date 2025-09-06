#!/bin/bash

# Applies the selected Catppuccin flavor to Swaync and restarts the daemon.

# Define the paths and variables
SWAYNC_CONFIG_DIR="$HOME/.config/swaync"
SWAYNC_STYLE_SHEET="$SWAYNC_CONFIG_DIR/style.css"
GLOBAL_THEMES_DIR="$HOME/.config/themes"

# Get the selected flavor from the first command-line argument
SELECTED_FLAVOR="$1"

if [ -z "$SELECTED_FLAVOR" ]; then
    echo "Error: No flavor provided. Exiting."
    exit 1
fi

SWAYNC_SOURCE_THEME="$GLOBAL_THEMES_DIR/swaync/catppuccin-$SELECTED_FLAVOR.css"

if [ -f "$SWAYNC_SOURCE_THEME" ]; then
    ln -sf "$SWAYNC_SOURCE_THEME" "$SWAYNC_STYLE_SHEET"
    echo "SwayNC style.css now links to $SWAYNC_SOURCE_THEME"
    # Restart the SwayNC daemon to apply the new styles
    pkill swaync
    swaync &
else
    echo "Warning: SwayNC theme file '$SWAYNC_SOURCE_THEME' not found. Skipping."
fi
