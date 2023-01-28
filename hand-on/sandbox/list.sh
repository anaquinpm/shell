#!/usr/bin/env bash

Usage_Exit() {
    echo "$0 [color|last|len|long]"
    exit
}

Ls-Length () {
    ls -1 "$@" | while read fn; do
    printf '%3d %s\n' ${#fn} ${fn}
    done | sort -n
}

(( $# < 1 )) && Usage_Exit
sub=$1
shift

case $sub in
    color) # Colorized ls
        ls -N --color=tty -T 0 "$@"
        ;;
    last | latest) # Latest files
        ls -lrt | tail "-n${1:-5}"
        ;;
    len*) # Files with name lengths
        Ls-Length "$@"
        ;;
    long) # File with longest name
        Ls-Length "$@" | tail -1
        ;;
    *) # Default
        echo "unknown command: $sub"
        Usage_Exit
        ;;
esac
