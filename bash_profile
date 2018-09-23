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

export PATH="$DIFF_HIGHLIGHT:$GNU_COREUTILS_PATH:$GO_PATH:$OPENVPN_PATH:$RBENV_PATH:$YARN_PATH:$PATH"

# MANPATH
export MANPATH="$GNU_COREUTILS_PATH:$MANPATH"

# nvm
mkdir -p ~/.nvm
export NVM_DIR=~/.nvm

### Loaders
load_if_exists() {
  [ -e "$1" ] && source "$1"
}

load_if_exists ~/.bashrc
load_if_exists ~/.bash_profile.local
load_if_exists ~/.bin/tmuxinator.bash
load_if_exists /usr/local/opt/nvm/nvm.sh
load_if_exists /usr/local/etc/bash_completion
# need to run this first: /usr/local/opt/fzf/install
load_if_exists ~/.fzf.bash

# load rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi


### Aliases

alias ls='ls -aFh'
alias mv='mv -i'
alias r='. ~/.bash_profile'
alias del='fc -s ls=rm'
alias h=history
#alias npm-source='PATH=$(npm bin):$PATH'
#alias bp='~/.bash_profile'
alias dc='docker-compose'

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
# Allow docker containers to connect to localhost on macOS
macos_docker() {
  sudo ifconfig lo0 alias 10.200.10.1/24
  echo "Created lo0 alias 10.200.10.1/24"
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
