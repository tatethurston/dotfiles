#!/usr/bin/bash
#
# ======================================
# Tate's bash profile
# ======================================

umask 077 # only read/write/execute by owner

# Terminal settings (for remote host only)
#stty erase ^H
stty erase ^?

### Environment variables
export PAGER=less
export VISUAL=vim
export EDITOR=vim

# PATH
DIFF_HIGHLIGHT=/usr/local/share/git-core/contrib/diff-highlight
GNU_COREUTILS_PATH=/usr/local/opt/coreutils/libexec/gnubin
GO_PATH=~/go/bin
OPENVPN_PATH=/usr/local/sbin
RBENV_PATH=~/.rbenv/bin
YARN_PATH=/usr/local/Cellar/node/8.0.0_1/bin
MACOS_PATH="/usr/bin:/bin:/usr/sbin:/sbin"
DOTFILE_PATH=~/dotfiles/bin
export PATH="$DIFF_HIGHLIGHT:$GNU_COREUTILS_PATH:$GO_PATH:$OPENVPN_PATH:$RBENV_PATH:$YARN_PATH:/usr/local:/usr/local/bin:$DOTFILE_PATH:$MACOS_PATH"

# MANPATH
MAC_OS_MANPATH="/usr/share/man:/usr/local/share/man"
export MANPATH="$GNU_COREUTILS_PATH:$MAC_OS_MANPATH"

# nvm
export NVM_DIR=~/.nvm
export NVM_SH=/usr/local/opt/nvm/nvm.sh

### Loaders
load_if_exists() {
  [ -e "$1" ] && source "$1"
}

command_exists() {
  command -v "$1" > /dev/null
}

load_if_exists ~/.bashrc
load_if_exists ~/.bash_profile.local
load_if_exists ~/.bin/tmuxinator.bash
load_if_exists $NVM_SH
load_if_exists /usr/local/etc/bash_completion
# need to run this first: /usr/local/opt/fzf/install
load_if_exists ~/.fzf.bash

# https://docs.brew.sh/Shell-Completion
if command_exists brew; then
  load_if_exists "$(brew --prefix)"/etc/profile.d/bash_completion.sh
fi

# load rbenv
if command_exists rbenv; then eval "$(rbenv init -)"; fi

# start tmux by default
if command_exists tmux && [ -z "$TMUX" ]; then
  tmux attach -t main || tmux new -s main
fi

### Aliases

alias -- -="cd .."
alias ls='ls -aFh'
alias mv='mv -i'
alias r='. ~/.bash_profile'
alias h=history
#alias npm-source='PATH=$(npm bin):$PATH'
#alias bp='~/.bash_profile'
alias dc='docker-compose'
alias rg='rg --smart-case --hidden --glob "!.git/*" --glob "!vendor"'
alias dark='set-colorscheme TateDark'
alias light='set-colorscheme TateLight'
alias be='bundle exec'
alias tree="tree -a -I 'node_modules|.git'"

export FZF_DEFAULT_COMMAND="rg --files"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

### BETTER DIRECTORY NAVIGATION

shopt -s autocd 2> /dev/null   # Prepend cd to directory names automatically
shopt -s dirspell 2> /dev/null # Correct spelling errors during tab-completion
shopt -s cdspell 2> /dev/null  # Correct spelling errors in arguments supplied to cd

### History
export HISTSIZE=50
export HISTTIMEFORMAT='%Y-%m-%d %H:%M.%S | '
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
shopt -s histappend                      # append to history, don't overwrite it
export PROMPT_COMMAND="history -a"       # write to history after every command


### Functions
macos_docker() {
  # Allow docker containers to connect to localhost on macOS
  sudo ifconfig lo0 alias 10.200.10.1/24
  echo "Created lo0 alias 10.200.10.1/24"
}

dotenv() {
  set -a
  load_if_exists "$1"
  set +a
}

### Prompt

# show a '*' if there are unstaged changes and a '+' if there are staged (but uncommitted) changes
export GIT_PS1_SHOWDIRTYSTATE=true
# Shell prompt with git branch info from '__git_ps1'
export PS1="λ ""\\W""\$(__git_ps1): "

# Display welcome message
echo Today is "$(date)"
echo
echo Current users: "$(users)"
echo
echo System uptime: "$(uptime)"
echo
echo Using bash version "$BASH_VERSION"
echo
