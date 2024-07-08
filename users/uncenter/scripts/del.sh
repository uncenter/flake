#!/usr/bin/env bash

usage() {
    cat <<EOF
del - delete files by moving them to trash
usage: del <files>...
EOF
}

if [ $# -eq 0 ] || [[ "$1" == "-h" ]] || [[ "$1" == "--help" ]]; then
    usage
    exit 0
fi

files=()
for file in "$@"; do
    if [ -e "$file" ]; then
        files+=("$(realpath "$file")")
    else
        echo "del: file '$file' not found"
    fi
done

if [ ${#files[@]} -eq 0 ]; then
    echo "del: no valid files to delete"
    exit 1
fi

formatted=$(printf "\",POSIX file \"%s" "${files[@]}")\"
osascript -ss -e"tell app \"Finder\" to delete {${formatted:2}}" 1>/dev/null
