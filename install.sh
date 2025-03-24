#!/bin/bash

# Set dotfiles directory (assuming the script runs from within the cloned repo)
DOTFILES_DIR="$HOME/.dotfiles"
BACKUP_DIR="$HOME/.dotfiles_backup"

# List of config files and directories to symlink
dotfiles=(
    .bashrc
    .nvimrc
    .vimrc
    .zshrc
    .gitconfig
    .oh-my-zsh/custom
    .config/cinnamon
    .config/copyq/copyq.conf
    .config/copyq/themes/mint.ini
    .config/discord/settings.json
    .config/flameshot
    .config/gtk-3.0
    .config/i3
    .config/input-remapper-2
    .config/mintmenu
    .config/nemo
    .config/neofetch
    .config/nvim
    .config/rofi
    .config/teamviewer
    .config/tmux
    .config/remmina
    .config/VirtualBox
    .config/xed
)

# List of packages to install for Linux Mint
packages=(
    # cider
    # code
    # copyq
    # discord
    # displaylink-driver
    # fzf
    # git
    # gpart
    # pip
    # remmina
    # rofi
    # xdotool
    # z
    # zsh
)

# Install necessary packages using apt
sudo apt update && sudo apt install -y "${packages[@]}"

# Create backup directory if not exists
mkdir -p "$BACKUP_DIR"

# Backup and symlink dotfiles
for target in "${dotfiles[@]}"; do
    old="$HOME/$target"
    new="$DOTFILES_DIR/$target"
    backup="$BACKUP_DIR/$target"

    if [ -e "$old" ]; then
        if [ -e "$new" ]; then
            echo "Backing up $target to $BACKUP_DIR"
            mkdir -p "$(dirname "$backup")"
            mv "$old" "$backup"
        else
            echo "Config not in dotfiles repo adding"
            mkdir -p "$(dirname "$new")"
            mv "$old" "$new"
        fi
    fi

    echo -e "Symlinking $new to $old\n"
    ln -s "$new" "$old"
done

echo "Dotfiles installation complete."
