#!/bin/bash

# ==============================================================================
# Main Theme Orchestrator Script
#
# This script selects a Catppuccin flavor and applies it to all configured
# applications by calling individual, application-specific scripts.
# ==============================================================================

# ==============================================================================
# 1. Select the main flavor using Rofi
# ==============================================================================
GLOBAL_THEMES_DIR="$HOME/.config/themes"

# Find themes for Rofi selection using Foot as the source
if [ ! -d "$GLOBAL_THEMES_DIR/foot" ]; then
    echo "Error: Foot themes directory not found at $GLOBAL_THEMES_DIR/foot."
    exit 1
fi

THEMES=$(find "$GLOBAL_THEMES_DIR/foot" -maxdepth 1 -name "*.ini" -printf "%f\n" | sed 's/\.ini$//; s/^catppuccin-//')
SELECTED_FLAVOR=$(echo "$THEMES" | rofi -dmenu -i -p "Select a catppuccin flavor" 2>/dev/null)

if [ -z "$SELECTED_FLAVOR" ]; then
    echo "No flavor selected. Exiting."
    exit 0
fi

echo "Applying the '$SELECTED_FLAVOR' theme..."

# ==============================================================================
# 2. Apply the theme to each application by calling its dedicated script
# ==============================================================================
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# List of application script base names (without path)
APPS=(
    foot
    bat
    bottom
    btop
    yazi
    nu
    starship
    swaync
    nvim
    lsd
    hyprlock
    wlogout
    waybar
    rofi
    sww
    hypr
    superfile
)

for app in "${APPS[@]}"; do
    script_path="$SCRIPT_DIR/$app.sh"
    if [ -f "$script_path" ]; then
        bash "$script_path" "$SELECTED_FLAVOR"
    fi
done

echo "Theme application complete."

