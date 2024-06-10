#!/usr/bin/bash
#
# ======================================
# Tate's bash profile
# ======================================

umask 022 # macOS default

# Terminal settings (for remote host only)
stty erase ^?

### Environment variables
export PAGER=less
export VISUAL=vim
export EDITOR=vim

# PATH
MACOS_PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
DOTFILE_PATH="$HOME/.bin"
export PATH="$MACOS_PATH:$DOTFILE_PATH"

# Detect Intel vs Apple Silicon MacOS
if [[ $(uname -m) == 'arm64' ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  eval "$(/usr/local/bin/brew shellenv)"
fi

### Loaders
load_if_exists() {
  [ -e "$1" ] && source "$1"
}

command_exists() {
  [ -x "$(command -v "$1")" ]
}

# https://osxdaily.com/2007/01/18/airport-the-little-known-command-line-wireless-utility/
link-airport() {
  sudo ln -s /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport /"$HOMEBREW_PREFIX"/bin/airport
}

wifi-signal() {
  command_exists airport || link-airport
  airport -s | sort -k 3
}

load_if_exists ~/.bashrc
load_if_exists ~/.bin/tmuxinator.bash
# need to run this first: "$HOMEBREW_PREFIX"/opt/fzf/install
load_if_exists ~/.fzf.bash

# https://docs.brew.sh/Shell-Completion
if command_exists brew; then
  load_if_exists "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh"

  for COMPLETION in "$HOMEBREW_PREFIX/etc/bash_completion.d/"*; do
    load_if_exists "$COMPLETION"
  done
fi

# start tmux by default
if command_exists tmux && [ -z "$TMUX" ]; then
  tmux attach -t main || tmux new -s main
fi

### Aliases

alias -- -="cd .."
alias less='less -R'
alias ls='ls -aFh1'
alias mv='mv -i'
alias r='. ~/.bash_profile'
alias h=history
alias rg='rg --smart-case --hidden --glob "!.git/*"'
alias dark='set-colorscheme TateDark'
alias light='set-colorscheme TateLight'
alias be='bundle exec'
alias tree="tree -a -I 'node_modules|.git|dist|.DS_Store'"
alias g='git'

export FZF_DEFAULT_COMMAND="rg --files"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

### BETTER DIRECTORY NAVIGATION

shopt -s autocd 2>/dev/null   # Prepend cd to directory names automatically
shopt -s dirspell 2>/dev/null # Correct spelling errors during tab-completion
shopt -s cdspell 2>/dev/null  # Correct spelling errors in arguments supplied to cd

### History
export HISTSIZE=50
export HISTTIMEFORMAT='%Y-%m-%d %H:%M.%S | '
export HISTCONTROL=ignoredups:erasedups # no duplicate entries
shopt -s histappend                     # append to history, don't overwrite it
export PROMPT_COMMAND="history -a"      # write to history after every command

### Functions

function j() {
  cd $(find ~/code -maxdepth 1 | fzf)
}

dotenv() {
  set -a
  load_if_exists "$1"
  set +a
}

# wip https://github.com/sharkdp/bat/pull/940
batdiff() {
  git diff --name-only --diff-filter=d | xargs bat --diff
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
echo Using bash version "$BASH_VERSION"
echo

load_if_exists ~/.bash_profile.local
