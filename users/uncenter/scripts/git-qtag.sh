#!/usr/bin/env bash

if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    echo "git-qtag: not inside git repository"
    exit 1
fi

message=${1:-$(git log -1 --pretty=%B)}
hash=$(git rev-parse HEAD)
git tag -a "$message" "$hash" -m ""
git push origin "$message"
