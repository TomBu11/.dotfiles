#!/bin/bash

# Set dotfiles directory (assuming the script runs from within the cloned repo)
DOTFILES_DIR="$HOME/.dotfiles/"
BACKUP_DIR="$HOME/.dotfiles_backup"

# List of config files and directories to symlink
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
for target in "${dotfiles[@]}"; do
    old="$HOME/$target"
    new="$DOTFILES_DIR/$target"

    if [ -e "$old" ] || [ -L "$old" ]; then
        echo "Backing up $target to $BACKUP_DIR"
        mv "$old" "$BACKUP_DIR/"
    fi

    echo "Symlinking $new to $old"
    ln -s "$new" "$old"
done

echo "Dotfiles installation complete."
