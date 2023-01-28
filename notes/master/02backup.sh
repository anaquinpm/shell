#!/bin/bash
# Author:
# Web:
# Script que realiza backup del $HOME directory del usario.
# El archivo creado se encuentre en el mismo $HOME directory del usuario.
# Last Edited: 05-01-20

read -p "Que tipos de archivos necesita respaldar (.md) " file_suffix
read -p "En que directorio desea guardar el respaldo. " dir_name

# La siguiente línea crea  el directorio si es que no existe.
test -d $HOME/$dir_name || mkdir -m 700 $HOME/$dir_name

find $HOME -path $HOME/$dir_name -prune -o -name "*$file_suffix" -exec cp {} $HOME/$dir_name/ \;
exit 0
