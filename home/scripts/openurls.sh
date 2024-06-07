#!/usr/bin/env bash

usage() {
    cat <<EOF
openurls - open all urls in a list of urls
usage: openurls <file>
EOF
}

if [ $# -eq 0 ] || [[ "$1" == "-h" ]] || [[ "$1" == "--help" ]]; then
    usage
    exit 0
fi

file=$1


if [ -e "$file" ]; then
    while IFS= read -r line; do
        if [ -n "$line" ]; then
            open "$line"
        fi
    done < "$file"
else
    echo "openurls: file '$file' not found"
fi

