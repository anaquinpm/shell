#!/bin/bash
read -p "Hello $(basename $0)! Como te llamas: " name
echo "Hello $name"
read -sn1 -p "Presione una tecla para salir"   # -n<number> indica la cantidad de caracteres a leer|-s no lo muestra
exit 0