# Usando Parametros

```Bash
#!/bin/bash
# Comentario del programa
# Author: Pablo Anaquin
# Date: 26-05-2020
# use: ./script
echo -n "Hello $(basename $0)! Como te llamas: "
read
echo "Hello $REPLY"
exit 0
```

`$REPLY` es la variable por defecto a la que devuelve el read, ya que no determinamos una variable para la misma.

Los comentarios en el archivo nos permiten determinar lo que hace el script y porque. Es una guía para quien quiera editar el archivo.

```bash
#!/bin/bash
read -p "Hello $(basename $0)! Como te llamas: " name   #read -p <prompt> <variable name>
echo "Hello $name"
read -sn1 -p "Presione una tecla para salir"   # -n<number> indica la cantidad de caracteres a leer|-s no lo muestra
exit 0
```

[code](master/02hello4.sh)

## Pasando opciones

Las opciones que pasamos con nuestro script pueden tener la siguiente forma:

> $ script1.sh -a -b 20 -c

Esta forma de pasar opciones implica tener que parsear los datos para saber cual son opciones y cuales son argumentos de las mismas. Para ello vamos a usar sentencias condicionales, para mantenerlo simple.

```bash
#!/bin/bash
while [ -n "$1" ]
do
  case "$1" in
    -a) echo "-a opción usada" ;;
    -b) echo "-b opción usada" ;;
    -c) echo "-c opción usada" ;;
    *) echo "opción $1 no es una opción" ;;
  esac
  shift   #mueve las opciones un paso a la izquierda
done
```

[code](master/02options.sh)

### Pasando opciones con parametros

Para pasar parametros y luego sus respectivos valor podemos usar "--"

> $ script.sh -a -b -c -- p1 p2 p3

```bash
#!/bin/bash
while [ -n "$1" ]       # '-n' -> el string es mayor a cero
do
case "$1" in
  -a) echo "-a opción usada" ;;
  -b) echo "-b opción usada" ;;
  -c) echo "-c opción usada" ;;
  --) shift
  break ;;
  *) echo "opción $1 no es una opción" ;;
esac
shift   #mueve las opciones un paso a la izquierda
done
# La iteraciones sobre los parametros termina aquí
# Empieza la iteración sobre los parametros
num=1
for param in $@
do
echo "#$num: $param"
num=$(($num+1))
done
```

[code](master/02options2.sh)

### Leyendo valores de las opciones

```bash
#!/bin/bash
while [ -n "$1" ]
do
  case "$1" in
    -a) echo "-a option passed" ;;
    -b) param="$2"
      echo "-b option pased, whit the value $param"
      shift ;;
    -c) echo "-c option passed" ;;
    --) shift
      break ;;
    *) echo "Option $1 not an option" ;;
  esac
  shift
done
num=1
for param in "$@"
do
  echo "#$num: $param"
  num=$(( $num + 1))
done
```

La función `getopt` nos permite optener las opciones de los usuarios, pero solo si son de un caracter.

- [ ] **BUSCAR uso de getopt**
  - [ ] [web](http://www.manpagez.com/man/1/getopt/)
  - [ ] [web2](https://ss64.com/bash/getopts.html)

### Opciones Standards

* -a: Listar todos los items
* -c: contar todos los items
* -d: directorio de salida
* -e: expandir items
* -h: mostrar la página de ayuda

## Referencias

- [ ] [Read](https://ss64.com/bash/read.html)
- [ ] [Read, exec, etc](http://tldp.org/LDP/Bash-Beginners-Guide/html/sect_08_02.html)
