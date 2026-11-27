#!/usr/bin/env bash
set -e

# Dynamically find the folder where this script is currently located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Save the real home path for mapping
REAL_HOME="$HOME"

# The location where plugins should think $HOME is
FAKE_HOME="$HOME/.vst/home/plugins"

export FONTCONFIG_FILE="$SCRIPT_DIR/fonts.conf"
export FONTCONFIG_PATH="/etc/fonts"
export FREETYPE_PROPERTIES="cff:no-stem-darkening=0 autofitter:no-stem-darkening=0"

# Ensure X11 UI apps don't lose authentication when we change the HOME variable
export XAUTHORITY="${XAUTHORITY:-$REAL_HOME/.Xauthority}"

# Unset host XDG variables so plugins don't accidentally bypass the fake home
unset XDG_CONFIG_HOME
unset XDG_DATA_HOME
unset XDG_DOCUMENTS_DIR

# Redefine HOME so plugins write their clutter into the fake home
export HOME="$FAKE_HOME"

# Launch REAPER
# - Gives access to the entire host system natively (no bwrap needed)
# - Plugins see the new $HOME variable and write their clutter into the fake home
exec "$SCRIPT_DIR/reaper" -cfgfile "$SCRIPT_DIR/reaper.ini" "$@"
