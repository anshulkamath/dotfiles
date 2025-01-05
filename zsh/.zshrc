if [[ -f /opt/homebrew/bin/brew ]]; then
	eval "$(/opt/homebrew/bin/brew shellenv)"
fi

export PATH="$PATH:$HOME/.config/bin"
export PATH="$PATH:$HOME/.rd/bin"

source ~/.config/zsh/.zsh_aliases
source ~/.config/zsh/.zshopts
source ~/.config/zsh/.zsh_packages

test -f ~/.config/zsh/envs.work && . $_ 2> /dev/null

if which fzf 2> /dev/null; then
	eval "$(fzf --zsh)"
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
