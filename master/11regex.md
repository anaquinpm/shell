# Expresiones regulares
Son strings que el `motor regex` interpreta para hacer coincidir cierto texto. Es como un buscador avanzado.

El motor que usa por ejemplo lenguajes como Java, Perl y Python son propios. Linux tools usa AWK y sed.

- Type of regex engine in Linux:
  - Basic Regular Expression (BRE) engine
  - Extended Regular Expression (ERE) engine

La mayoria de binarios en linux entienden ambas, pero por ej: grep necesita el parametro -E para entender ERE que equivalente a usar `egrep`.
- !Nota: regex es "case sensitive".

### Anchor characters
- Tenemos dos:
  - Caret (^): verifica que el comienzo de la linea corresponda con un texto especificado.
  - Signo de dolar ($): verifica que el final de la linea corresponda con un texto especificado.

```bash
$ echo "Bienvenidos a shell scripting" | awk '/^Bienvenidos/{print $0}'
$ echo "Bienvenidos a shell scripting" | sed -n '/^Bienvenidos/p'
```

Estos caracteres se pueden usar en conjunto para buscar algun texto. Por ejemplo para buscar lineas en blanco.
```bash
$ awk '!/^$/{print $0}' agenda		# !: caracter de negación para no mostrar la línea.
```

### El caracter punto
Indica cualquier caracter excepto el salto de line (\n).
```bash
$ awk '/.sh/{print $0}' text.txt
$ sed -n '/.sh/p' text.txt
```
El patron que busca es cualquier linea que contenga sh, pero está debe tener un caracter adelante. Es por eso que no muestra la tercer linea.

### The character class
Este permite colocar un conjunto de caracteres para hacer coincidir, para ello usamos los [] ("character class").
```bash
$ awk '/[hwW]el/{print $0} text.txt
$ sed -n '/[hwW]el/p' text.txt
$ awk '/[^c]ome/{print $0} text.txt		# ^ niega los caracteres
```

### Rango de caracteres
Se especifica un rango de caracteres  entre parentecis: [a-b], [1-9] o combinando [a-zA-Z].

### Special character classes
Estos se pueden usar cuando tenemos un ERE.

| Clase       | Descripción                    |
| ----------- | ------------------------------ |
| [[:alpha:]] | cualquier caracter alfabetico. |
| [[:upp:]]   | A-Z                            |
| [[:lower:]] | a-z                            |
| [[:alnum:]] | 0-9, a-z, A-Z                  |
| [[:blank:]  | space, tab, CR                 |
| [[;digit:]  | 0-9                            |
| [[:print:]  | caracter imprimible            |
| [[:punct:]] | caracteres de puntuación       |

### El asterisco
El asterisco es usado para "matchear" la existencia de un caracter o un "character class", **cero o más veces**.

```bash
$ echo "colours" |awk '/colou*rs/{print $0}	# aquí puede coincidir con color o colours
```
Util para buscar variaciones de palabras.

## Definiendo patrones ERE
Los ERE engine entienden los siguiente patrones también:
 - Question marks
 - Plus signs
 - Curly braces
 - Pipe characters
 - Expression grouping

`AWK` soporta patrones ERE, mientras que `sed` necesita usar la opción `-r`.

### Question mark
? Busca la existencia del caracter o character class precedente, **cero o una ocurrencia**.
```bash
$ echo "tot" | awk '/to?t/{print $0}'		# "toot" no funcionaria ; "tt" si funcionaria
$ echo "toot" | sed -r -n '/to?t/p'
$ echo "tt" | awk '/t[oa]?t/{print $0}
```

### Plus sign
+ "Matchea" la existencia del caracter o character class precedente, **una o más ocurrencias**. Debe existir al menos una vez.

### Curly braces
{} Define el numero de existencia del caracter precedente o character class

### Pipe character
Le indica eal regex engine que haga coincidir cualquier estring que le pasemos.
> $ echo "Bienvenidos a shell scripting" | awk '/shell|scripting/{print $0}'

 - Tener en cuenta que no hay espacios entre las palabras y los pipes.

### Expression grouping
Se pueden agrupar caracteres o palabras para que se tomen literalmente encerrandolas con paréntesis.

> $ echo "Hola Mundo del scripting" | awk '/(Mundo del)/{print $0}'
