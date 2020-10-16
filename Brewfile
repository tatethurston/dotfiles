# vim: syntax=ruby filetype=ruby

def installed?(app)
  system "brew cask list | grep #{app} > /dev/null"
end

tap "heroku/brew"

brew 'awscli'
brew 'bash'
brew 'bash-completion@2'
brew 'bats-core'
brew 'cask'
brew 'coreutils'
brew 'fzf'
brew 'git'
brew 'go'
brew 'heroku'
brew 'jq'
brew 'nginx'
brew 'nvm'
brew 'postgres' # installs cli client
brew 'python'
brew 'rbenv'
brew 'reattach-to-user-namespace' # connect tmux to the OS X clipboard service
brew 'rename'
brew 'rg'
brew 'shellcheck'
brew 'tmux'
brew 'tree'
brew 'vim'
brew 'wifi-password'
brew 'yarn'

cask 'docker' unless installed?('docker')
cask 'ngrok' unless installed?('ngrok')

