#!/bin/bash

# Install Gnome Tweaks
sudo dnf install gnome-tweaks -y

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
sudo dnf install -y sassc
sudo dnf install -y glib2-devel
./resources/WhiteSur/GTK/install.sh -a alt -m -HD -i void -l
sudo flatpak override --filesystem=xdg-config/gtk-4.0
./resources/WhiteSur/Icons/install.sh -b

# Install Plymouth Theme
echo "Installing Plymouth Theme..."
sudo cp -r ./resources/Plymouth/plymouthd.defaults /usr/share/plymouth/plymouthd.defaults
sudo cp -r ./resources/Plymouth/macOS /usr/share/plymouth/themes/macOS
sudo dnf install plymouth-plugin-script
sudo plymouth-set-default-theme macOS && sudo plymouth-set-default-theme macOS -R

# Install Google Chrome
curl https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm -O
sudo dnf install ./google-chrome-stable_current_x86_64.rpm -y

# Install VSCode
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
dnf check-update
sudo dnf install code # or code-insiders

# Install Node.js
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
source ~/.bashrc
nvm install node
node --version
sudo npm install -g yarn
yarn --version
