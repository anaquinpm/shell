# Commands

```sh
type -a <command>       # Indica el type del cmd y sus ubicacion
printenv $USER          # Muestra una variable de entorno
pwd                     # Muestra el directorio actual
bash -xv script.sh      # Debugging script x:comandos que se ejecutan, v:verbose
echo -e "caracteres especiales como los \n" # -e: interpreta caracteres especiales | -n no respeta los saltos de página
read -p "Hello $(basename $0)! Como te llamas: " name   #read -p <prompt> <variable name>
stat file               # Muestra detalles del archivo
who                     # Muestra quien está conectado al OS
lsof -u "$USER" -a -c bash          # Lista archivos abiertos
declare -F                          # Muestra solo las definiciones de las funciones
sed -i.bak '/^/s*#/d;/^$/d' <filename>  # Comando que remueve lineas en blanco y comentarios de un archivo
ifconfig -a | grep -i "RX packets"      # -i:case insensitive
until ssh user@ip ; do sleep 3 ; done   # Intentar la conxión cada 3 segundos
```
