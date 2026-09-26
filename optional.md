 - Create symlinks so Cardinal would recognize Carla
   - Symlink in Cardinal directory:
     ```
     ln -s /usr/lib64/carla ~/.opt/Cardinal
     ```
   - Symlink in /usr/lib directory (Cardinal expects to find Carla there)
     ```
     sudo ln -s /usr/lib64/carla /usr/lib/carla
     ```
#### - 🟪 Carla (Audio Plugin Host)
```
sudo dnf install Carla Carla-vst
```
#### - 🟪 BespokeSynth (Virtual Modular Synthesizer)
 - [Download](https://github.com/BespokeSynth/BespokeSynth/releases) recent BespokeSynth build
 - Extract "Release" folder from archive and rename it to "BespokeSynth"
 - Download [BespokeSynth-portable.sh](https://github.com/thesoundsofasun/fedora-everything-config/blob/main/~/.opt/BespokeSynth/BespokeSynth-portable.sh) and drop it in ~/.opt/BespokeSynth directory and make it executable
   ```
   chmod +x ~/.opt/BespokeSynth/BespokeSynth-portable.sh
   ``` 
 - Download [BespokeSynth.svg](https://github.com/thesoundsofasun/fedora-everything-config/blob/main/~/.local/share/icons/BespokeSynth.svg) desktop icon and drop it in ~/.local/share/icons directory
 - Download [BespokeSynth.desktop](https://github.com/thesoundsofasun/fedora-everything-config/blob/main/~/.local/share/applications/BespokeSynth.desktop) and drop it in ~/.local/share/applications directory and make it executable
   ```
   chmod +x ~/.local/share/applications/BespokeSynth.desktop
   ```
