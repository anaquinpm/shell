# Stream Editor

Vimos como usar el comando `Sed` (Stream editor) en codigos anteriores. Este permite manipular data/archivos de gran volumen sin consumir muchos recursos.

Con `sed` automatizamos la manipulación de archivos, pudiendo ganar tiempo.

## Usando "grep"

Con el comando `grep` (Global regular expression print) podemos buscar dentro de texto linea a linea un patrón e mostrarlo por el STDOUT.

```bash
ifconfig -a | grep -i "RX packets"    # -i:case insensitive
grep "$USER" /etc/passwd
```

```bash
#!/bin/bash
# Verificamos la existencia de un usuario
read -p "Ingrese el nombre de usuario a verificar: "
if (grep "$REPLY" /etc/passwd > /dev/null) ; then
  echo "The user $REPLY exists"
  exit 1
fi
```

[EJ: Existencia del usuario](master/ch08/user.sh)

Recordar que el if está usando "()" porque no tiene que relizar un [] (test) sobrel grep. Grep retorna 0 cuando hay coincidencia, 1 para lo contrario y 2 para erres de sintaxis en expresiones. Se puede cambiar el sentido de 0,1 con la opción -v.

Redireccionamos a /dev/null para no ver información innecesariamente en la pantalla.

```bash
# Contamos los CPUs de la computadora
grep -c name /proc/cpuinfo      # -c: cuenta las apariciones de <patron>
```

```bash
CPU_CORES=$(grep -c name /proc/cpuinfo)
if (( CPU_CORES < 4 )) ; then
  echo "La cantidad mínima para correr este programa son 4 cores"
  exit 1
fi
```

Con esto podremos crear un script para verificar la cantidad mínima de cores para correr un script especifico.

## Entendiendo `sed`

`sed` es un comando que lo podemos encontrar en la mayoría de los sistemas Linux.

```bash
sed -n 'p' /etc/passwd          # -n: muestra solo las lineas de ocurrencia del patrón
sed -n '1,3 p' /etc/passwd      # 1,3: indica que solo muestre de la linea 1 a la 3
sed -n '/^root/ p' /etc/passwd  # Podemos especificar el rango con un patrón regex
```

La p en realidad es un flag del comando s para sustitución.
> $ sed  's/pattern/replacement/flags'

- Flags
  - p: Imprime el contenido original
  - g: Global replacement for all ocurrences
  - w: Filename: envía los resultados a un archivo

> $ sed -n ' /^user/ s/bash/sh/p ' /etc/passwd

En el comando buscamos la linea que comience con el usuario "user"  sustituimos (s) la palabra "bash" en la linea que aparece (p) por la "sh".

No se edito el archivo, solo se esta mostrando el remplazo en pantalla.

En el ejemplo anterior, si quisieramos remplazar el /bin/bash por /usr/bin/sh, deberiamos escapar cada "/" de la siguiente forma: "s/\/bin\/bash/\/usr\/bin\/sh" lo que no resulta legible.

El comando de sustitución toma como `delimitador` **el primer caracter** que se usa, por lo que podemos reescribir el comando de la siguiente manera.

> $ sed -n ' /^user/ s@/bin/bash@/usr/bin/sh@pg '

Ahora podemos leer más facilmente la sustitución. El parametro 'g' indica que debe remplazar todas las ocurrencias, si no estuviera solo remplazaría la primera ocurrencia del string en cada linea.

Podemos indicar que lineas queremos procesar:

```bash
sed '3s/old_text/new_text/' archivo     # Solo linea 3
sed '3,5s/old_text/new_text/' archivo   # Linea 3 a 5
sed '3,$s/old_text/new_text/' archivo   # Linea 3 en adelante
```

### Editar archivo con sed

Con la opción `-i` (in-place) vamos a realizar los cambios directamente sobre el archivo que indiquemos en el comando.

```bash
sed -i ' /^user/ s@/bin/bash@/bin/sh@ ' $HOME/passwd
sed -i.bak ' /^user/ s@/bin/bash@/bin/sh@ ' $HOME/passwd # -i.bak crea el archivo con extensión .bak antes de procesarlo.
```

### Delete and Insert text

```bash
sed -i '4,$d' archivo               # borra de la linea 4 hasta el final
sed '2i\texto a insertar' archivo   # Agrega el texto "antes" de la linea indicada
sed '2a\texto a insertar' archivo   # agrega el texto "despues" de la linea indicada
```

### Comando "change"

El comando change (c) cambia toda la línea.
> $ sed '2c\modificando la segunda linea' archivo

### Comando "transformar"

Este comando se usa para remplazar cualquier letra o número con otro. Trabaja como el comando 'tr'.

> $ sed 'y/abc/ABC' archivo   # Se aplica a todo el archivo y no puede ser limitada.

## Mezclando comandos

Podemos utilizar varios comandos sed a la ves, colocando la opción `-e`, separando por ';' los comandos.

> $ sed -e 's/Primero/first/;s/Segundo/second/' archivo
