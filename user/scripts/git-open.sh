#!/usr/bin/env bash

if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    echo "git-open not inside git repository"
    exit 1
fi

repo_url=$(git config --get remote.origin.url)

if [ -z "$repo_url" ]; then
  echo "git-open: unable to determine the remote repository URL"
  exit 1
fi

case "$(uname -s)" in
  Linux*)  xdg-open "$repo_url" ;;
  Darwin*) open "$repo_url" ;;
  *)       echo "git-open: unsupported operating system" ;;
esac

