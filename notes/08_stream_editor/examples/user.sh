#!/bin/bash
# Verificamos la existencia de un usuario
read -p "Ingrese el nombre de usuario a verificar: "
if (grep "$REPLY" /etc/passwd > /dev/null) ; then
  echo "The user $REPLY exists"
  exit 1
fi
