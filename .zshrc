#!/usr/bin/env zsh
# Check if a file exists and source it
# usage: check_and_source_file FILE
check_and_source_file() {
    local file="$1"
    if [ -f "$file" ]; then
        source "$file"
    else
        echo "$file does not exist."
    fi
}

# SDKMAN
source "$HOME/.sdkman/bin/sdkman-init.sh"
eval "$(thefuck --alias)"
eval "$(zoxide init zsh)"

## DOTFILES
check_and_source_file ~/.dotfiles/.aliasrc
check_and_source_file ~/.dotfiles/.variablesrc
check_and_source_file ~/.variables
## HELSANA
check_and_source_file ~/.helsanarc

