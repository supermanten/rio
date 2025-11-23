#!/bin/bash

# Rofi theme
rofi_theme="$HOME/.config/rofi/themes/clipboard.rasi"
msg='** Hyprland Keybinds ** ⌨️ Search or press Enter to copy'

# Check if rofi is already running
if pidof rofi > /dev/null; then
  pkill rofi
fi

# Format & show via rofi
sed '1,/^# # KEYBINDS # #$/d' "$0" | \
rofi -i -dmenu -mesg "$msg" -config "$rofi_theme" | \
awk '{print $1}' | \
wl-copy

exit

# # KEYBINDS # #
          🖥️ Window Management

SUPER + T                             : Launch Terminal
SUPER + Q                             : Kill Active Window
SUPER + M                             : Exit Hyprland
SUPER + E                             : Launch File Manager
SUPER + B                             : Launch Browser
SUPER + C                             : Launch Visual Studio Code
SUPER + W                             : Launch Warp Terminal
SUPER + V                             : Toggle Floating
SUPER + SPACE                         : App Launcher
SUPER + P                             : Toggle Pseudo (dwindle)
SUPER + J                             : Toggle Split (dwindle)

          🧭 Navigation

SUPER + H                             : Move Focus Left
SUPER + L                             : Move Focus Right
SUPER + J                             : Move Focus Down
SUPER + K                             : Move Focus Up
SUPER + LEFT                          : Move Focus Left
SUPER + RIGHT                         : Move Focus Right
SUPER + UP                            : Move Focus Up
SUPER + DOWN                          : Move Focus Down

          🪟 Window Resize

SUPER + SHIFT + LEFT                  : Resize Window Left
SUPER + SHIFT + RIGHT                 : Resize Window Right
SUPER + SHIFT + UP                    : Resize Window Up
SUPER + SHIFT + DOWN                  : Resize Window Down

          📦 Workspace Management

SUPER + [1-0]                         : Switch to Workspace
SUPER + SHIFT + [1-0]                 : Move Window to Workspace
SUPER + S                             : Toggle Scratchpad
SUPER + SHIFT + S                     : Move to Scratchpad

          🖱️ Mouse Bindings

SUPER + mouse (LMB)                   : Move Window
SUPER + mouse (RMB)                   : Resize Window
SUPER + scroll up                     : Previous Workspace
SUPER + scroll down                   : Next Workspace

          📋 Clipboard

SUPER + SHIFT + P                     : Clipboard Manager

          🌐 Network & Bluetooth

SUPER + ALT + W                       : Rofi Wifi Connect
SUPER + SHIFT + B                     : Rofi Bluetooth Connect

          🎶 Music

SUPER + SHIFT + O                     : Rofi Play Music

          📹 Video

SUPER + SHIFT + V                     : Rofi Video Keybinds

          ⌨️ Hyprland Keybinds

SUPER + SHIFT + I                     : Hypr Key Bind
SUPER + SHIFT + A                     : Alias Hint
SUPER + SHIFT + Y                     : Yazi Key Bind
SUPER + ALT + E                       : Nvim Key Bind

          🎨 Rofi & Themes

SUPER + D                             : App Launcher (Rofi)
SUPER + CTRL + R                      : Theme Selector (Rofi)
SUPER + SHIFT + E                     : Emoji Picker (Rofi)
SUPER + SHIFT + T                     : Global Theme Selector

          🖼️ Wallpaper

SUPER + SHIFT + R                     : Rofi Wallpaper Picker
SUPER + SHIFT + W                     : Random Wallpaper

          🔒 Lock & Logout

SUPER + F4                            : Logout Menu
SUPER + ALT + L                       : Rofi Power Menu
SUPER + SHIFT + L                     : Lock Screen

          🔔 Notifications

SUPER + SHIFT + N                     : Toggle SwayNC

          📊 Bar

SUPER + ALT + B                       : Toggle Waybar Visibility

          📸 Screenshots

PRINT                                 : Screenshot Active Window
SHIFT + PRINT                         : Screenshot Region

          📺 Fullscreen / Floating

SUPER + SHIFT + F                     : Fullscreen
SUPER + CTRL + F                      : Fake Fullscreen
SUPER + F                             : Toggle Floating

          🔊 Audio Controls

XF86AudioRaiseVolume                  : Volume Up
XF86AudioLowerVolume                  : Volume Down
XF86AudioMute                         : Toggle Mute
XF86AudioMicMute                      : Toggle Mic Mute

          💡 Brightness

XF86MonBrightnessUp                   : Brightness Up
XF86MonBrightnessDown                 : Brightness Down

          🎵 Media Playback

XF86AudioNext                         : Next Track
XF86AudioPrev                         : Previous Track
XF86AudioPause                        : Play/Pause
XF86AudioPlay                         : Play/Pause

