#!/bin/bash

# ==============================================================================
# LSD Theme Switcher
# This script applies a selected LSD theme by creating a symbolic link.
# It is designed to be called with a flavor as a command-line argument.
# ==============================================================================

# Define the paths and variables
GLOBAL_THEMES_DIR="$HOME/.config/themes"
LSD_THEMES_DIR="$GLOBAL_THEMES_DIR/lsd"
LSD_CONFIG_DIR="$HOME/.config/lsd"
LSD_COLORS_FILE="$LSD_CONFIG_DIR/colors.yaml"

# Get the selected flavor from the first command-line argument
SELECTED_FLAVOR="$1"

if [ -z "$SELECTED_FLAVOR" ]; then
    echo "Error: No flavor provided. This script is intended to be called with a flavor as an argument."
    exit 1
fi

# Check if the themes directory exists
if [ ! -d "$LSD_THEMES_DIR" ]; then
    echo "Error: LSD themes directory not found at '$LSD_THEMES_DIR'."
    exit 1
fi

# Construct the full path to the selected theme's colors.yaml
SOURCE_THEME_FILE="$LSD_THEMES_DIR/$SELECTED_FLAVOR.yaml"

# Check if the source theme file exists
if [ ! -f "$SOURCE_THEME_FILE" ]; then
    echo "Error: Theme file '$SOURCE_THEME_FILE' not found."
    exit 1
fi

# Create a symbolic link to the selected theme file. The -f flag forces overwrite.
ln -sf "$SOURCE_THEME_FILE" "$LSD_COLORS_FILE"

echo "LSD theme successfully updated to '$SELECTED_FLAVOR'."

