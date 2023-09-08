# Prevent terminal from closing and user from logging out when pressing
# 'Control-D', up to N times. Default N = 10.
# This is useful when exiting a shell through a remote connection (such as ssh)
set -o ignoreeof

# Prevent file overwrite on stdout redirection
# Use `>|` to force redirection to an existing file
set -o noclobber

# asdf
source "$(brew --prefix asdf)/libexec/asdf.sh"
