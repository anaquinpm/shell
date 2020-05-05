# Sintaxis Alternativas
## Test command
```bash
$ test -f /etc/hosts                    # -f: verifica que exista el archivo
$ test -f /etc/hosts -a -r /etc/hosts   # -a: AND, -o: OR , -r: arch si legible
$ FILE="/etc/hosts"                       # Usamos una variable para reescribir lo anterior y agragamos algo más
$ [ -f "$FILE" -a -r "$FILE" ] && cat "$FILE"
```

## Parametros especiales en el shell
- `$-`: nos indica las opciónes del shell que están configuradas.

## Setting defaults
### Sustición de parametros
```bash
${parametro-default}    ## Pseudocódigo
${parametro:-default}   ## :- es usado cuando el parametro es explicitamente declarado con un valor nulo
```
Este [Ejemplo](05hello.sh)
```bash
#!/bin/bash
name=$1
[ -z $name  ] && name="Anonimo"
echo "Hola $name"
exit 0
```
Queda de la siguiente manera usando la sustición de parametros
```bash
#!/bin/bash
name=${1-"Anonymous"}
echo "Hello $name"
exit 0
```
### Expanción de parametros
Es la lectura del valor de una variable. 

Es recomendable usar Comillas dobles ("") en el uso de variables y más cuando estás contienen espacios.
```bash
FILE="my archivo"
[ -f $FILE ]        # Error
[ -f "$FILE" ]       # Al agregar a las comillas, cancelamos las anteriores 
rm $FILE            # Ejecuta: "rm my archivo" que no es lo deseado por el espacio en el nombre
rm "$FILE"          # resuelve $FILE como un solo parametro para el comando "rm"
```

## Test avanzados usando [[
`[[ condition ]]` nos permite realizar condiciones avanzadas. Esto es compatible con `Bash` y `Zsh`

> $ type [[   # Comprobamos que sea compatible nuestro shell

### Espacios en blanco
`[[` parsea los argumentos antes que Bash de tal manera que podemos resolver el problemas de espacios en parametros en el tema anterior de la siguiente manera y no obtener ningun error.
```bash
echo "Agregando el contenido al archivo" > "my file"
FILE="my file"
[[ -f $FILE ]] && cat "$FILE"
```
### Pattern matching
```bash
$ FILE="05syntax.md"                            # Nombre de archivo con extención .md que exista
$ [[ $FILE = *.md ]] && cp "$FILE" scripts/    # Si existe el archivo lo copia al directorio scripts
```
### Expresiones regulares
El script anterior con expreciones regulares queda de la siguiente manera:
```bash
$ FILE="05syntax.md"
$ [[ $FILE =~ \.md$ ]] && cp "$FILE" scripts/
```

## Operaciones aritmeticas con `((`
En `Bash` podemos usar la notación `(( ))` para realizar operaciones aritméticas.
```bash
$ let a=2+3       # let: orden interna para realizar operaciones aritmeticas
$ a=((2+3))       #(()): remplaza el uso de let
$ COUNT=1
$ (( COUNT++ ))   # manipulacion de parametros "C-Type"
$ echo $COUNT     # 2
$ (( COUNT < 10 )) && echo "Count es menor a uno"   # Podemos usar '<' en ves de '-gt'
```
Para utilizarlo en un script es necesario colocar el signo $ delante de los parentesis.
```bash
#!/bin/bash
NUMB=$(( 25-10 ))
echo $NUMB
```
[Code](05syntax.sh)