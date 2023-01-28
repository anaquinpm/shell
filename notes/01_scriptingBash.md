# Scripting Bash

## Comando Type

Cuando corremos ls en bash, asumimos que es un comando, pero puede ser que este sea un alias del original.

`Type`: nos indica que el typo de comando que ingresamos, los cuales pueden ser:

- Alias
- Function
- Keyword
- File

```Bash
type -a ls quote pwd # Indica el type del cmd y sus ubicaciones  // -a todas sus ubicaciones
```

Este comando nos ayuda a la hora de colocar un nombre al script que creamos, de tal manera que sea único.

## Ejecutar script

Podemos relizarlo de 2 maneras.

- Ejecutando el comando "bash namescript.sh"
- `Dando permisos de ejecución` y ejecutando directamente el script: "chmod +x namescript.sh" -> "./namescript.sh"

Probamos con el [siguiente archivo](01hello.sh)

```Bash
#!/bin/bash
echo "hello"
exit 0
```

## Exit status

```bash
comando1 || comando2  # OR
comando1 && comando2  # AND
```

Cada comando al ejecutarse devuelve un estado de salida (exit status). Es 0 cuando se ejecuta con exito y toma otro valor para indicar error.

- Caso OR:  comando2 no se va ejecutar si el primero devuelve 0.
- Caso AND: comando2 se ejecuta si el comando1 devuelve 0.

## Scripts con argumentos

Es posible correr el script ingresando argumentos al momento de ejecución

> $ hello1.sh arg1

En este caso el programa no lo utiliza `arg1` y lo ignora.

| arg ID | Descripción                                                                |
| ------ | -------------------------------------------------------------------------- |
| $0     | nombre del script, con path completo. $(basename $0) sin path              |
| $1     | argumento según la posición                                                |
| ${10}  | cuando usa más de 2 digitos para indicar la posición es necesario los "{}" |
| $#     | indica la cantidad de argumentos                                           |
| $*/$@  | refiere a todos los argumentos                                             |

Aclaración para los signos especiales que agrupan los argumentos.
| Expresión | Descripción                                                                   |
| --------- | ----------------------------------------------------------------------------- |
| $*        | c/ palabra es tratada como una palabra separada. No cuida espacios            |
| "$*"      | espacio preservados entre comillas. Todo se trata como un solo parametro      |
| $@        | c/palabra es tratada como una palabra separada. No cuida espacio (igual que $*) |
| "$@"      | lee todo como se supone se planea en la escritura. Espacios preservados       |

Modificamos un poco el código anterior recibir el primer argumento.

```Bash
#!/bin/bash
echo "Hello $1"
exit 0
```

[Code](01hello2.sh)

> $ 01hello2.sh Pablo

 Al cambiar el `$1` por `$*` vamos a poder pasar más de un argumento.

> $ 01hello2.sh Pablo Martin Pepe Jose

## Uso de Comillas

El tipo de comillas que usemos depende de los datos que necesitemos mostrar.
La idea de comillas es la de proteger y preservar los espacios entre palabras y caracteres especiales, tales como un "arg ID".

| Tipo de comillas | Descripción                                                            |
| ---------------- | ---------------------------------------------------------------------- |
| Simples          | bash no interpreta los caracteres especiales                           |
| Dobles           | bash interpreta caracteres especiales, remplazandolos por sus valores. |

En dobles comillas podemos anteponer el simbolo de escape (\\) para que no se interpreten caracteres especiales.

```bash
echo "$USER erns $4"
echo '$USER erns $4'
echo "$USER erns \$4"
```

## Variables

Esto nos permiter guardar valores para utilizarlos en nuestro código a demanda. Las variables pueden contener diferentes tipos de datos.

Según su alcance pueden ser:

- Variables definidas por usuario
- Variables de Entorno

### Variables de usuario

Estas se definen de la siguiente manera: `nombreVariable=valorDeVariable`, sin espacios para no causar un error en el interprete.

```Bash
nombre=Pablo
edad=36
echo "Mi nombre es $nombre \n"
echo "Mi edad es $edad"
```

Cuando es mas de un valor podemos usar un array: `nombreVariable=(valor0 valor1 valor2)`

```Bash
#!/bin/bash
myarray=(Pablo Pepe juan)
echo ${myarray[1]}    # Para imprimir todo el array -> ${myarray[*]}
unset myarray[2]      # unset elimina elementos de una variable
unset myarray
```

### Variables de Entorno

Estas las define el shell al iniciar el sistema. Tienen nombres en mayusculas como algunas antes vistas: `$USER, $PATH, ....`.

> printenv HOME   # muestra la variable de entorno.

#### Alcanse de las varibles

Estas **variables de entorno** pueden ser utilizadas en los escripts y las de **usuario** solo pueden usarse en el proceso (script) que las crea a menos que se la `exporte`, lo cual solo copia la variable, no toca la original.

```Bash
# 01script1.sh
#!/bin/bash
name='Pablo'
export name    # crea una copia de la variable
./01script2.sh
echo $name     # muestra la variable local name
```

```Bash
# 01script2.sh
#!/bin/bash
echo $name          # Muestra la copia de la variable del escript1
name="Otro nombre"  # Sobrescribe la variable
echo $name          # Muestra la variable local name, que al terminar el script desaparece
```

### Command Sustitution

Las `variables` pueden **guardar** tambien la **salida de comandos**, de tal manera que podemos hacer sustitución de comandos de las siguientes 2 formas:

- Usando el caracter backtick -> `
- Usando el caracter dolar -> $()

```bash
#!/bin/bash
current_dir=`pwd`   # current_dir=$(pwd)
echo $current_dir
```

### Debugging

Podemos usar por linea de comando las opciones de "bash -xv" como indicamos en [Code](../commands.md)
