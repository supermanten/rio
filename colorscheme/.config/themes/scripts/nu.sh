#!/bin/bash

# ==============================================================================
# Nushell and FZF Theme Switcher (Robust Version)
# Applies a selected Catppuccin flavor to Nushell and FZF by modifying
# the 'config.nu' file using unique markers.
# ==============================================================================

# Define the paths and variables
NU_CONFIG="$HOME/.config/nushell/config.nu"
FZF_THEMES_DIR="$HOME/.config/themes/fzf"
NU_THEMES_DIR="$HOME/.config/nushell/themes"

# Get the selected flavor from the first command-line argument
SELECTED_FLAVOR="$1"

if [ -z "$SELECTED_FLAVOR" ]; then
    echo "Error: No flavor provided. Exiting."
    exit 1
fi

FULL_FZF_THEME_PATH="$FZF_THEMES_DIR/${SELECTED_FLAVOR}.nu"
FULL_NU_THEME_PATH="$NU_THEMES_DIR/catppuccin_${SELECTED_FLAVOR}.nu"

if [ ! -f "$NU_CONFIG" ]; then
    echo "Warning: Nushell config file '$NU_CONFIG' not found. Skipping."
    exit 1
fi

# Use sed to specifically replace the Nushell theme line using the marker
sed -i -E "/# NU-THEME-START/,/# NU-THEME-END/s|^source .*$|source \"$FULL_NU_THEME_PATH\"|" "$NU_CONFIG"

# Use sed to specifically replace the FZF theme line using the marker
sed -i -E "/# FZF-THEME-START/,/# FZF-THEME-END/s|^source .*$|source \"$FULL_FZF_THEME_PATH\"|" "$NU_CONFIG"

echo "Nushell and FZF themes updated to '$SELECTED_FLAVOR'."
