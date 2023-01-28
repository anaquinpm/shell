#!/bin/bash
# Author: @anaquinpm
usage="Forma de uso: ./03search.sh <FILE> <STRING> <OPERATION>"

if [ ! $# -eq 3  ]; then
  echo $usage
  exit 2
fi
[! -f $1 ] && exit 3	# forma de comprobar sin un "if statement"

case $3 in
  [cC])
	mesg="Contando las coincidencias en $1 de $2"
	opt="-c"
  ;;
  [pP])
	mesg="Muestro las coincidendias de $2 en $1"
	opt=""
  ;;
  [dD])
	mesg="Mostrando todo las lineas, excepto aquellas en que no coincide $2 en $1"
	opt="-v"
  ;;
  *) echo "No pueodo procesar $1 $2 $3"
  ;;
esac
echo $mesg
grep $opt $2 $1
