if [[ -f /opt/homebrew/bin/brew ]]; then
	eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# go options
export GOPATH="$CONF/go"
export GOPRIVATE="github.com/fluidstackio*"

# home configurations
export ASDF_DATA_DIR="$XDG_CONFIG_HOME/asdf"
export BUN_INSTALL="$HOME/.bun"

# path expansions
export PATH="$GOPATH/bin:$PATH"
export PATH="$HOME/.config/bin:$PATH"
export PATH="$HOME/.rd/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
export PATH="$BUN_INSTALL/bin:$PATH"

# Bug with colima: https://github.com/k3d-io/k3d/issues/1449
export K3D_FIX_DNS=0

source ~/.config/zsh/.zsh_aliases
source ~/.config/zsh/.zshopts
source ~/.config/zsh/.zsh_packages
[[ -f /opt/homebrew/Caskroom/gcloud-cli/latest/google-cloud-sdk/completion.zsh.inc ]] && \
	source /opt/homebrew/Caskroom/gcloud-cli/latest/google-cloud-sdk/completion.zsh.inc

test -f ~/.config/zsh/envs.work && . $_ > /dev/null 2>&1

if which fzf > /dev/null 2>&1; then
	eval "$(fzf --zsh)" > /dev/null
fi

if which direnv > /dev/null 2>&1; then
    eval "$(direnv hook zsh)" > /dev/null
fi

if which gt > /dev/null 2>&1; then
    eval "$(gt completion zsh)" > /dev/null
fi

if which moon > /dev/null 2>&1; then
    eval "$(moon completions --shell zsh)" > /dev/null
fi

if which jj > /dev/null 2>&1; then
    source <(jj util completion zsh)
fi

# export NVM_DIR="$HOME/.nvm"
# [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
# [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# proto
export PROTO_HOME="$XDG_DATA_HOME/proto";
export PATH="$PROTO_HOME/shims:$PROTO_HOME/bin:$PATH";

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
