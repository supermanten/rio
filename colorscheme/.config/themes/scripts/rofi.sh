#!/bin/bash

# ==============================================================================
# Rofi Theme Symlink Switcher
# Creates a symlink to either the dark or light Rofi theme.
# ==============================================================================

# Define the paths for your Rofi theme files and the symlink
ROFI_THEMES_DIR="$HOME/.config/rofi/styles"
LIGHT_THEME_FILE="$ROFI_THEMES_DIR/light.rasi"
DARK_THEME_FILE="$ROFI_THEMES_DIR/dark.rasi"
SYMLINK_THEME_FILE="$ROFI_THEMES_DIR/theme.rasi"

# Get the selected flavor from the command-line argument
SELECTED_FLAVOR="$1"

# Check if a flavor was provided
if [ -z "$SELECTED_FLAVOR" ]; then
    echo "Error: No flavor provided. This script requires a flavor as an argument."
    exit 1
fi

# Use a case statement to select the correct file to symlink to
case "$SELECTED_FLAVOR" in
    "latte")
        THEME_TO_LINK="$LIGHT_THEME_FILE"
        echo "Selected flavor is Latte. Linking to light.rasi."
        ;;
    "mocha" | "frappe" | "macchiato")
        THEME_TO_LINK="$DARK_THEME_FILE"
        echo "Selected flavor is a dark theme. Linking to dark.rasi."
        ;;
    *)
        echo "Error: Invalid flavor '$SELECTED_FLAVOR'. Please provide a valid Catppuccin flavor."
        exit 1
        ;;
esac

# Check if the target theme file exists before creating the symlink
if [ ! -f "$THEME_TO_LINK" ]; then
    echo "Error: Target theme file '$THEME_TO_LINK' not found."
    echo "Please ensure you have created both 'light.rasi' and 'dark.rasi'."
    exit 1
fi

# Create or update the symbolic link.
# The -s flag creates a symbolic link.
# The -f flag forces the creation, removing the old link if it exists.
ln -sf "$THEME_TO_LINK" "$SYMLINK_THEME_FILE"

echo "Rofi theme symlink updated successfully."
echo "Rofi will now use '$SELECTED_FLAVOR' theme via $SYMLINK_THEME_FILE."
