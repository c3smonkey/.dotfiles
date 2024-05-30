#!/bin/zsh

ZETTELKASTEN_INBOX="$HOME/git/github/marzelwidmer/zettelkasten/_inbox/$(date +%Y-%m-%d).md"


zettelkasten() {
    echo "# $(date)" >> $ZETTELKASTEN_INBOX
    echo "$@" >> $ZETTELKASTEN_INBOX
    echo "" >> $ZETTELKASTEN_INBOX
}

