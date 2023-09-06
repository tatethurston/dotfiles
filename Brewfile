# vim: syntax=ruby filetype=ruby

def installed?(app)
  system "brew list --cask | grep #{app} > /dev/null"
end

brew 'awscli'
brew 'bash'
brew 'bash-completion@2'
brew 'bats-core'
brew 'coreutils'
brew 'fd'
brew 'fzf'
brew 'git'
brew 'reattach-to-user-namespace' # connect tmux to the OS X clipboard service
brew 'rename'
brew 'rg'
brew 'shellcheck'
brew 'shfmt'
brew 'sqlite'
brew 'tmux'
brew 'tree'
brew 'vim'
brew 'wifi-password'

cask 'docker' unless installed?('docker')
