#!/usr/bin/env bash

CPU_CORES=`grep -c name /proc/cpuinfo`
if (( $CPU_CORES<17 )) ; then
    echo "La cantidad de procesadores: $CPU_CORES"
    echo "La cantidad mínima de procesadores es 17"
    exit 1
fi
echo "Sigue mi programa por aquí"
