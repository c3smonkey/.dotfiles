#!/usr/bin/env zsh

set -e

DOTFILES_LOCATION=${HOME}/.dotfiles

PATH_TO_K9S="${HOME}/Library/Application Support/k9s"

mv ${PATH_TO_K9S}/config.yaml ${PATH_TO_K9S}/config.yaml.bk

ln -sf "${HOME}/.dotfiles/k9s/config.yaml" "${HOME}/Library/Application Support/k9s/config.yaml"
ln -sf "${HOME}/.dotfiles/k9s/monokai.yaml" "${HOME}/Library/Application Support/k9s/skins/monokai.yaml"
ln -sf "${HOME}/.dotfiles/k9s/dracula.yaml" "${HOME}/Library/Application Support/k9s/skins/dracula.yaml"
ln -sf "${HOME}/.dotfiles/k9s/prod.yaml" "${HOME}/Library/Application Support/k9s/skins/prod.yaml"
ln -sf "${HOME}/.dotfiles/k9s/test.yaml" "${HOME}/Library/Application Support/k9s/skins/test.yaml"
ln -sf "${HOME}/.dotfiles/k9s/transparent.yaml" "${HOME}/Library/Application Support/k9s/skins/transparent.yaml"
ln -sf "${HOME}/.dotfiles/k9s/gruvbox-dark.yaml" "${HOME}/Library/Application Support/k9s/skins/gruvbox-dark.yaml"


