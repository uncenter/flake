#!/usr/bin/env bash

if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    echo "git-hide: not inside git repository"
    exit 1
fi

file=".git/info/exclude"

case "$1" in
    ""|-h|--help)
	    cat <<EOF
git-hide - hide/ignore a path in the current repository without .gitignore
usage: git hide [-c | --clear] [-s | --show] <path>
EOF
		;;
    -c|--clear)
        : > "$file"
        ;;
	-s|--show)
        cat "$file"
        ;;
    *)
		[ -n "$(tail -c 1 < file.txt)" ] && echo >> "$file"
		for arg in "$@"; do
			echo "$arg" >> "$file"
		done
        ;;
esac
