#!/bin/sh
set -eu

echo "==> Installing packages..."

sudo apt-get update
sudo apt-get install -y \
    git \
    zsh \
    zsh-syntax-highlighting \
    curl \
    fzf \
    tmux \
    zoxide \
    ripgrep

# Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "==> Installing Oh My Zsh..."

    export RUNZSH=no
    export CHSH=no

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Oh My Zsh plugins
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    echo "==> Installing zsh-autosuggestions..."
    git clone https://github.com/zsh-users/zsh-autosuggestions \
        "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
fi

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autocomplete" ]; then
    echo "==> Installing zsh-autocomplete..."
    git clone https://github.com/marlonrichert/zsh-autocomplete \
        "$ZSH_CUSTOM/plugins/zsh-autocomplete"
fi


echo "==> Done!"
