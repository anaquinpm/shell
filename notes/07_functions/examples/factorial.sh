#!/bin/bash
calc_factorial () {
  if [ $1 -eq 1 ] ; then
    echo 1
  else
    local var=$(( $1 - 1 ))
    local res=$(calc_factorial $var)
    echo $(( $res * $1 ))
  fi
}
read -p "Ingresa un número para factorizar:" val
factorial=$(calc_factorial $val)
echo "El factorial del numero $val es igual a : $factorial"
