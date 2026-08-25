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

# Clean uninstalling packages:
## 1st step: Uninstallation
```
sudo dnf remove "package"
```
## 2nd step: Removing orphaned dependencies
```
sudo dnf autoremove
```
## 3rd step: Removing residual files from /home directory
### Find the files with a name of the package that gets deleted:
```
find ~ iname "*package*"
```
### Delete the files that were found in /home directory 
```
rm -rf "package"
```
## 4th step: Audit if there files that were installed outside of home directory
```
sudo find / -iname "*alacritty*" 2>/dev/null
```
