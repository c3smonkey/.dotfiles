#!/usr/bin/env zsh
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# HOMEBREW
export PATH="/opt/homebrew/bin:${PATH}"

sourceIfExists() {
  if [ -e $1 ]; then
    source $1;
  fi
}


## DOTFILES
sourceIfExists ~/.dotfiles/zsh/checkBrewBinary.zsh
sourceIfExists ~/.dotfiles/zsh/aliases/.aliasrc
sourceIfExists ~/.dotfiles/.variablesrc
sourceIfExists ~/.variables
sourceIfExists ~/.helsanarc

# Rust
source  ~/.cargo/env
# SDKMAN
source ~/.sdkman/bin/sdkman-init.sh
# p10k
source ~/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
