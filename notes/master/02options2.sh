#!/bin/bash
while [ -n "$1" ]
do
case "$1" in
  -a) echo "-a opción usada" ;;
  -b) echo "-b opción usada" ;;
  -c) echo "-c opción usada" ;;
  --) shift 
  break ;;
  *) echo "opción $1 no es una opción" ;;
esac
shift   #mueve las opciones un paso a la izquierda
done
# La iteraciones sobre los parametros termina aquí
# Empieza la iteración sobre los parametros
num=1
for param in $@
do
echo "#$num: $param"
num=$(($num+1))
done