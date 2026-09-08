#!/usr/bin/env bash
set -e

# The location where plugins should think $HOME is
FAKE_HOME="$HOME/.vst/home/plugins"

# Ensure our fake home exists
mkdir -p "$FAKE_HOME"
ln -sn "$HOME/.local/share/fonts"  "$FAKE_HOME/.local/share/fonts" 2>/dev/null || true

# Ensure X11 UI apps don't lose authentication when we change the HOME variable
export XAUTHORITY="${XAUTHORITY:-$HOME/.Xauthority}"

# Launch REAPER
# - Gives access to the entire host system (so project files and audio drivers work)
# - Redefines HOME so plugins write their clutter into the fake home
# - Unsets host XDG variables so plugins don't accidentally bypass the fake home
exec bwrap \
    --dev-bind / / \
    --setenv HOME "$FAKE_HOME" \
    --unsetenv XDG_CONFIG_HOME \
    --unsetenv XDG_DATA_HOME \
    --unsetenv XDG_DOCUMENTS_DIR \
    "$HOME/.opt/REAPER/reaper" "$@"
