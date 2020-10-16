# vim: syntax=ruby filetype=ruby

def installed?(app)
  system "brew list --cask | grep #{app} > /dev/null"
end

tap "heroku/brew"

brew 'awscli'
brew 'bash'
brew 'bash-completion@2'
brew 'bat'
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
brew 'shfmt'
brew 'tmux'
brew 'tree'
brew 'vim'
brew 'wifi-password'
brew 'yarn'

# cask 'amethyst' unless installed?('amethyst')
cask 'docker' unless installed?('docker')
# cask 'maccy' unless installed?('maccy')
cask 'ngrok' unless installed?('ngrok')
