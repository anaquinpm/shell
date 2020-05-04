#!/bin/bash
# Script para evaluar grados
# Usage: grade.sh student grade
# Author: @likegeeks
# Date: 1/1/1971
if [ ! $# -eq 2 ]; then
  echo "Debes ingresar <Estudiante> <grado>"
  exit 2
fi
case ${2^^} in			# Parameter expasion is used to capitalize input
  [A-C]) echo "$1 is a start pupil"
  ;;
  [D]) echo "$1 needs to try a little harder"
  ;;
  [E-F]) echo "$1 could do a lot better next year!"
  ;;
  *) echo "Grade could not be evaluated for $1 $2"
  ;;
esac
