#!/bin/bash

# Set dotfiles directory (assuming the script runs from within the cloned repo)
DOTFILES_DIR="$HOME/.dotfiles/"
BACKUP_DIR="$HOME/.dotfiles_backup"

# List of config files to symlink
dotfiles=(
    .bashrc
    .nvimrc
    .vimrc
    .zshrc
)

# List of packages to install for Linux Mint
packages=(
)

# Install necessary packages using apt
sudo apt update && sudo apt install -y "${packages[@]}"

# Create backup directory if not exists
mkdir -p "$BACKUP_DIR"

# Backup and symlink dotfiles
for file in "${dotfiles[@]}"; do
    if [ -f "$HOME/$file" ]; then
        echo "Backing up $file to $BACKUP_DIR"
        mv "$HOME/$file" "$BACKUP_DIR/"
    fi
    echo "Symlinking $DOTFILES_DIR/$file to $HOME/$file"
    ln -s "$DOTFILES_DIR/$file" "$HOME/$file"
done

echo "Dotfiles installation complete."
