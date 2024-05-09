#!/usr/bin/env zsh

# .dotfiles/bin
export PATH="$HOME/.dotfiles/bin:${PATH}"

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

# Homebrew
export PATH="/opt/homebrew/bin:${PATH}"

