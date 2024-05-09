#!/bin/zsh

typeset -a ialiases
ialiases=()
ialias() {
    alias "$@"
    local aliasName="${1%%=*}"
    ialiases+=("$aliasName")
}
expand-alias-space() {
    if [[ ! ${ialiases[(r)$LBUFFER]} ]]; then
        # Expand the alias
        zle _expand_alias
        # Insert a space
        zle self-insert
    else
        # If it's an internal alias, just insert the space
        zle self-insert
    fi
}
zle -N expand-alias-space
bindkey " " expand-alias-space
