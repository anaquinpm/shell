#!/bin/bash
to_lower () {
  input="$1"
  output=$(echo $input | tr [A-Z] [a-z])
  #return $output
  echo $output
}

while true
do
  read -p "Ingrese c para continuar o q para salir del programa: "
  REPLY=$(to_lower "$REPLY")
  if [ $REPLY = "q" ] ; then
	break
  fi
done
echo "Terminado"
