#!/bin/zsh
#
# # PLUGINS
# plugins=(
# 	git
# 	zsh-autosuggestions
# 	zsh-syntax-highlighting
# 	zsh-navigation-tools
# 	oc
# 	kubectl
# 	brew
# 	colored-man-pages
# 	httpie
# 	history
# 	gradle
# 	helm
#   kube-ps1
#   web-search
# )
#

# SDKMAN
source "$HOME/.sdkman/bin/sdkman-init.sh"

# thefuck
eval $(thefuck --alias)

# Zoxide
eval "$(zoxide init zsh)"

## DOTFILES
source ~/.dotfiles/.aliasrc
source ~/.dotfiles/.variablesrc
source ~/.variables
# Helsana
if [ -f ~/.helsanarc ]; then
    source ~/.helsanarc
fi

