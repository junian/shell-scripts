#!/usr/bin/env bash

function git-switch-branch-orphan() {
  if [[ -z "$1" ]]; then
    echo "Error: Branch name parameter is required" >&2
    return 1
  fi
  git switch --orphan "$1"
  touch README.md
  git add .
  git commit -m "Created to a new branch '$1'"
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  git-switch-branch-orphan "$1"
fi
