#!/bin/bash
while [ -n "$1" ]
do
case "$1" in
-a) echo "-a opción usada" ;;
-b) echo "-b opción usada" ;;
-c) echo "-c opción usada" ;;
*) echo "opción $1 no es una opción" ;;
esac
shift   #mueve las opciones un paso a la izquierda
done