# vim: syntax=ruby filetype=ruby

def installed?(cmd)
  system "command -v '#{cmd}' > /dev/null"
end

brew 'awscli'
brew 'bash'
brew 'bash-completion'
brew 'cask'
brew 'cmake' # build youcompleteme
brew 'coreutils'
brew 'fzf'
brew 'git'
brew 'go'
brew 'heroku'
brew 'jq'
brew 'nginx'
brew 'nvm'
brew 'postgres' # installs cli clients
brew 'python'
brew 'rbenv'
brew 'reattach-to-user-namespace' # connect tmux to the OS X clipboard service
brew 'rg'
brew 'shellcheck'
brew 'tmux'
brew 'tree'
brew 'vim'
brew 'yarn'

cask 'docker' unless installed?('docker')
cask 'ngrok' unless installed?('ngrok')

