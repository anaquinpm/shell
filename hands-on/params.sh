#!/bin/bash

echo "My name is `basename $0` - I was colled $0"
echo "Me llamaron con $# parametros"
if [ "$#" -ne "2" ]; then
  echo "Usage: `basename $0` first second"
  echo "You provided $# arguments, but 2 are required."
else
  echo "My first parameter is: $1"
  echo "My second parameter is: $2"
fi
