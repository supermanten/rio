#!/bin/bash

# ==============================================================================
# Superfile Theme Switcher
# Applies a selected Catppuccin theme to Superfile by modifying the
# main configuration file.
# ==============================================================================

# Define the path to your Superfile configuration file
SUPERFILE_CONFIG_FILE="$HOME/.config/superfile/config.toml"

# Get the selected flavor (e.g., 'latte') from the first command-line argument
SELECTED_FLAVOR="$1"

# ---

## Argument and File Checks

# Check if a flavor was provided
if [ -z "$SELECTED_FLAVOR" ]; then
    echo "Error: No theme flavor provided. This script requires a flavor name as an argument."
    exit 1
fi

# Check if the Superfile config file exists
if [ ! -f "$SUPERFILE_CONFIG_FILE" ]; then
    echo "Error: Superfile config file '$SUPERFILE_CONFIG_FILE' not found."
    exit 1
fi

# ---

## Apply the Theme

# Prepend "catppuccin-" to the selected flavor
SELECTED_THEME="catppuccin-$SELECTED_FLAVOR"

# Use sed to replace the entire 'theme = '...' line with the new value.
# This will change the value to the provided theme name with the prefix.
sed -i "s/^theme = '.*'$/theme = '$SELECTED_THEME'/" "$SUPERFILE_CONFIG_FILE"

echo "Superfile theme successfully updated to '$SELECTED_THEME'."
