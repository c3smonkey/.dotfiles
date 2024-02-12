# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Node
export PATH="/opt/homebrew/opt/node@16/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

# PLUGINS
plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
	zsh-navigation-tools
	oc
	kubectl
	brew
	minikube
	spring
	colored-man-pages
	httpie
	history
	gradle
	helm
  kube-ps1
  heroku
)

# OH-MY-ZSH
source ~/.oh-my-zsh/oh-my-zsh.sh

# SDKMAN
source "$HOME/.sdkman/bin/sdkman-init.sh"

# TheFuck
eval $(thefuck --alias)

# Zoxide
eval "$(zoxide init zsh)"

# DOTFILES
source ~/.variables
source ~/.dotfiles/.aliasrc
source ~/.dotfiles/.variablesrc
source ~/.helsana_variables

# Load Angular CLI autocompletion.
source <(ng completion script)

# Starship
#eval "$(starship init zsh)"

# p10k
source ~/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

