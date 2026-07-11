#!/bin/bash
# El script busca los directorio y los guarda en una variable. Si un archivo muestra el nombre del archivo.
for fd in *
do
  [ -d "$fd" ] && nameD="$nameD $fd" && continue
  echo "$fd es un archivo"
  # [ -f "$fd" ] || break		# si es un directorio sale del loop.
done
echo $nameD
