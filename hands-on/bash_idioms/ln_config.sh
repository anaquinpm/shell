#!/bin/bash

# Check path
# [[ -d ./temp ]] || { mkdir pathTemp ; exit ; }
[[ -d ./temp ]] || { echo "Creando el directorio temp" ; exit ; }
