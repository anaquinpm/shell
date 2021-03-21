#!/bin/bash
# Elif statement: anidando condicionales con backup de $HOME
# Author: @anaquinpm
# Date: 05-02-2020
# use: ./03elif.sh

read -p "Elegir tipo de compresion de archivo: H, M o L" compression
# Aseguramos que este en mayúscula la repuesta
file_compression=${compression^^}
read -p "En que directorio quieres comprimir $HOME?" dir_name
if [ -z $dir_name ]; then
  echo "Debe ingresar un nombre de directorio."
  exit 0
fi
test -d $HOME/$dir_name || mkdir -m 700 $HOME/$dir_name
backup_dir=$HOME/$dir_name

tar_l="-cvf $backup_dir/b.tar --exclude $backup_dir $HOME"
tar_m="-czvf $backup_dir/b.tar.gz --exclude $backup_dir $HOME"
tar_h="-cjvf $backup_dir/b.tar.bzip2 --exclude $backup_dir $HOME"

if [ $file_compression = "L"  ]; then
  tar_opt=$tar_l
elif [ $file_compression = "M"  ]; then
  tar_opt=$tar_m
else
  tar_opt=$tar_h
fi
tar $tar_opt
exit 0
