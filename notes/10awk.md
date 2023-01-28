# Fundamentos de AWK

[Link a la guía de usuario](https://www.gnu.org/software/gawk/manual/gawk.html)

Es un lenguajen de programación en si y sería como el hermano mayor de sed.

Este lo encontraremos tanto en distribuciones UNIX como LINUX.

El `comando awk` da el acceso al lenguaje de programación AWK el cual permite procesar data en "text streams".

```bash
# Podemos averiguar que implementación de AWK tenemos en el sistema
# siguiendo a donde apunta el link simbolico del comando.
ls -l /usr/bin/awk
ls -l /etc/alternatives/awk         # usr/bin/mawk -> Versión diseñada para speed y performance
awk 'BEGIN { print "Hola Mundo!" }' # Hola mundo en awk
awk ' { print } ' /etc/passwd       # Muestra todo el contenido del archivo
awk ' { print $1 } ' /etc/passwd    # Muestra el primer campo de lineas del archivo
```

En el último comando, la variable $1 es la que indica que campo va a mostrar.

- Variable
  - $0: Muestra la linea completa
  - $n: Muestra el campo 'n' de la linea

Los delimitadores de campos por defecto son los espacios, tabs o newlines.

```bash
$ awk -F: '{ print $1 }' /etc/passwd    # -F: indica el delimitador

# Mostramos lo mismo que el comando anterior pero agregamos al final (END) la variable
# NR que cuenta la cantidad de lineas procesadas.
awk ' BEGIN { FS=":" } { print NR,$1 } END { print "Total: ",NR } ' /etc/passwd
awk ' NR < 6 ' /etc/passwd          # Muestra de la linea 1 al 6
awk ' NR==8,NR==12 ' /etc/passwd    # Muestra de la linea 8 a 12
```

Podemos usar expresiones regulares (regex) entre barras, para machear en las lineas.
> $ awk ' /bash$/ n' /etc/passwd

## Variables

| Variable         | Descripción                                                     |
| ---------------- | --------------------------------------------------------------- |
| FIELDWIDTHS      | Especifica el ancho del campo                                   |
| RS               | Especifica el "record separator"                                |
| FS               | Especiifica el "field separtor"                                 |
| OFS              | Especifica el "output separator", que es un espacio por defecto |
| ORS              | Especifica el "output separator"                                |
| FILENAME         | Indica el nombre del archivo procesado                          |
| NF               | Indica la linea que se está procesando                          |
| NR               | Indica la cantidad  de campos procesador en la linea            |
| FNR              | Indica la cantidad de líneas procesadas en cada archivo/entrada |
| IGNORECASE       | Ignora mayusculas y minusculas                                  |

> $ awk ' BEGIN { FS="\n" ; RS="" ; OFS=" - " } { print $1, $3 }' agenda

En el comando anterior definimos que vamos a considerar cada '\n' como divisor de campo y las lineas en blanco van a ser nuestra separador de registros. Con OFS definimos el separador de campos de '-' e imprimimos el primer y ultimo campo.

### Variables definidas por el usuario

En awk podemos definir también nuestras propias variables.

```bash
awk 'BEGIN { myvar="hola mundo" ; print myvar }'
awk ' BEGIN { var=1 ; var2=2 ; var=var1+var2 ; print var } '
awk ' BEGIN { str1="Hola, " ; str2=" Mundo" ; str=str1 str2 ; print str} '
```

## Condicionales

### IF

```bash
awk ' {if ($1 > 50) {print $1} else { x=$1*10 ; print "Multiplicando: " x} } ' numeros
awk ' {if ($1 > 50) print $1 ; else { x=$1*10 ; print "Multiplicando: " x} } ' numeros  # podemos sacar algunos {} y colocar ;
```

### While

- !!Recordar: -f nos permite llamar a un archivo con el código a ejecutar.

Podemos correr el siguiente código para iterar sobre los campos de un archivo.

```awk
{
total = 0
i = 1
while (i < 4)
{
total += $i
i++
}
mean = total / 3
print "Mean value:", mean
```

> $ awk -f while numb-while

- '[while](ch10/while.awk)': archivo que contiene el archivo con código awk
- '[numb-while](ch10/numb-while)': archivo que contiene una lista de numeros

### FOR

En el siguiente ejemplo procesamos 'num-while' pero con un loop For. Vamos a notar que dan la misma salida.

```awk
{
total = 0
for (var = 1; var < 4; var++)
{
  total += $var
}
mean = total / 3
print "Mean value:",mean
}
```

> $ awk -f for.awk numb-while

[Código de for.awk](ch10/for.awk)

## Formateando la salida

```bash
$ awk ' BEGIN { FS=":" } { print $1, $3, $7 } ' /etc/passwd
# Acondicionamos el ancho de los campos para que sean consistentes y más legibles
$ awk ' BEGIN { FS=":" ; printf "%20s %4s %17s\n","Name", "UID", "Shell" } { printf "%20s %4d %17s\n", $1, $3, $7 } ' /etc/passwd
```

`printf` incluye el formato de los campos en las dobles comillas, especificando la cantidad de caracteres que tomara cada tipo de dato y también debemos agregar el salto de página, ya que esta no lo genera automaticamente.

### Filtrando usuarios

Podemos filtrar usuarios segun su UID.
> $ awk -F":" '$3 == 1000'    # busca el usuario de UID 1000

## Build-in functions

- Matemáticas
  - sin(x)
  - cos(x)
  - sqrt(x)
  - exp(x)
  - log(x)
  - rand()
- Strings
  - toupper(x)
- Time
- Bit manipulation
- Miscellaneous functions

> $ awk 'BEGIN { x = "Hola Mundo"; print toupper(x) } '
