#!/bin/bash
for path in /home/anakin/*
do
  if [ -d "$path" ]		# Usamos las comillas para respetar los espacios en los nombres.
  then
	echo "$path es un directorio"
  elif [ -f "$path" ]
  then
	echo "$path es un archivo"
  fi
done
