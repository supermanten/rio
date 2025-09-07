
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

# Run each application's script, passing the selected flavor as an argument
if [ -f "$SCRIPT_DIR/foot.sh" ]; then
    bash "$SCRIPT_DIR/foot.sh" "$SELECTED_FLAVOR"
fi

if [ -f "$SCRIPT_DIR/bat.sh" ]; then
    bash "$SCRIPT_DIR/bat.sh" "$SELECTED_FLAVOR"
fi

if [ -f "$SCRIPT_DIR/bottom.sh" ]; then
    bash "$SCRIPT_DIR/bottom.sh" "$SELECTED_FLAVOR"
fi

if [ -f "$SCRIPT_DIR/btop.sh" ]; then
    bash "$SCRIPT_DIR/btop.sh" "$SELECTED_FLAVOR"
fi

if [ -f "$SCRIPT_DIR/yazi.sh" ]; then
    bash "$SCRIPT_DIR/yazi.sh" "$SELECTED_FLAVOR"
fi

if [ -f "$SCRIPT_DIR/nu.sh" ]; then
    bash "$SCRIPT_DIR/nu.sh" "$SELECTED_FLAVOR"
fi

if [ -f "$SCRIPT_DIR/starship.sh" ]; then
    bash "$SCRIPT_DIR/starship.sh" "$SELECTED_FLAVOR"
fi

if [ -f "$SCRIPT_DIR/swaync.sh" ]; then
    bash "$SCRIPT_DIR/swaync.sh" "$SELECTED_FLAVOR"
fi

if [ -f "$SCRIPT_DIR/nvim.sh" ]; then
    bash "$SCRIPT_DIR/nvim.sh" "$SELECTED_FLAVOR"
fi

if [ -f "$SCRIPT_DIR/lsd.sh" ]; then
    bash "$SCRIPT_DIR/lsd.sh" "$SELECTED_FLAVOR"
fi

if [ -f "$SCRIPT_DIR/hyprlock.sh" ]; then
    bash "$SCRIPT_DIR/hyprlock.sh" "$SELECTED_FLAVOR"
fi

if [ -f "$SCRIPT_DIR/wlogout.sh" ]; then
    bash "$SCRIPT_DIR/wlogout.sh" "$SELECTED_FLAVOR"
fi

if [ -f "$SCRIPT_DIR/waybar.sh" ]; then
    bash "$SCRIPT_DIR/waybar.sh" "$SELECTED_FLAVOR"
fi

if [ -f "$SCRIPT_DIR/rofi.sh" ]; then
    bash "$SCRIPT_DIR/rofi.sh" "$SELECTED_FLAVOR"
fi

if [ -f "$SCRIPT_DIR/sww.sh" ]; then
    bash "$SCRIPT_DIR/sww.sh" "$SELECTED_FLAVOR"
fi

echo "Theme application complete."

