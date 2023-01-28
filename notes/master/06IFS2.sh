#!/bin/bash
file="text.txt"
IFS=$'\n'		# Modificamos el IPS para que sea el salto de página
for var in $(cat $file)
do
  echo " $var"
done
