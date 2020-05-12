# Creando bloques de código con funciones
Las funciones nos permiten crear bloque de código encapsulado respecto del resto del script.

Facilita la mejora del código, ya que se trata un funcionalidad a la ves y no estar tocando todo el script.

Las Fc existen en la memoria como "named elements", pudiendo ser creadas en el  entorno de shell o en un script.

En la linea de comando primero se comprueba los aliases y dpues las funciones. 
```bash
function-name() {		# pseudocodigo
  <code to execute>
}
```
La "keyword" `function` ya no se usa por temas de especificaiones de portabilidad  (POSIX).

```bash
show_system(){
  echo "El uptime del systema es:"
  uptime;
  echo;
  echo "Detalles del CPU: ";
  lscpu;
  echo;
  echo "Lista de Usarios de OS";
  who;
}
```

## [Pasing arrays](ch07/pass_array.sh)

## [Retornando valores de una función](ch07/return_values.sh)
Usando `return` devolvemos un valor entero

Usando `echo` devuelve la opción procesada sin problemas.

## Funciones recursivas
Son funciones que se llaman a sí mismas desde adentro de su código. Un ejemplo práctico es el cálculo de un número factorial.

[Ejemplo de como calcular un número factorial](ch07/factorial.sh)