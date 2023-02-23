# Prevent terminal from closing and user from logging out when pressing
# 'Control-D', up to N times. Default N = 10.
set -o ignoreeof
# Prevent file overwrite on stdout redirection
# Use `>|` to force redirection to an existing file
set -o noclobber

. "/opt/homebrew/opt/asdf/libexec/asdf.sh"
