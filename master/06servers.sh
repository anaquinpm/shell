#!/bin/bash
# $1 es un arch que nos da las IPs de servers para hacer ping

if [ ! -f "$1" ]; then
  echo "La entrada de $0 debe ser un archivo"
  exit 1
fi
echo -e "\nLos siguientes servers estan activos el $(date +%x)" > server.out

while read server
do
  ping -c1 "$server" && echo "Servers up: $server" >> server.out
done < $1
cat server.out
