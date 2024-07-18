#!/usr/bin/env bash

usage() {
    cat <<EOF
docs - versatile man alias
usage: docs [-p | --preview] [-o | --open] <page>
EOF
}

if [ $# -eq 0 ] || [[ "$1" == "-h" ]] || [[ "$1" == "--help" ]]; then
    usage
    exit 0
fi

check_exists() {
    if ! man -w "$1" &> /dev/null; then
        echo "docs: manual page for '$1' does not exist"
        exit 1
    fi
}
x="$1"
shift

case "$x" in
    -p|--preview)
        for page in "$@"; do
            check_exists "$page"
            echo "Opening page for '$page' in Preview..."
            mandoc -Tpdf "$(man -w "$page")" | open -f -a Preview
        done
        ;;
    -o|--open)
        for page in "$@"; do
            check_exists "$page"
            url="https://ss64.com/osx/$page.html"
            if [ "$(curl -I -o /dev/null -s -w "%{http_code}" "$url")" -eq 404 ]; then
                echo "docs: the page for '$page' returned a 404 status code"
                exit 1
            fi
            echo "Opening page for '$page' in the default browser..."
            case "$(uname -s)" in
				Linux*)  xdg-open "$url" ;;
				Darwin*) open "$url" ;;
				*)       echo "git-open: unsupported operating system" ;;
			esac
        done
        ;;
    *)
        check_exists "$x"
        man "$x"
        for page in "$@"; do
            check_exists "$page"
            man "$page"
        done
        ;;
esac
