#!/usr/bin/env zsh

# .dotfiles/bin
export PATH="$HOME/.dotfiles/bin:${PATH}"

# Homebrew
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:${PATH}"
 
# Go path
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH
export PATH=$PATH:$GOBIN

# Lazygit 
export LG_CONFIG_FILE="$HOME/.dotfiles/.config/lazygit/.lazygit"

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
source ~/.dotfiles/zsh/spellfix.zsh

# aerc (use repo config + private accounts file)
export AERC_CONFIG_FILE="$HOME/.dotfiles/.config/aerc/aerc.conf"
export AERC_ACCOUNTS_MIN_CONF="${AERC_ACCOUNTS_MIN_CONF:-$HOME/.secrets/aerc/accounts.min.conf}"
export AERC_ACCOUNTS_CONF="${AERC_ACCOUNTS_CONF:-$HOME/.secrets/aerc/accounts.conf}"
export AERC_BINDS_FILE="$HOME/.dotfiles/.config/aerc/binds.conf"
aerc-setup() {
  command "$HOME/.dotfiles/.config/aerc/generate-accounts.sh" --interactive --quiet "$AERC_ACCOUNTS_MIN_CONF" "$AERC_ACCOUNTS_CONF"
}
aerc() {
  if [ ! -f "$AERC_ACCOUNTS_MIN_CONF" ]; then
    printf 'aerc: missing minimal accounts file at %s\n' "$AERC_ACCOUNTS_MIN_CONF" >&2
    printf 'Run interactive setup: aerc-setup\n' >&2
    return 1
  fi

  if [ ! -f "$AERC_ACCOUNTS_CONF" ]; then
    printf 'aerc: missing generated accounts file at %s\n' "$AERC_ACCOUNTS_CONF" >&2
    printf 'Run setup first: aerc-setup\n' >&2
    return 1
  fi

  if [ -s "$AERC_BINDS_FILE" ]; then
    command aerc -C "$AERC_CONFIG_FILE" -A "$AERC_ACCOUNTS_CONF" -B "$AERC_BINDS_FILE" "$@"
  else
    command aerc -C "$AERC_CONFIG_FILE" -A "$AERC_ACCOUNTS_CONF" "$@"
  fi
}


# Created by `pipx` on 2025-09-08 18:55:14
export PATH="$PATH:/$HOME/.local/bin"
