#!/usr/bin/env bash

changedFiles="$(git diff-tree -r --name-only --no-commit-id HEAD@{1} HEAD)"

checkForChangedFiles() {
    echo "$changedFiles" | grep --quiet "$1" && eval "$2"
}

packageJsonHasChanged() {
  echo -e "\033[33m the package.json file has changed. It is recommended that you re-execute the 'npm install' command. \033[0m"
}

checkForChangedFiles package.json packageJsonHasChanged
exit 0;