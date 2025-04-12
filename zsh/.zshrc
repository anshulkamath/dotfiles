if [[ -f /opt/homebrew/bin/brew ]]; then
	eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# path expansions
export PATH="$HOME/.config/bin:$PATH"
export PATH="$HOME/.rd/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"

source ~/.config/zsh/.zsh_aliases
source ~/.config/zsh/.zshopts
source ~/.config/zsh/.zsh_packages

test -f ~/.config/zsh/envs.work && . $_ 2> /dev/null

if which fzf 2> /dev/null; then
	eval "$(fzf --zsh)"
fi

# The next line updates PATH for Nebius CLI.
if [ -f '/Users/anshulkamath/.nebius/path.zsh.inc' ]; then source '/Users/anshulkamath/.nebius/path.zsh.inc'; fi

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
