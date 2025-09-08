#!/usr/bin/env zsh

# .dotfiles/bin
export PATH="$HOME/.dotfiles/bin:${PATH}"

# Homebrew
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:${PATH}"
 
# Go path
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH
export PATH=$PATH:$GOBIN

# Lazygit 
export LG_CONFIG_FILE="$HOME/.dotfiles/.config/lazygit/.lazygit"

# Source the dotfiles
source ~/.dotfiles/zsh/init-zsh-plugins.zsh
source ~/.dotfiles/.aliases
source ~/.dotfiles/.variablesrc
# Source the local files
sourceIfExists ~/.variables
sourceIfExists ~/.helsanarc

# Source other files
source ~/.cargo/env
source ~/.sdkman/bin/sdkman-init.sh
source ~/.dotfiles/zsh/spellfix.zsh


# Created by `pipx` on 2025-09-08 18:55:14
export PATH="$PATH:/$HOME/.local/bin"
