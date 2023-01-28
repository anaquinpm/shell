#!/bin/bash
# Muestra los archivos abiertos por bash de los usuarios
for user in $(who | cut -f1 -d" ")
do
  lsof -u "$user" -a -c bash
done
