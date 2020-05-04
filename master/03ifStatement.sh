#!/bin/bash
# If statement: utilizamos test de strings y enteros para ver su funcionamiento
# con diferentes variables.
# Author: @anaquinpm
# Date: 05-02-2020
# use: ./scriptname.sh <name>

if [ $# -lt 1 ]; then
  echo "Usar: $0 <nombre>"
  exit 1
else
  name=$1
  if [ $USER = $name ] && [ -n $HOME ] ; then
	echo "Somos tocayos: $USER"
	echo "Tu directorio home es: $HOME"
  fi
fi
echo "Disfruta el momento $name"
exit 0
