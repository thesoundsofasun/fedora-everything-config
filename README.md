# Fedora Config

## System settings
#### - Boot Loader (GRUB)
#### - File System (ext4) - 1 GiB
--------------------------------------------------------------------------
## Desktop Environment (KDE Plasma)
#### - Plasma Desktop (Desktop)
#### - Plasma Login Manager (Login Manager)
#### - Dolphin - (File Explorer)
#### - KScreen - (Screen Manager)
#### - PlasmaNM - (Network Manager)
#### - PlasmaPA - (Audio Manager for Pipewire) 
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
## Package Managers
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
  sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-    $(rpm -E %fedora).noarch.rpm
  ```
--------------------------------------------------------------------------
## Compatibility
#### - AppImage support - "fuse" and "fuse-libs"
```
sudo dnf install fuse fuse-libs
```
#### - HEIC/HEIF formats support
```
sudo dnf install libheif-freeworld qt-heif-image-plugin
```
#### - Multimedia formats support
- Swap FFMPEG free with FFMPEG full (RPM)
  ```
  sudo dnf swap ffmpeg-free ffmpeg --allowerasing
  ```
--------------------------------------------------------------------------
## Graphics
#### - Blender (3D Redactor)
```
sudo dnf install blender
```
## Internet
#### - Firefox (Web Browser)
```
sudo dnf install firefox
```
## Multimedia
#### - qView (Image Viewer)
```
sudo dnf install qview
```
#### - MPV (Media Player)
- Install MPV Media Player from Flathub
  ```
  flatpak install flathub io.mpv.Mpv -y
  ```
- Install FluidSynth for MIDI playback support
  ```
  sudo dnf install fluidsynth
  ```
- [DOWNLOAD](https://github.com/thesoundsofasun/mpv-custom-build/releases/download/latest/mpv-player-config-linux.zip) config files
- Extract archive and drop files and folders from the "config" folder into ~/.var/app/io.mpv.Mpv/config/mpv/ directory
- Allow MPV to interact with desktop:
  ```
  sudo flatpak override io.mpv.Mpv --talk-name=org.freedesktop.Flatpak
  ```
## Office
#### - OnlyOffice (Office Suite)
- Add OnlyOffice repository
  ```
  sudo dnf install https://download.onlyoffice.com/repo/centos/main/noarch/onlyoffice-repo.noarch.rpm
  ```
- Install OnlyOffice
  ```
  sudo dnf install onlyoffice-desktopeditors -y
  ```
## Text Editors
#### - Micro (Terminal Text Editor)
```
sudo dnf install micro
```
#### - Kate (GUI Text Editor)
```
sudo dnf install kate
```
## Utilities
#### - Ark (Archivator)
```
sudo dnf install ark
```
#### - qpwgraph (Pipewire Graph Manager)
```
sudo dnf install qpwgraph
```
#### - Local Send (File Sharing) (Flatpak (Flathub))
```
flatpak install flathub org.localsend.localsend_app
```
- Open Firewall ports for 53317/tcp and 53317/udp
  ```
  sudo firewall-cmd --permanent --add-port=53317/udp
  sudo firewall-cmd --permanent --add-port=53317/tcp
  sudo firewall-cmd --reload
  ```
#### - KeePassXC - (Password manager)
```
sudo dnf install keepassxc
```
#### - Konsole (Terminal Emulator)
```
sudo dnf install konsole
```
#### - OBS Studio (Screen Recorder)
```
sudo dnf install obs
```
#### - qBittorrent (Torrent Downloader)
```
sudo dnf install qbittorrent
```
#### - Spectacle - (Screenshot Application)
```
sudo dnf install spectacle
```
#### - System Monitor (System Resource Monitoring)
```
sudo dnf install plasma-systemmonitor
```


--------------------------------------------------------------------------
## Custom bash Scripts
#### Find all files in "/" directory with exception of system ones
```
echo "alias findr='find / -path /proc -prune -o -path /sys -prune -o -path /dev -prune -o -path /run -prune -o -print 2>/dev/null | while read -r file; do if ! rpm -qf \"\$file\" &>/dev/null; then echo \"\$file\"; fi; done | grep -i'" >> ~/.bashrc && source ~/.bashrc

source ~/.bashrc
```
--------------------------------------------------------------------------

## Clean uninstalling packages
#### 1st step: Uninstallation
```
sudo dnf autoremove "package"
```
#### 2nd step: Removing orphaned dependencies
```
sudo dnf autoremove
```
#### 3rd step: Removing residual files
- Find the files with a name of the package that gets deleted:
  - Scans "/" directory and shows all files
    ```
    sudo find / -iname "*package*" 2>/dev/null
    ```
  - Scans "/" directory and shows all files excluding system files (using custom bash script)
    ```
    findr "package"
    ```
- Delete the files that were found (exluding the ones that are not part of the targeted package)
  ```
  rm -rf /path
  ```
