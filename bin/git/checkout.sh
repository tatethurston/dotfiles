#!/usr/bin/env bash

set -eou pipefail

git_checkout() {
  # use fzf to search git branches
  if [[ "$#" != 0 ]]; then
    git checkout "$@"
    return
  fi

  git branch | fzf | xargs git checkout
}

git_checkout "$@"
