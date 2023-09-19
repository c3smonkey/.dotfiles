# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Helsana
source ~/.helsana_variables

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
)

# OH-MY-ZSH
source ~/.oh-my-zsh/oh-my-zsh.sh

# SDKMAN
source "$HOME/.sdkman/bin/sdkman-init.sh"

# Starship
eval "$(starship init zsh)"

# TheFuck
eval $(thefuck --alias)

# Zoxide
eval "$(zoxide init zsh)"


# DOTFILES
source ~/.variables
source ~/.dotfiles/.aliasrc

# ssh agent 
if [ -z "$SSH_AUTH_SOCK" ]; then
   eval "$(ssh-agent -s)"
   ssh-add ~/.ssh/marzelwidmer
fi

# Ruby
if [ -d "/opt/homebrew/opt/ruby/bin" ]; then
  export PATH=/opt/homebrew/opt/ruby/bin:$PATH
  export PATH=`gem environment gemdir`/bin:$PATH
fi
