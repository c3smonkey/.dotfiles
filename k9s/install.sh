#!/usr/bin/env zsh

set -e

DOTFILES_LOCATION=${HOME}/.dotfiles

PATH_TO_K9S="${HOME}/Library/Application Support/k9s"

mv ${PATH_TO_K9S}/config.yaml ${PATH_TO_K9S}/config.yaml.bk

ln -sf "${DOTFILES_LOCATION}/k9s/config.yaml" "${PATH_TO_K9S}/config.yaml"
ln -sf "${DOTFILES_LOCATION}/k9s/monokai.yaml" "${PATH_TO_K9S}/skins/monokai.yaml"
ln -sf "${DOTFILES_LOCATION}/k9s/dracula.yaml" "${PATH_TO_K9S}/skins/dracula.yaml"
ln -sf "${DOTFILES_LOCATION}/k9s/prod.yaml" "${PATH_TO_K9S}/skins/prod.yaml"
ln -sf "${DOTFILES_LOCATION}/k9s/test.yaml" "${PATH_TO_K9S}/skins/test.yaml"
ln -sf "${DOTFILES_LOCATION}/k9s/test.yaml" "${PATH_TO_K9S}/skins/transparent.yaml"
ln -sf "${DOTFILES_LOCATION}/k9s/test.yaml" "${PATH_TO_K9S}/skins/gruvbox-dark.yaml"


