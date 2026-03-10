# ZSH Configuration

HISTFILE=~/.zsh_history
HISTSIZE=999999999
SAVEHIST=$HISTSIZE
setopt extendedglob nomatch notify
unsetopt autocd beep
zstyle :compinstall filename '/home/sthomer/.zshrc'
autoload -Uz compinit
compinit

# User Configuration

export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8
export EDITOR='nvim'
export ARCHFLAGS="-arch $(uname -m)"
export HOMEBREW_PREFIX=/opt/homebrew
export VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
export VI_MODE_SET_CURSOR=true
export KEYTIMEOUT=0
export EDITOR=nvim

# Aliases

alias grep="grep --color"
alias ls="ls --color"
alias ll="ls -lah"

# Activations

eval "$(starship init zsh)"

# eval "$(mise activate zsh)"

# Path

# The next line updates PATH for the Google Cloud SDK.
# if [ -f '/Users/sthomer/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/sthomer/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
# if [ -f '/Users/sthomer/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/sthomer/google-cloud-sdk/completion.zsh.inc'; fi

# export PATH="$PATH:/Users/sthomer/.lmstudio/bin"
# export PATH="$PATH:/Users/stomer/.cargo/bin"
# export PATH="$PATH:/opt/nvim-macos-arm64/bin"
