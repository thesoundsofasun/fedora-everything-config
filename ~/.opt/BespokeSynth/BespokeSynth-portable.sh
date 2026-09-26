#!/usr/bin/env bash
set -e

# 1. Dynamically find the folder where this script (and the app) lives
APP_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# 2. Define the real home and the shared sandbox (Fake Home)
REAL_HOME="$HOME"
FAKE_HOME="$REAL_HOME/.vst/home/plugins"

# 3. Ensure the sandbox exists
mkdir -p "$FAKE_HOME/.local/share"

# (Only the essential font link is kept so plugin UIs don't crash)
ln -sn "$REAL_HOME/.local/share/fonts" "$FAKE_HOME/.local/share/fonts" 2>/dev/null || true

# 4. Preserve display permissions (X11 & Wayland)
export XAUTHORITY="${XAUTHORITY:-$REAL_HOME/.Xauthority}"
export WAYLAND_DISPLAY="$WAYLAND_DISPLAY"

# 5. Clear XDG variables so the app is forced to rely entirely on $HOME
unset XDG_CONFIG_HOME
unset XDG_DATA_HOME
unset XDG_DOCUMENTS_DIR

# 6. Set the trap: point $HOME to the sandbox
export HOME="$FAKE_HOME"

# 7. Launch the app (Just change "BespokeSynth" to the name of your executable)
exec "$APP_DIR/BespokeSynth" "$@"
