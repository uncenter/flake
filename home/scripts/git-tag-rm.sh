#!/usr/bin/env bash

if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    echo "git-branch-rm: not inside git repository"
    exit 1
fi

usage() {
    echo "usage: git-tag-rm <tag> [remote]"
}

if [ ! $# -eq 0 ]; then
    if [[ "$1" == "-h" ]]; then
        usage
        exit 0
    fi
else
    usage
    exit 0
fi

tag="$1"
remote="${2:-origin}"
echo -n "You are attempting to delete tag '$tag'. Are you sure? (y/N) "
read -r response
if [ "$response" != "y" ]; then
    exit 1
fi

git tag -d "$tag" &> /dev/null && echo "Deleted local tag '$tag'." || echo "Tried '$tag'; does not exist locally." 
git push "$remote" ":refs/tags/$tag" &> /dev/null && echo "Deleted '$remote/$tag'."
