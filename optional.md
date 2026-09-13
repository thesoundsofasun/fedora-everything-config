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
