#!/usr/bin/env bash
set -e

# Save the real home path so we can launch REAPER later
REAL_HOME="$HOME"

# The location where plugins should think $HOME is
FAKE_HOME="$HOME/.vst/home/plugins"

# Ensure our fake home exists (Added .local/share so your font symlink actually works)
mkdir -p "$FAKE_HOME/.local/share"
ln -sn "$REAL_HOME/.local/share/fonts" "$FAKE_HOME/.local/share/fonts" 2>/dev/null || true

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
exec "$REAL_HOME/.opt/REAPER/reaper" "$@"
