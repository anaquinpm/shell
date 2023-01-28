#!/bin/bash
# Esperamos el nombre de un archivo para
# eliminar comentario y lineas en blanco

is_file() {
  if [ ! -f "$1" ]; then
	echo "$1 no es un archivo"
	exit 2
  fi
}

clean_file() {
  is_file "$1"
  BEFORE=$(wc -l "$1")
  echo "El archivo $1 comienza con $BEFORE"
  sed -i.bak '/^\s*#/d;/^$/d' "$1"		# -i crea una copia .bak, ';' separa dos busquedas
  AFTER=$(wc -l "$1")
  echo "El archivo $1 ahora tiene $AFTER"
}

read -p "Ingrese el nombre del archivo a limpiar: "
clean_file "$REPLY"
exit 1
