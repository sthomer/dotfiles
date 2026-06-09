# ZSH Configuration

HISTFILE=~/.zsh_history
HISTSIZE=999999999
SAVEHIST=$HISTSIZE
setopt extendedglob nomatch notify
setopt NO_BEEP
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
alias tree="tree -aCI '.git'"

# Activations

eval "$(starship init zsh)"

eval "$(mise activate zsh)"
