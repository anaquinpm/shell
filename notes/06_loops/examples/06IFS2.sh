#!/bin/bash
file="text.txt"
IFS=$'\n'		# Modificamos el IFS para que sea el salto de página
for var in $(cat $file)
do
  echo " $var"
done
