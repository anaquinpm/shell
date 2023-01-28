# Conditions attached

## Test

```bash
test -z $1      # -z: verifica si tiene 0 bytes
[ -z $1 ]       # [ ]: es igual que usar la sentencia **test**
[ -n $SSH_TTY ] # -n: verifica si el strint tiene un valor
```

[ejemplo](03hello4.sh)

| string | Descripción                                                    |
| ------ | -------------------------------------------------------------- |
| !      | distinto                                                       |
| -z     | si tiene 0 bytes                                               |
| -n     | el valor del string es mayor a 0                               |
| =      | string1 es igual al string2                                    |
| !=     | string1 es distinto al string2                                 |
| \<     | string1 es menor al string2 desde la perspectiva ASCII (orden) |
| \>     | string1 es mayor al string2                                    |

Entre los strings y los signos de comprobación tiene que haber un spacio, porque sino vamos a estar asignando una variable a la otra.

| Integers | Descripción     |
| -------- | --------------- |
| -gt      | mayor que (>)   |
| -ge      | mayor o igual   |
| -le      | menor o igual   |
| -lt      | menor que (<)   |
| -eq      | igual que       |
| -ne      | no es igual que |

| Files | Descripción                                    |
| ----- | ---------------------------------------------- |
| -h    | tiene un link                                  |
| -e    | existe en alguna forma                         |
| -d    | existe el directorio                           |
| -x    | si es ejecutable                               |
| -f    | es un archivo regular                          |
| -r    | si es legible                                  |
| -p    | si es un "named pipe"                          |
| -nt   | file1 es más nuevo que file2                   |
| -ot   | file1 es más antiguo que file2                 |
| -O    | si el usuario logueado es el dueño del archivo |
| -c    | si el archivo es un "character divice"         |

[Test-types](https://wiki.bash-hackers.org/commands/classictest)

## If statements

Extructura básica en un "if" y elif

```bash
if condition; then
  statement 1
  statement 2
elif
  statement 3
else
  statement 4
fi
```

[Ejemplo1](03ifStatement.sh)

[Ejemplo2](03elif.sh)

## Case Statement

Este resuelve una expresión para luego seleccionar a partir de un **entero** o **string** el código a ejecutar.
Extructura de **Case**

```bash
case expression in
  case1)
    statement1
    statement2
  ;;
  case2)
    statement1
    statement2
  ;;
  *)
    Statement1
  ;;
esac
```

[Ejemplo](03grade.sh)

### Usando lo visto

```bash
usage="Forma de uso: ./03search.sh <FILE> <STRING> <OPERATION>"

if [ ! $# -eq 3  ]; then
  echo $usage
  exit 2
fi
[! -f $1 ] && exit 3  # forma de comprobar sin un "if statement"

case $3 in
  [cC])
    mesg="Contando las coincidencias en $1 de $2"
    opt="-c"
    ;;
  [pP])
    mesg="Muestro las coincidendias de $2 en $1"
    opt=""
    ;;
  [dD])
    mesg="Mostrando todo las lineas, excepto aquellas en que no coincide $2 en $1"
    opt="-v"
    ;;
  *) echo "No pueodo procesar $1 $2 $3"
    ;;
esac
echo $mesg
grep $opt $2 $1
```

[Code](03search.sh)
