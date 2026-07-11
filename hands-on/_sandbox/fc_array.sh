#!/usr/bin/env bash

myfc(){
    todo=$@
    elemento=$1
    echo "el primer elemento del array es $elemento "
    echo "todos los elementos $todo"
}

myarray=(4 5 6)
echo "original array: ${myarray[*]}"
myfc ${myarray[*]}
