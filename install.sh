#!/bin/bash

# ================
# Dotfiles by    #
# Jihan Nugraha  #
# ================

set -e 

SRC_DIR="$(cd "$(dirname "$0")" && pwd)/.config"
DEST_DIR="$HOME/.config"

echo "🔧 Memindahkan file  $DEST_DIR ..."

# Buat folder tujuan kalau belum ada
mkdir -p "$DEST_DIR"

cp -r "$SRC_DIR"/* "$DEST_DIR"/

echo "✅ DONE!"
echo "JANGAN LUPA Mandi"
