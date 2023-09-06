#!/usr/bin/bash
#
# ======================================
# Tate's bash profile
# ======================================

umask 022 # macOS default

# Terminal settings (for remote host only)
#stty erase ^H
stty erase ^?

### Environment variables
export PAGER=less
export VISUAL=vim
export EDITOR=vim

export PGUSER=postgres
export PGHOST=localhost

eval "$(/opt/homebrew/bin/brew shellenv)"

# PATH
DIFF_HIGHLIGHT="$HOMEBREW_REPOSITORY"/share/git-core/contrib/diff-highlight
GNU_COREUTILS_PATH="$HOMEBREW_REPOSITORY"/opt/coreutils/libexec/gnubin
GO_PATH=~/go/bin
OPENVPN_PATH="$HOMEBREW_REPOSITORY"/sbin
RBENV_PATH=~/.rbenv/bin
YARN_PATH="$HOMEBREW_REPOSITORY"/Cellar/node/8.0.0_1/bin
MACOS_PATH="/usr/bin:/bin:/usr/sbin:/sbin"
DOTFILE_PATH=~/dotfiles/bin
export PATH="$DIFF_HIGHLIGHT:$GNU_COREUTILS_PATH:$GO_PATH:$OPENVPN_PATH:$RBENV_PATH:$YARN_PATH:$HOMEBREW_REPOSITORY:$HOMEBREW_REPOSITORY/bin:$DOTFILE_PATH:$MACOS_PATH"

# MANPATH
MAC_OS_MANPATH="/usr/share/man:/$HOMEBREW_REPOSITORY/share/man"
export MANPATH="$GNU_COREUTILS_PATH:$MAC_OS_MANPATH"

### Loaders
load_if_exists() {
  [ -e "$1" ] && source "$1"
}

command_exists() {
  [ -x "$(command -v "$1")" ]
}

# https://osxdaily.com/2007/01/18/airport-the-little-known-command-line-wireless-utility/
link-airport() {
  sudo ln -s /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport /"$HOMEBREW_REPOSITORY"/bin/airport
}

wifi-signal() {
  command_exists airport || link-airport
  airport -s | sort -k 3
}

load_if_exists ~/.bashrc
load_if_exists ~/.bin/tmuxinator.bash
# need to run this first: "$HOMEBREW_REPOSITORY"/opt/fzf/install
load_if_exists ~/.fzf.bash
load_if_exists "$(brew --prefix asdf)/libexec/asdf.sh"

# https://docs.brew.sh/Shell-Completion
if command_exists brew; then
  load_if_exists "$HOMEBREW_REPOSITORY/etc/profile.d/bash_completion.sh"

  for COMPLETION in "$HOMEBREW_REPOSITORY/etc/bash_completion.d/"*; do
    if [[ "$COMPLETION" =~ "ctest" ]]; then
      continue
    fi
    load_if_exists "$COMPLETION"
  done
fi

# load rbenv
if command_exists rbenv; then eval "$(rbenv init -)"; fi

### Aliases

alias -- -="cd .."
alias less='less -R'
alias ls='ls -aFh1'
alias mv='mv -i'
alias r='. ~/.bash_profile'
alias h=history
#alias npm-source='PATH=$(npm bin):$PATH'
#alias bp='~/.bash_profile'
alias rg='rg --smart-case --hidden --glob "!.git/*"'
alias dark='set-colorscheme TateDark'
alias light='set-colorscheme TateLight'
alias be='bundle exec'
alias tree="tree -a -I 'node_modules|.git|dist|.DS_Store'"
alias g='git'

export FZF_DEFAULT_COMMAND="rg --files"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# _fzf_compgen_dir() {
#   fd --type d --hidden --follow --exclude ".git" . "$1"
# }

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
echo System uptime: "$(uptime)"
echo
echo Using bash version "$BASH_VERSION"
echo

load_if_exists ~/.bash_profile.local
