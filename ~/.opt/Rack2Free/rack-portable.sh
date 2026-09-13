#!/bin/bash

# 1. Ensure the user folder exists
mkdir -p "$HOME/.opt/Rack2Free/user"

# 2. Move to the directory where the Rack executable lives
cd "$HOME/.opt/Rack2Free" || exit

# 3. Launch VCV Rack pointed at that local user folder
./Rack -u ./Rack2
