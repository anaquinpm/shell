#!/usr/bin/env bash

FILE="./test.txt"
[ -f "$FILE" -a -r "$FILE" ] && cat "$FILE"

NAME=${1-"Anonymous"}
echo "Hello $NAME"
exit 0
