#!/bin/bash
# Verifica si nuestro simtema cumple con la cantidad de cores especificado.
# Ejemplo: ./cores2.sh <n_cores>

count_cores () {
  REQ_CORES=$1
  [ -z $1 ] && REQ_CORES=2		# <n_cores> si no hay requerimiento su valor es 2 por default 
  CPU_CORES=$(grep -c name /proc/cpuinfo)
  if ((CPU_CORES < REQ_CORES)) ; then
	echo "La cantidad mínima de $REQ_CORES cores es requerida."
	echo "Tu sistema solo tiene $CPU_CORES cores.""
	exit 1
  fi
}
count_cores "$1"
