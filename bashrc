# ===========================================
# Bourne Shell
# ============================================
# 1. Shell options
set -o ignoreeof
# Prevent file overwrite on stdout redirection
# Use `>|` to force redirection to an existing file
set -o noclobber
