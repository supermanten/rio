#!/bin/bash

# ==============================================================================
# Nvim Theme Switcher
# Applies a selected Catppuccin flavor to Neovim by modifying the
# colorscheme Lua configuration file.
# ==============================================================================

# Define the path to your Neovim colorscheme configuration file
NVIM_THEME_FILE="$HOME/.config/nvim/lua/plugins/nvim-colorscheme.lua"

# Get the selected flavor from the first command-line argument
SELECTED_FLAVOR="$1"

if [ -z "$SELECTED_FLAVOR" ]; then
    echo "Error: No flavor provided. This script is intended to be called with a flavor as an argument."
    exit 1
fi

# Check if the Neovim theme file exists
if [ ! -f "$NVIM_THEME_FILE" ]; then
    echo "Error: Neovim theme file '$NVIM_THEME_FILE' not found."
    exit 1
fi

# Use sed to replace the 'flavour' and 'dark' options in the Lua file
sed -i -r "s/flavour = \".*\"/flavour = \"$SELECTED_FLAVOR\"/; s/dark = \".*\"/dark = \"$SELECTED_FLAVOR\"/" "$NVIM_THEME_FILE"

echo "Neovim theme successfully updated to '$SELECTED_FLAVOR'."
