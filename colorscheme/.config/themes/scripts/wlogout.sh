#!/bin/bash


# Applies a random accent of the selected Catppuccin flavor to wlogout and wleave.


# Get the selected flavor from the first command-line argument

SELECTED_FLAVOR="$1"


# Check if a flavor was provided

if [ -z "$SELECTED_FLAVOR" ]; then

    echo "Error: No flavor provided to wlogout.sh. Exiting."

    exit 1

fi


# Define the paths

GLOBAL_THEMES_DIR="$HOME/.config/themes"

WLOGOUT_CONFIG_DIR="$HOME/.config/wlogout"


# Define the base directories for the selected flavor

WLOGOUT_THEME_DIR="$GLOBAL_THEMES_DIR/wlogout/themes/$SELECTED_FLAVOR"

WLOGOUT_ICONS_DIR="$GLOBAL_THEMES_DIR/wlogout/icons/wlogout/$SELECTED_FLAVOR"

WLOGOUT_ICONS_HOVER_DIR="$GLOBAL_THEMES_DIR/wlogout/icons/wleave/$SELECTED_FLAVOR"


# Check if the required directories for the selected flavor exist

if [ ! -d "$WLOGOUT_THEME_DIR" ] || [ ! -d "$WLOGOUT_ICONS_DIR" ] || [ ! -d "$WLOGOUT_THEME_DIR" ]; then

    echo "Warning: Required theme or icon directories for wlogout not found for '$SELECTED_FLAVOR'. Skipping."

    exit 0

fi


# Randomly select an accent (a CSS file)

ACCENT_CSS_FILES=$(find "$WLOGOUT_THEME_DIR" -maxdepth 1 -name "*.css" -printf "%f\n")

ACCENT_COUNT=$(echo "$ACCENT_CSS_FILES" | wc -l)


if [ "$ACCENT_COUNT" -gt 0 ]; then

    RANDOM_ACCENT_CSS=$(echo "$ACCENT_CSS_FILES" | shuf -n 1)

    RANDOM_ACCENT_NAME="${RANDOM_ACCENT_CSS%.css}"



    # --- Symbolic Link Management ---
    # Delete the existing symbolic links for colors.css, icons, and hover directories.
    # The "-f" flag prevents errors if the file doesn't exist.
    rm -f "$WLOGOUT_CONFIG_DIR/colors.css"
    rm -rf "$WLOGOUT_CONFIG_DIR/icons"
    rm -rf "$WLOGOUT_CONFIG_DIR/hover"

    # Create new symbolic links to the randomly selected theme and icon sets.
    ln -sf "$WLOGOUT_THEME_DIR/$RANDOM_ACCENT_CSS" "$WLOGOUT_CONFIG_DIR/colors.css"
    ln -sf "$WLOGOUT_ICONS_DIR/$RANDOM_ACCENT_NAME" "$WLOGOUT_CONFIG_DIR/icons"
    ln -sf "$WLOGOUT_ICONS_HOVER_DIR/$RANDOM_ACCENT_NAME" "$WLOGOUT_CONFIG_DIR/hover"

# Print a success message to the console.
echo "wlogout theme updated to '$SELECTED_FLAVOR' with '$RANDOM_ACCENT_NAME' accent."


else

    echo "Warning: No accents found for the '$SELECTED_FLAVOR' flavor in wlogout. Skipping."

fi 
