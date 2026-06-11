#!/usr/bin/env zsh

# -----------------------------
# PATHs (früh setzen)
# -----------------------------

# .dotfiles/bin
export PATH="$HOME/.dotfiles/bin:$PATH"

# Homebrew
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"

# Go
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH="$PATH:$GOPATH:$GOBIN"

# pipx / user bins (FIXED)
export PATH="$PATH:$HOME/.local/bin"

# -----------------------------
# Core ENV
# -----------------------------

# Lazygit
export LG_CONFIG_FILE="$HOME/.dotfiles/.config/lazygit/.lazygit"

# aerc
export AERC_CONFIG_FILE="$HOME/.dotfiles/.config/aerc/aerc.conf"
export AERC_ACCOUNTS_MIN_CONF="${AERC_ACCOUNTS_MIN_CONF:-$HOME/.secrets/aerc/accounts.min.conf}"
export AERC_ACCOUNTS_CONF="${AERC_ACCOUNTS_CONF:-$HOME/.secrets/aerc/accounts.conf}"
export AERC_BINDS_FILE="$HOME/.dotfiles/.config/aerc/binds.conf"

# -----------------------------
# 🔥 WICHTIG: Basis-Funktionen zuerst laden
# -----------------------------

# damit sourceIfExists & evtl. ialias existieren
source "$HOME/.dotfiles/zsh/plugins/functions/functions.zsh"
source "$HOME/.dotfiles/zsh/plugins/custom/sourceIfExists.zsh"

# -----------------------------
# Plugins / Init
# -----------------------------

source ~/.dotfiles/zsh/init-zsh-plugins.zsh

# -----------------------------
# Aliases & Variablen (brauchen Funktionen!)
# -----------------------------

source ~/.dotfiles/.aliases
source ~/.dotfiles/.variablesrc

# -----------------------------
# Lokale Overrides
# -----------------------------

sourceIfExists ~/.variables
sourceIfExists ~/.helsanarc

# -----------------------------
# Externe Tools
# -----------------------------

source ~/.cargo/env
source ~/.sdkman/bin/sdkman-init.sh
source ~/.dotfiles/zsh/spellfix.zsh

# -----------------------------
# aerc helper
# -----------------------------

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
