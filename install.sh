#!/bin/bash

# Install Gnome Tweaks
sudo dnf install gnome-tweaks 

# Uninstall Preloaded Apps
echo "Uninstalling Preloaded Apps..."
sudo dnf remove -y firefox

# Install Flatpaks
echo "Installing Flatpaks..."
flatpak install flathub org.gnome.Loupe
flatpak install flathub org.gnome.Extensions
flatpak install flathub com.discordapp.Discord
flatpak install flathub org.gnome.Solanum

# Install Gnome Extensions
echo "You Need To Manually Install the Following Extensions:"
echo "Add to Desktop"
echo "Blur my Shell"
echo "Clipboard History"
echo "Compiz alike magic lamp effect"
echo "Dash to Dock"
echo "Desktop Cube"
echo "Desktop Icons NG (DING)"
echo "Gnome 4x UI Improvements"
echo "Impatience"
echo "Notification Banner Reloaded"
echo "Rounded Window Corners"
echo "Space Bar"
echo "Tray Icons: Reloaded"
echo "User Themes"

# Install Gnome Theme
echo "Installing Gnome Theme..."
./resources/WhiteSur/GTK/install.sh -a all -t all -m -HD --round -l -c Dark -c Light -i void
./resources/WhiteSur/GTK/install.sh -a all -t all -m -HD --round -i void
sudo flatpak override --filesystem=xdg-config/gtk-4.0
./resources/WhiteSur/Icons/install.sh -t all -a -b
./resources/WhiteSur/Icons/install.sh -t all -b
sudo ./resources/WhiteSur/Cursors/install.sh

# Install Plymouth Theme
echo "Installing Plymouth Theme..."
sudo cp -r ./resources/Plymouth/plymouthd.defaults /usr/share/plymouth/plymouthd.defaults
sudo cp -r ./resources/Plymouth/macOS /usr/share/plymouth/themes/macOS