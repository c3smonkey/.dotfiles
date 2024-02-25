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

