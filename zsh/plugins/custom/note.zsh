#!/bin/zsh

ZET="$HOME/git/notes/zettelkasten/$(date +%Y-%m-%d).md"

note() {
    echo "# $(date)" >> $ZET
    echo "$@" >> $ZET
    echo "" >> $ZET
}

