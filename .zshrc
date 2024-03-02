# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#!/usr/bin/env zsh
# HOMEBREW
export PATH="/opt/homebrew/bin:${PATH}"

# Check if a file exists and source it
# usage: check_and_source_file FILE
check_and_source_file() {
    local file="$1"
    if [ -f "$file" ]; then
        source "$file"
    fi
}

eval "$(thefuck --alias)"
eval "$(zoxide init zsh)"

## DOTFILES
check_and_source_file ~/.dotfiles/.aliasrc
check_and_source_file ~/.dotfiles/.variablesrc
check_and_source_file ~/.variables
check_and_source_file ~/.helsanarc
# SDKMAN
source "$HOME/.sdkman/bin/sdkman-init.sh"

source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
