#!/bin/bash
set -e

echo "🚀 Starting dotfiles install..."

# 1. Update sistem
echo "📦 Updating system..."
sudo pacman -Syu --noconfirm

# 2. Install paket dari repo resmi
echo "📥 Installing main packages..."
sudo pacman -S --needed --noconfirm \
    hyprland \
    hyprpaper \
    waybar \
    dunst \
    nemo \
    python \
    python-pip \
    wl-clipboard \
    xdg-desktop-portal-hyprland \
    gtk3 \
    ttf-jetbrains-mono \
    noto-fonts \
    noto-fonts-emoji \
    wofi \
    swww

# 3. Copy dotfiles ke home
echo "📂 Copying config files..."
cp -r .config ~/
cp -r preview ~/ 2>/dev/null || true

echo "✅ Installation complete!"
echo "💡 DIsarankan logout/reboot lagi untuk apply config."
