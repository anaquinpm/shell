#!/bin/bash
# example: $ ./script name1 name2
echo "Estas usando el siguiente script $(basename $0)"
for n in $*
do
  echo "Hola $n"
done
exit 0
