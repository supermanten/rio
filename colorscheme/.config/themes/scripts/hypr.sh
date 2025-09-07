
#!/bin/bash

# ==============================================================================
# Hyprland Catppuccin Theme Switcher
# Applies a selected Catppuccin flavor to Hyprland by modifying the 'env.conf' file.
# This script specifically targets the GTK_THEME environment variable.
# ==============================================================================

# Define the path to the environment configuration file.
ENV_CONFIG="$HOME/.config/hypr/config/env.conf"

# Get the selected Catppuccin flavor from the first command-line argument
SELECTED_FLAVOR="$1"

# Check if a flavor was provided
if [ -z "$SELECTED_FLAVOR" ]; then
    echo "Error: No flavor provided. Please specify a Catppuccin flavor (e.g., 'latte', 'macchiato')."
    echo "Usage: $0 [latte|macchiato|frappe|mocha]"
    exit 1
fi

# Determine the new theme value based on the selected flavor
NEW_THEME=""
case "$SELECTED_FLAVOR" in
    "latte")
        NEW_THEME="Catppuccin-Light-Macchiato"
        ;;
    "macchiato")
        NEW_THEME="Gruvbox-Dark"
        ;;
    "frappe")
        NEW_THEME="Gruvbox-Dark"
        ;;
    "mocha")
        NEW_THEME="Gruvbox-Dark"
        ;;
    *)
        echo "Error: Invalid flavor '$SELECTED_FLAVOR'. Please use a valid Catppuccin flavor."
        exit 1
        ;;
esac

# Check if the env.conf file exists
if [ ! -f "$ENV_CONFIG" ]; then
    echo "Error: Hyprland environment config file '$ENV_CONFIG' not found."
    exit 1
fi

# Use sed to find and replace the GTK_THEME line.
# The regex looks for a line starting with 'env = GTK_THEME,' and
# replaces everything after the comma with the new theme name.
sed -i -E "s|^env = GTK_THEME,.*$|env = GTK_THEME,$NEW_THEME|" "$ENV_CONFIG"

echo "Hyprland theme updated to '$NEW_THEME'."

# ==============================================================================
# IMPORTANT: Hyprland needs to be reloaded to apply the changes.
# You can do this by running 'hyprctl reload' after the script.
# ==============================================================================

hyprctl reload
