# Iterating with Loops
## For
Esta realiza sobre una lista, la cual puede ser dinámica o no.
Estructura de **for** en seudocódigo

```bash
for var in lista ; do
  statement1
  statement2
done
```
```bash
for f in 01* in ; do	# Escribirlo directamente en la terminal
  stat "$f"
done
```
[Ej: Mostrar archivos abiertos por los usarios en bash](06hello7.sh)

La lista sobre la que itera, algún elemento puede contener espacios. Para lograr que mantengan sus espacios y leer bien el elemento deberemos utilizar doble comillas ("elemento con espacios").

### IFS variables (space, newline, tab)
Es la forma que por defecto bash toma los `separadores` para ingresar sus campos de variables. Para cambiar este comportamiento que vemos en [06IFS.sh](06IFS.sh) vamos modificar el IPS.
```bash
#!/bin/bash
file="text.txt"
IFS=$'\n'		# Estamos modificando el IPS
for var in $(cat $file)
do
echo " $var"
done
```
[Cambiando IFS a '\n'](06IFS2.sh)

`Bash` por defecto no interpreta los caracteres con escape(\n, \r, \t). Por lo que en este ejemplo para lograr la interpretación de salto de linea usamos el `signo dolar ($)` antes de hacer que funcione adecuadamente.

Si queremos usar un caracter normal para IFS no es necesario `$`.

### Comprobando Directorios y archivos
[Ejemplo](06fileDirectories.sh)

### C-Style for loops
[C-Style code](06cstyle.sh)

### Controlando el loop
Para ello vamos a usar:
- `Continue`: pasa a la siguiente iteración, desde el comienzo del loop
- `Break`: Sale del loop.

## While and until loops
Esta itera en razon de que una `condición` que sea **true** (sigue) o **false** (para).
```bash
whil [] ; do
  statement1
  statement2
done
```
```bash
COUNT=10
while (( COUNT >=0 )) ; do
  echo -e "$COUNT \c"
  (( COUNT-- ))
done ; echo
```

### Leyendo archivos como entrada
Podemos usar `read` para leer linea a linea un archivo. Indicaremos  el "input file" al final del loop.

En la demostración usaremos un archivo que contiene IPs de un servidores.
```bash
while read server ; do
  ping -c $server && servers_up="$servers_up $server"
 done < servers.txt
echo "Los siguientes servers stan UP: $servers_up"
```
[Ejemplo más completo](06servers.sh)


