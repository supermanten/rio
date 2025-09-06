
#!/bin/bash

# Applies a random accent of the selected Catppuccin flavor to Yazi.

# Define the paths and variables
YAZI_CONFIG_DIR="$HOME/.config/yazi"
YAZI_CONFIG="$YAZI_CONFIG_DIR/yazi.toml"
GLOBAL_THEMES_DIR="$HOME/.config/themes"

# Get the selected flavor from the first command-line argument
SELECTED_FLAVOR="$1"

if [ -z "$SELECTED_FLAVOR" ]; then
    echo "Error: No flavor provided. Exiting."
    exit 1
fi

# Randomly select a Yazi accent for the chosen flavor
YAZI_THEMES=$(find "$GLOBAL_THEMES_DIR/yazi" -maxdepth 1 -name "catppuccin-$SELECTED_FLAVOR-*.toml" -printf "%f\n")
THEME_COUNT=$(echo "$YAZI_THEMES" | wc -l)

if [ "$THEME_COUNT" -gt 0 ]; then
    FULL_YAZI_THEME_NAME=$(echo "$YAZI_THEMES" | shuf -n 1)
    if [ -f "$YAZI_CONFIG" ]; then
        sed -i -r "s|^theme = \".*\"$|theme = \"$FULL_YAZI_THEME_NAME\"|" "$YAZI_CONFIG"
        echo "Yazi theme updated to '$FULL_YAZI_THEME_NAME'."
    else
        echo "Warning: Yazi config file '$YAZI_CONFIG' not found. Skipping."
    fi
else
    echo "Warning: No Yazi themes found for the '$SELECTED_FLAVOR' flavor. Skipping."
fi
