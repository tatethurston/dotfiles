# Tate's dotfiles 

### Getting started
Run `./bin/setup`

### Scripts
All scripts are located in `bin`

`setup` will download all necessary dependencies and symlink them to the home
directory.

`link` symlinks the dotfiles to your home directory.

Any conflicting dotfiles will be moved to ~/dotfiles/backup. These
can be restored by running `./bin/unlink`.

### What's included
##### System
+ bash_profile and bashrc
+ vimrc - osx clipboard enabled
+ inputrc - vim keybindings for readline (such as terminal prompt)
+ homebrew
+ lastest bash and bash completions
+ git
+ ag - grep replacement

##### Ruby
+ rbenv to manage ruby versions
+ latest version of ruby
+ bundler

##### Python
+ python3
+ virtualenv

##### Node
+ nvm to manage node versions
+ latest node
