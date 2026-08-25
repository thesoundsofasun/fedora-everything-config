# Steps to configure Fedora Everything

## Boot Loader (GRUB) 
## File System (btrfs)
## Desktop Environment (KDE Plasma)
### Packages:
#### Desktop - "plasma-desktop"
#### Login Manager - "plasma-login-manager"
#### File Explorer - "dolphin"
#### Screen Manager - "kscreen"
#### Network Manager - "plasma-nm"
#### Audio Manager for Pipewire - plasma-pa 
```
sudo dnf install plasma-desktop plasma-login-manager dolphin kscreen plasma-nm plasma-pa
```
#### Enabling KDE Plasma:
```
sudo systemctl set-default graphical.target
```
#### Enabling Plasma Login Manager:
```
sudo systemctl enable plasmalogin
```
## Essential Packages:
#### Terminal Emulator - "konsole"
```
sudo dnf install konsole
```
### Audio Setup:


### Essential Applications:
#### Web Browser - "firefox"
