#!/bin/bash

# ╔══════════════════════════════════════════════════╗
# ║ 🧠 Script d'installation pour config Hyprland 🧠 ║
# ╚══════════════════════════════════════════════════╝

set -e

# 📦 Packages requis
DEPENDENCIES=(
  hyprland
  waybar
  rofi
  kitty
  alacritty
  fastfetch
  wofi
  dconf
  wl-clipboard
  grim
  slurp
  hyprshot
  pavucontrol
)

# 📁 Dossiers de config à copier
CONFIG_DIRS=(
  hypr
  waybar
  fastfetch
  kitty
  rofi
  alacritty
  wofi
  dconf
  pulse
)

echo "🧪 Vérification des droits sudo..."
if ! sudo -v; then
  echo "❌ Échec : ce script nécessite sudo pour installer les paquets."
  exit 1
fi

echo "📦 Installation des dépendances via pacman..."
sudo pacman -Syu --noconfirm "${DEPENDENCIES[@]}"

echo ""
echo "🛠️  Copie des fichiers de configuration vers ~/.config..."

for dir in "${CONFIG_DIRS[@]}"; do
  SRC="./.config/$dir"
  DEST="$HOME/.config/$dir"

  if [ -d "$SRC" ]; then
    echo "➡️  Copie de $dir..."
    mkdir -p "$DEST"
    cp -rf "$SRC/"* "$DEST/"
  else
    echo "⚠️  Dossier $dir non trouvé dans le repo. Skip."
  fi
done

echo ""
echo "✅ Installation terminée !"
echo "🔁 Redémarre ta session Hyprland pour voir les changements."
echo "🌌 Enjoy ta config Tokyo Night ✨"

exit 0
