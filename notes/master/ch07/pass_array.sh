#!/bin/bash
myfunc(){
  #array=$@		# Pasamos todos los elementos del array
  array=$1		# Pasamos el primer elemento del array
  echo "El array en la función es: ${array[*]}"
}

my_array=(3 6 9)
echo "El array original es: ${my_array[*]}"
myfunc ${my_array[*]}
