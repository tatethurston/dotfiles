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
export NVM_DIR=~/.nvm
export BREW_PREFIX=$(brew --prefix)

# PATH
NODE_PATH=~/.node/bin
RBENV_PATH=~/.rbenv/bin
DIFF_HIGHLIGHT=/usr/local/share/git-core/contrib/diff-highlight
export PATH="$NODE_PATH:$RBENV_PATH:$DIFF_HIGHLIGHT:$PATH"

### Loaders

# load .bashrc
[ -e ~/.bashrc ] && source ~/.bashrc

# load bash_profile extenstions
[ -e ~/.bash_profile.local ] && source ~/.bash_profile.local

# load rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# load nvm
[ -s $BREW_PREFIX/nvm.sh ] && source $BREW_PREFIX/nvm.sh

# load bash completion
[ -f $BREW_PREFIX/etc/bash_completion ] && source $BREW_PREFIX/etc/bash_completion

# tmuxinator
[ -e ~/.bin/tmuxinator.bash ] && source ~/.bin/tmuxinator.bash


### Aliases

alias ls='ls -GFh'
alias mv='mv -i'
alias r='. ~/.bash_profile'
alias del='fc -s ls=rm'
alias h=history
alias npm-source='PATH=$(npm bin):$PATH'
alias ag='ag --pager "less -R"'
alias ctags='ctags $(git ls-files)'
alias bp='~/.bash_profile'
alias dc='docker-compose'

### BETTER DIRECTORY NAVIGATION

# Prepend cd to directory names automatically
shopt -s autocd 2> /dev/null
# Correct spelling errors during tab-completion
shopt -s dirspell 2> /dev/null
# Correct spelling errors in arguments supplied to cd
shopt -s cdspell 2> /dev/null

### Functions

# combine mkdir and cd
mkcd () {
  mkdir "$1"
  cd "$1"
}

# make new git project
# `mkgit repo-name`
mkgit() {
  USER=$(git config user.name)
  echo "# $1" > README.md
  git init
  git add README.md
  git commit -m "add README"
  curl -u $USER https://api.github.com/user/repos -d \{\"name\":\"$1\"\}
  git remote add origin https://github.com/$USER/$1.git
  git push origin master
}      

### Prompt

# Set color variables
GREEN="\[\e[0;32m\]"
LIGHT_RED="\[\e[1;31m\]"
END_COLOR="\[\e[m\]" # This resets the color to default so the user input isn't colored

# Display welcome message
echo "Today is `date`."
echo
echo "Current users: `users`"
echo
echo "System uptime:"; uptime
echo
echo "Using bash version $BASH_VERSION"
echo

# show a '*' if there are unstaged changes and a '+' if there are staged (but uncommitted) changes
GIT_PS1_SHOWDIRTYSTATE=true
# Shell prompt with git branch info from '__git_ps1'
export PS1="${GREEN}\w ${LIGHT_RED}\$(__git_ps1) ${GREEN}\$ ${END_COLOR}"
