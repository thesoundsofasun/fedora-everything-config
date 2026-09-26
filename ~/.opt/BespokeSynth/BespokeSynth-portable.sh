#!/usr/bin/env bash
set -e

REAL_HOME="$HOME"
# Your sandbox folder for VST operations
FAKE_HOME="$REAL_HOME/.vst/home/plugins"
# Your explicit target for Bespoke configuration files
BESPOKE_DIR="$REAL_HOME/.opt/BespokeSynth"

# Ensure directories exist where you want them
mkdir -p "$FAKE_HOME/.local/share"
mkdir -p "$BESPOKE_DIR/.config"
mkdir -p "$BESPOKE_DIR/Documents"

export XAUTHORITY="${XAUTHORITY:-$REAL_HOME/.Xauthority}"
unset XDG_DATA_HOME

# 1. Keeps your VST environment contained here
export HOME="$FAKE_HOME"

# 2. Traps Bespoke configurations cleanly inside its own folder
export XDG_CONFIG_HOME="$BESPOKE_DIR/.config"
export XDG_DOCUMENTS_DIR="$BESPOKE_DIR/Documents"

exec "$BESPOKE_DIR/BespokeSynth" "$@"
