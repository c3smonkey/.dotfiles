#!/bin/zsh

# INFO:  Setup other stuff
eval "$(pyenv init -)"
eval "$(thefuck --alias)"
eval "$(zoxide init zsh)"

# Check that the function `starship_zle-keymap-select()` is defined.
# xref: https://github.com/starship/starship/issues/3418
type starship_zle-keymap-select >/dev/null || {
	eval "$(starship init zsh)"
}



# INFO: OhmyZsh Plugins
source "$HOME/.dotfiles/zsh/plugins/functions/functions.zsh"
source "$HOME/.dotfiles/zsh/plugins/web-search/web-search.plugin.zsh"
source "$HOME/.dotfiles/zsh/plugins/zsh-navigation-tools/zsh-navigation-tools.plugin.zsh"
source "$HOME/.dotfiles/zsh/plugins/zsh-interactive-cd/zsh-interactive-cd.plugin.zsh"
source "$HOME/.dotfiles/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh"
source "$HOME/.dotfiles/zsh/plugins/k8s/kubectx.plugin.zsh"
source "$HOME/.dotfiles/zsh/plugins/git/git.plugin.zsh"
source "$HOME/.dotfiles/zsh/plugins/git/git-commit.plugin.zsh"

# INFO: Custom Plugins
source "$HOME/.dotfiles/zsh/plugins/custom/alias.zsh"
source "$HOME/.dotfiles/zsh/plugins/custom/note.zsh"
source "$HOME/.dotfiles/zsh/plugins/custom/take.zsh"
source "$HOME/.dotfiles/zsh/plugins/custom/sourceIfExists.zsh"
source "$HOME/.dotfiles/zsh/plugins/custom/vi-mode.zsh"

source "$HOME/.dotfiles/.config/lf/lf-icons.zsh"


