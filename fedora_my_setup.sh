#!/bin/bash

# Title
echo "###################"
echo "# MY FEDORA SETUP #"
echo "###################"
echo 


# Enable fractional scaling for user
echo "##############"
echo "# 1. SCALING #"
echo "##############"
echo
echo "1. Enabling fractional scaling for user"
sudo gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"
echo 
echo "Enabled! Go to Settings > Display > Scale"
echo "Press ENTER to continue"
read 

# Fractional scaling for gdm
echo "2. Configuring fractional scaling on GDM"

# Copy monitors.xml file to ~gdm/.config/
echo "Copying monitors.xml file"
sudo cp ~/.config/monitors.xml ~gdm/.config/monitors.xml

# Copy monitors.xml file to /var/lib/gdm/.config/
sudo cp ~/.config/monitors.xml /var/lib/gdm/.config/

# Enable fractional scaling for gdm user
echo "3. Enable fractional scaling for GDM user"
sudo -u gdm dbus-launch gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"
echo
echo "Enabled!"
echo "Press ENTER to continue"
read 

# Setting Grub theme
echo "#################"
echo "# 2. GRUB SETUP #"
echo "#################"

echo "1. Create yoga theme folder"
sudo mkdir /usr/share/grub/themes/yoga

echo "2. Clone theme git folder"
git clone https://github.com/mBilG/lenovo-yoga-grub-theme.git $HOME

echo "3. Move theme to folder"
sudo mv -rf $HOME/lenovo-yoga-grub-theme-master/yoga/* usr/share/grub/themes/yoga

echo "4. Cleaning"
rm -rf $HOME/lenovo-yoga-grub-theme-master

echo
echo "5. Edit /etc/default/grub file"
GRUB_FILE_PATH="/etc/default/grub"
SEARCH_THIS="GRUB_TERMINAL=console"
REPLACE_WITH="#GRUB_TERMINAL=console"
sudo sed -i "s/${SEARCH_THIS}/${REPLACE_WITH}/" "$GRUB_FILE_PATH"

ADD_LINE="GRUB_THEME=\"/usr/share/grub/themes/yoga/theme.txt\""
sudo echo "$ADD_LINE" >> "$GRUB_FILE_PATH"

echo
echo "6. Update Grub"
sudo grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg

echo
echo "Press ENTER to Reboot and Test"
read
sudo reboot