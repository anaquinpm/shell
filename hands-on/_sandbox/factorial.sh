#!/usr/bin/env bash

calc_factorial (){
    if [ $1 -eq 1 ]; then
        echo 1
    else
        local num=$(( $1 - 1 ))
        local res=$(calc_factorial $num)
        echo $(( $res * $1 ))
    fi
}

read -p "Ingrese un número para factorizar: " val
factorial=$(calc_factorial $val)
echo "El factorial del número $val es: $factorial"
