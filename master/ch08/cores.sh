#!/bin/bash
# Verificar la cantidad de CPUs en un sistema

CPU_CORES=$(grep -c name /proc/cpuinfo)
if (( CPU_CORES < 10 )) ; then
  echo "La cantidad mínima para correr este programa son 10 cores"
  exit 1
fi
