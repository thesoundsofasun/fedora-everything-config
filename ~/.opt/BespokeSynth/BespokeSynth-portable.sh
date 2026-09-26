#!/usr/bin/env bash
set -e

# 1. Dynamically find the folder where this script (and Bespoke) lives
BESPOKE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
REAL_HOME="$HOME"
FAKE_HOME="$REAL_HOME/.vst/home/plugins"

# 2. Ensure directories exist
mkdir -p "$FAKE_HOME/.local/share"
mkdir -p "$BESPOKE_DIR/.config"
mkdir -p "$BESPOKE_DIR/.local/share"
mkdir -p "$BESPOKE_DIR/Documents"

# 3. Preserve UI and display permissions (Wayland + X11)
export XAUTHORITY="${XAUTHORITY:-$REAL_HOME/.Xauthority}"
export WAYLAND_DISPLAY="$WAYLAND_DISPLAY"

# 4. Keeps your VST environment contained here (The Trap for Plugins)
export HOME="$FAKE_HOME"

# 5. Traps Bespoke cleanly inside its own folder (The Trap for Bespoke)
export XDG_CONFIG_HOME="$BESPOKE_DIR/.config"
export XDG_DATA_HOME="$BESPOKE_DIR/.local/share"
export XDG_DOCUMENTS_DIR="$BESPOKE_DIR/Documents"

# Launch Bespoke
exec "$BESPOKE_DIR/BespokeSynth" "$@"
