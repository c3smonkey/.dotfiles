#!/usr/bin/env zsh
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# HOMEBREW
export PATH="/opt/homebrew/bin:${PATH}"




# Load Plugins
source "$HOME/.dotfiles/zsh/zsh-plugins.zsh"

# Aliases
source ~/.dotfiles/.aliases

# Variables
source ~/.dotfiles/.variablesrc

# Rust
source  ~/.cargo/env

# SDKMAN
source ~/.sdkman/bin/sdkman-init.sh

# p10k
source ~/powerlevel10k/powerlevel10k.zsh-theme


sourceIfExists() {
  if [ -e $1 ]; then
    source $1;
  fi
}

sourceIfExists ~/.variables
sourceIfExists ~/.helsanarc

# TheFuck
eval "$(thefuck --alias)"
# Zoxide
eval "$(zoxide init zsh)"
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
