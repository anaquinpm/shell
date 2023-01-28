# The Unix shell to wrangler log data

Unix tiene 3 "streams":

    - Input stream -> stdin -> mapeado al keyboard
    - Output stream -> stdout -> generalmente hace print en la terminal o consumido por otra app
    - stderr -> hace print en la terminal, como stdout

## Tail

Por default tail/head filtra 10 lineas. "-n" indicamos lineas a mostrar

> tail -n 5 <myFile>  

## NL

Lee el numero de lineas separados por lo que indica la opción "-s ="

> nl -s = <myFile>

"-b a" cuenta lineas vacias también, por default no lo hace
! Ver también: -v (starting number), -i, nl/rn/rz(numbering format)

## WC

Cuenta lineas/palabras/caracteres

> wc <myFile>

## CAT

Main functions in text files: display their content, create new files, and combine copies.

```bash
cat > file.txt  # Escribimos texto y overwrite/create a file.txt -> <ctrl+D> para volver a la terminal
cat >> file.txt # Agrega caracteres al archivo anterior -> <CTRL+D> para volver la terminal
cat file1 file2 > file3     # Combinación de los archivos file1 y file2
```

## Grep + regex

> grep ['pattern'] [file_to_search]

-v invierte el patron, para mostrar lineas que no tienen el patrón
-n numera las lineas de matcheo / -c cuenta los matech /-m<max_lines> limita el n° de lineas a mostrar
ver: -i/-w/-H

# Stream Editor (sed)

Este opera sobre el stdin o archivos

> sed [options] commands [file-to-edit]

Podemos usarlo para crear templates y cambiar valores para cada entorno.

```bash
# Por defecto siempre muestra todas las lineas del stream.
sed -n 's/NASA/National Aerospace Agency/p' NASA-software-API.txt   # -n y "p" -> imprime solo lineas con macheo
# Con un tercer argumento en el patron indicamos un archivo de salida
sed -n 's/NASA/National Aerospace Agency/w NASA-replaced.txt' NASA-software-API.txt
```

## Piping

Los stream se pueden combinar de tal manera de lograr filtrar o mostrar la información que se necesita.

```bash
wc -l  *.txt | sort -n
wc -l  *.txt | sort -n | head -n 1
nl -s = NASA-software-API.txt | head -n 5 | sort -r
grep -m10 'NASA' NASA-logs-1995.txt | sort -r | sed -n s'/NASA/National Aerospace Agency/p'
find data -name '*.txt' | grep -v net  # buscar archivos txt en el folder "data" y descarte los que tengan log en el nombre
```
