# ======================================
# Tate's bash profile
# ======================================

# make files not be read/write/execute by anyone but the owner
umask 077

# Terminal settings (for remote host only)
#stty erase ^H
stty erase ^?

### Environment variables
export HISTSIZE=50
export PAGER=less
export VISUAL=vim
export EDITOR=vim
export BREW_PREFIX=$(brew --prefix)

# PATH
AWS_CLI_PATH=~/Library/Python/3.6/bin
DIFF_HIGHLIGHT=/usr/local/share/git-core/contrib/diff-highlight
GNU_COREUTILS_PATH=/usr/local/opt/coreutils/libexec/gnubin
GO_PATH=~/go/bin
OPENVPN_PATH=/usr/local/sbin
RBENV_PATH=~/.rbenv/bin
YARN_PATH=/usr/local/Cellar/node/8.0.0_1/bin

export PATH="$AWS_CLI_PATH:$DIFF_HIGHLIGHT:$GNU_COREUTILS_PATH:$GO_PATH:$OPENVPN_PATH:$RBENV_PATH:$YARN_PATH:$PATH"

# MANPATH
export MANPATH="$GNU_COREUTILS_PATH:$MANPATH"

### Loaders
load_if_exists() {
  [ -e "$1" ] && source "$1"
}

load_if_exists ~/.bashrc
load_if_exists ~/.bash_profile.local
load_if_exists ~/.bin/tmuxinator.bash
load_if_exists $BREW_PREFIX/opt/nvm/nvm.sh
load_if_exists $BREW_PREFIX/etc/bash_completion
load_if_exists ~/.fzf.bash

# load rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi


### Aliases

alias ls='ls -Fh'
alias mv='mv -i'
alias r='. ~/.bash_profile'
alias del='fc -s ls=rm'
alias h=history
#alias npm-source='PATH=$(npm bin):$PATH'
alias ag='ag --pager "less -R"'
alias ctags='ctags $(git ls-files)'
#alias bp='~/.bash_profile'
alias dc='docker-compose'

### BETTER DIRECTORY NAVIGATION

# Prepend cd to directory names automatically
shopt -s autocd 2> /dev/null
# Correct spelling errors during tab-completion
shopt -s dirspell 2> /dev/null
# Correct spelling errors in arguments supplied to cd
shopt -s cdspell 2> /dev/null

### Functions
# Allow docker containers to connect to localhost on macOS
macos_docker() {
  sudo ifconfig lo0 alias 10.200.10.1/24
  echo "Created lo0 alias 10.200.10.1/24"
}

### Prompt

# Set color variables
# GREEN="\[\e[0;32m\]"
# LIGHT_RED="\[\e[1;31m\]"
# END="\[\e[m\]" # This resets the color / font

# show a '*' if there are unstaged changes and a '+' if there are staged (but uncommitted) changes
GIT_PS1_SHOWDIRTYSTATE=true
# Shell prompt with git branch info from '__git_ps1'
export PS1="λ \W\$(__git_ps1): "

# Display welcome message
echo "Today is `date`."
echo
echo "Current users: `users`"
echo
echo "System uptime:"; uptime
echo
echo "Using bash version $BASH_VERSION"
echo
