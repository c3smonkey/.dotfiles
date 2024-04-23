#!/bin/zsh

sourceIfExists() {
  if [ -e $1 ]; then
    source $1;
  fi
}

## Load Plugins from ohmyzsh fork https://github.com/c3smonkey/ohmyzsh who are provide in .dotfiles
source "$HOME/.dotfiles/zsh/zsh-navigation-tools/zsh-navigation-tools.plugin.zsh"
source "$HOME/.dotfiles/zsh/zsh-interactive-cd/zsh-interactive-cd.plugin.zsh"
source "$HOME/.dotfiles/zsh/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh"
source "$HOME/.dotfiles/zsh/k8s/kubectx.plugin.zsh"
source "$HOME/.dotfiles/zsh/k8s/kube-ps1.plugin.zsh"
source "$HOME/.dotfiles/zsh/git/git.plugin.zsh"
source "$HOME/.dotfiles/zsh/git/git-commit.plugin.zsh"
# source "$HOME/.dotfiles/zsh/lf-icons.zsh"
source "$HOME/.dotfiles/.config/lf/lf-icons.zsh"

# Must be aver other Plugins, to enable auto expand alias for all plugins
source "$HOME/.dotfiles/zsh/zsh-alias-plugin.zsh"
