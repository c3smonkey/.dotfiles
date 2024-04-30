#!/usr/bin/env zsh
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# Homebrew
export PATH="/opt/homebrew/bin:${PATH}"
# .dotfiles/bin
export PATH="$HOME/.dotfiles/bin:${PATH}"

# Source the dotfiles
source ~/.dotfiles/zsh/zsh-plugins.zsh
source ~/.dotfiles/.aliases
source ~/.dotfiles/.variablesrc
# Source the local files
sourceIfExists ~/.variables
sourceIfExists ~/.helsanarc

# Source other files
source ~/.cargo/env
source ~/.sdkman/bin/sdkman-init.sh
source ~/powerlevel10k/powerlevel10k.zsh-theme

# Setup other stuff
eval "$(pyenv init -)"
eval "$(thefuck --alias)"
eval "$(zoxide init zsh)"
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
