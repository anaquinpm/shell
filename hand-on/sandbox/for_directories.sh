#!/usr/bin/env bash
for path in /home/anakin/*; do
    [ -d "$path" ] && echo "$path es un directorio"
    [ -f "$path" ] && echo "$path es un archivo"
done >> home_list.txt   # redirección del STDOUT a un archio
