#!/bin/bash
for (( v1=1; v1 <= 3; v1++ ))
do
  echo "Primer loop $v1"
  for (( v2 = 1; v2 < 3; v2++ ))
  do
	echo " Segundo loop $v2"
  done
done >> text.txt 		# redirigimos la salida a un archivo
cat text.txt			# muestro el archivo
