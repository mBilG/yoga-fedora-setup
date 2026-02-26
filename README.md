# Personal Customizations for my Fedora Setup on a Lenovo Yoga Laptop

**Caution!** 

I have not tested the .sh file. I just used it to put all the commands in one place.


---
## 1. Fractional Scaling
### a. For current user
`sudo gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"`
### b. For gdm
`sudo cp ~/.config/monitors.xml /etc/xdg/monitors.xml`

These stopped working:
`sudo cp ~/.config/monitors.xml ~gdm/.config/monitors.xml`
`sudo cp ~/.config/monitors.xml /var/lib/gdm/.config/`
`sudo -u gdm dbus-launch gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"`

---

## 2. Grub Theme
### a. Make theme folder
`sudo mkdir /usr/share/grub/themes/yoga`

### b. Clone theme
`git clone https://github.com/mBilG/lenovo-yoga-grub-theme.git $HOME`

### c. Copy theme
`sudo mv -rf $HOME/lenovo-yoga-grub-theme-master/yoga/* usr/share/grub/themes/yoga`

### d. Cleanup folder
`rm -rf $HOME/lenovo-yoga-grub-theme-master`

### e. Set /etc/default/grub file
`sudo nano /etc/default/grub`

Change:

"GRUB_TERMINAL=console" -> "#GRUB_TERMINAL=console"

Add:

`GRUB_THEME="/usr/share/grub/themes/yoga/theme.txt"`

Save file

### f. Update Grub
`sudo grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg`

Reboot

---
