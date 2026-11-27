## CLI Tools
#### - LM Sensors
```
sudo dnf install lm_sensors
```
- Usage:
  - Scan the hardware
    ```
    sudo sensors-detect
    ```
  - Monitor temperatures in real time
    ```
    sensors
    watch -n 1 sensors
    ```
## Multimedia
#### - 🟦 MPV (Media Player)
- Install MPV Media Player from Flathub
  ```
  flatpak install flathub io.mpv.Mpv -y
  ```
- Install 🟩 FluidSynth for MIDI playback support
  ```
  sudo dnf install fluidsynth
  ```
- [DOWNLOAD](https://github.com/thesoundsofasun/mpv-custom-build/releases/download/latest/mpv-player-config-linux.zip) config files
- Extract archive and drop files and folders from the "config" folder in ~/.var/app/io.mpv.Mpv/config/mpv/ directory
- Allow MPV to interact with desktop:
  ```
  sudo flatpak override io.mpv.Mpv --talk-name=org.freedesktop.Flatpak
  ```

## Music Production
#### - 🟪 BespokeSynth (Virtual Modular Synthesizer)
 - [Download](https://github.com/BespokeSynth/BespokeSynth/releases) latest BespokeSynth build
 - Extract "Release" folder from archive into ~/.opt and rename it to "BespokeSynth"
 - Download [BespokeSynth-portable.sh](https://github.com/thesoundsofasun/fedora-everything-config/blob/main/~/.opt/BespokeSynth/BespokeSynth-portable.sh) and drop it in ~/.opt/BespokeSynth directory and make it executable
   ```
   chmod +x ~/.opt/BespokeSynth/BespokeSynth-portable.sh
   ``` 
 - Download [BespokeSynth.svg](https://github.com/thesoundsofasun/fedora-everything-config/blob/main/~/.local/share/icons/BespokeSynth.svg) desktop icon and drop it in ~/.local/share/icons directory
 - Download [BespokeSynth.desktop](https://github.com/thesoundsofasun/fedora-everything-config/blob/main/~/.local/share/applications/BespokeSynth.desktop) and drop it in ~/.local/share/applications directory and make it executable
   ```
   chmod +x ~/.local/share/applications/BespokeSynth.desktop
   ```
#### - 🟪 Cardinal (Virtual Modular Synthesizer)
 - [INSTALL](https://github.com/DISTRHO/Cardinal/releases) Cardinal from the official github repository
 - Extract "Cardinal" folder from downloaded archive into ~/.opt
 - Download [Cardinal.svg](https://github.com/thesoundsofasun/fedora-everything-config/blob/main/~/.local/share/icons/Cardinal.svg) desktop icon and drop it in ~/.local/share/icons directory   
 - Download [Cardinal.desktop](https://github.com/thesoundsofasun/fedora-everything-config/blob/main/~/.local/share/applications/Cardinal.desktop) and drop it in ~/.local/share/applications/ directory and make it executable
   ```
   chmod +x ~/.local/share/applications/Cardinal.desktop
   ```
#### - 🟪 Carla (Audio Plugin Host)
```
sudo dnf install Carla Carla-vst
```
 - Create symlinks so Cardinal would recognize Carla
   - Symlink in Cardinal directory:
     ```
     ln -s /usr/lib64/carla ~/.opt/Cardinal
     ```
   - Symlink in /usr/lib directory (Cardinal expects to find Carla there)
     ```
     sudo ln -s /usr/lib64/carla /usr/lib/carla
     ```
## Text Editors
#### - 🟩 Sublime Text (GUI Text Editor)
 - [Download](https://www.sublimetext.com/download) latest build
 - Extract "sublime_text" folder from archive into ~/.opt and rename it to "SublimeText"
 - Create "Data" folder in ~/.opt/SublimeText directory
   ```
   cd ~/.opt/SublimeText
   mkdir Data
   ```
 - Download [SublimeText.svg](https://github.com/thesoundsofasun/fedora-everything-config/blob/main/~/.local/share/icons/SublimeText.svg) desktop icon and drop it in ~/.local/share/icons directory
 - Download [SublimeText.desktop](https://github.com/thesoundsofasun/fedora-everything-config/blob/main/~/.local/share/applications/SublimeText.desktop) and drop it in ~/.local/share/applications directory and make it executable
   ```
   chmod +x ~/.local/share/applications/SublimeText.desktop
   ```
## Utilities
#### - 🟦 Flatseal (Flatpak permission manager)
```
flatpak install flathub com.github.tchx84.Flatseal
```
#### - 🟩 OBS Studio (Screen Recorder)
```
sudo dnf install obs
```
#### - 🟩 System Monitor (System Resource Monitoring)
```
sudo dnf install plasma-systemmonitor
```
