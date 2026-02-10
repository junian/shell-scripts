#!/usr/bin/env bash

function git-checkout-branch-orphan() {
  if [[ -z "$1" ]]; then
    echo "Error: Branch name parameter is required" >&2
    return 1
  fi
  git checkout --orphan "$1"
  git reset --hard
  touch README.md
  git add .
  git commit -m "Created a new branch '$1'"
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  git-checkout-branch-orphan "$1"
fi
