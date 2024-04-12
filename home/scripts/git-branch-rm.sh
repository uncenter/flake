#!/usr/bin/env bash

if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    echo "git-branch-rm: not inside git repository"
    exit 1
fi

usage() {
    echo "usage: git-branch-rm [branch] [remote]"
}

current_branch() { git branch --show-current; }

if [ ! $# -eq 0 ]; then
    if [[ "$1" == "-h" ]]; then
        usage
        exit 0
    fi
fi

if [ -z "$1" ]; then
  echo "Automatically detected branch '$(current_branch)'." 
  branch="$(current_branch)"
else
  branch="$1"
fi
remote="${2:-origin}"
if [ "$branch" = "main" ] || [ "$branch" = "master" ]; then
    echo "git-branch-rm: cannot delete branch '$branch' (protected primary branch)"
    exit 1
fi
echo "You are attempting to delete branch '$branch'. Enter the branch name again to confirm:"
echo "$branch"
while true; do
    echo -n "===| "
    read -r response
    if [ "$response" = "$branch" ]; then
        break
    fi
done
git checkout master &> /dev/null || git checkout main &> /dev/null || (echo "git-branch-rm: could not switch to main/master branch" && exit 1)
echo "Switched to branch '$(current_branch)'."

git branch -D "$branch" &> /dev/null && echo "Deleted local branch '$branch'." || echo "Tried '$branch'; does not exist locally." 
git push "$remote" --delete "$branch" &> /dev/null && echo "Deleted '$remote/$branch'." || echo "Tried '$remote/$branch'; does not exist remotely."

