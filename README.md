# Fedora Config
--------------------------------------------------------------------------
## System settings
#### - Boot Loader (GRUB)
#### - File System (btrfs)
--------------------------------------------------------------------------
## Desktop Environment (KDE Plasma)
### Packages:
#### - Desktop - "plasma-desktop"
#### - Login Manager - "plasma-login-manager"
#### - File Explorer - "dolphin"
#### - Screen Manager - "kscreen"
#### - Network Manager - "plasma-nm"
#### - Audio Manager for Pipewire - "plasma-pa" 
```
sudo dnf install plasma-desktop plasma-login-manager dolphin kscreen plasma-nm plasma-pa
```
#### - Enabling KDE Plasma:
```
sudo systemctl set-default graphical.target
```
#### - Enabling Plasma Login Manager:
```
sudo systemctl enable plasmalogin
```
--------------------------------------------------------------------------
## Package Managers:
#### - Flatpak
- Install Flatpak
```
sudo dnf install flatpak
```
- Enable Flathub Repository
```
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
```
- Enable RPM Fusion (free and nonfree)
```
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

## Essential Packages:
#### - Password Manager - "keepassxc"
```
sudo dnf install keepassxc
```
#### - Terminal Emulator - "konsole"
```
sudo dnf install konsole
```
#### - Text Editor - "kate"
```
sudo dnf install kate
```
#### - Web Browser - "firefox"
```
sudo dnf install firefox
```
## Compatibility Packages
#### - AppImage support - "fuse" and "fuse-libs"
```
sudo dnf install fuse fuse-libs
```

#### - Multimedia
##### MPV Media Player
- Install MPV Media Player from Flathub
```
flatpak install flathub io.mpv.Mpv -y
```
- Install FluidSynth for MIDI playback support
```
sudo dnf install fluidsynth
```
- Install configuration files for MPV Player
```
https://github.com/thesoundsofasun/mpv-custom-build/archive/refs/heads/main.zip
```
- Drop mpv.conf and input.conf to ~/.var/app/io.mpv.Mpv/config/mpv/
- Drop script files to ~/.var/app/io.mpv.Mpv/config/mpv/scripts
- Drop fonts to ~/.var/app/io.mpv.Mpv/config/mpv/fonts
- Drop "midi-synth" folder to ~/.var/app/io.mpv.Mpv/config/mpv/
- Allow MPV to interact with desktop
```
flatpak override io.mpv.Mpv --talk-name=org.freedesktop.Flatpak
```

#### - Multimedia Codec
- Swap FFMPEG free with FFMPEG full (RPM)
```
sudo dnf swap ffmpeg-free ffmpeg --allowerasing
```
## Utilities
#### - Archivator - "ark"
```
sudo dnf install ark
```
#### - Password manager - "keepassxc"
```
sudo dnf install keepassxc
```
#### - File Sharing - Local Send (Flatpak (Flathub))
```
flatpak install flathub org.localsend.localsend_app
```
- Open Firewall ports for 53317/tcp and 53317/udp
```
sudo firewall-cmd --permanent --add-port=53317/udp
sudo firewall-cmd --permanent --add-port=53317/tcp
sudo firewall-cmd --reload
```
#### - Screenshot - "spectacle"
```
sudo dnf install spectacle
```
### Audio Setup:
--------------------------------------------------------------------------
# Clean uninstalling packages:
### 1st step: Uninstallation
```
sudo dnf remove "package"
```
### 2nd step: Removing orphaned dependencies
```
sudo dnf autoremove
```
### 3rd step: Removing residual files from /home directory
#### - Find the files with a name of the package that gets deleted:
```
find ~ iname "*package*"
```
#### - Delete the files that were found in /home directory 
```
rm -rf "package"
```
### 4th step: Audit if there files that were installed outside of home directory
```
sudo find / -iname "*alacritty*" 2>/dev/null
```
