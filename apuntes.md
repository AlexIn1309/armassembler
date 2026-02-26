# Estos apuntes buscan ayudar a definir algunas de las funciones para ensamblador ARM64

## Funcion adrp ensamblador ARM64

Esta función se utiliza para cargar la dirección de una etiqueta en un registro. La sintaxis es la siguiente:

adrp x0, buffer

Que carga la dirección de la etiqueta "buffer" en el registro x0. Es importante tener en cuenta que adrp solo carga la dirección de la página, por lo que si se necesita acceder a un desplazamiento dentro de esa página, se debe usar una instrucción adicional como add o ldr.

## Funcion add ensamblador ARM64

Esta función se utiliza para sumar un valor a un registro. La sintaxis es la siguiente:

add x0, x0, #offset

Que suma el valor de "offset" al registro x0. Esto es útil para acceder a un desplazamiento dentro de una página después de haber cargado la dirección base con adrp.

## Funcion ldr ensamblador ARM64

Esta función se utiliza para cargar un valor desde la memoria a un registro. La sintaxis es la siguiente:

ldr x1, [x0, #offset]

Que carga el valor almacenado en la dirección calculada por x0 más el desplazamiento "offset" en el registro x1. Esto es útil para acceder a datos específicos dentro de una página después de haber cargado la dirección base con adrp.

## Funcion str ensamblador ARM64

Esta función se utiliza para almacenar un valor desde un registro a la memoria. La sintaxis es la siguiente:

str x1, [x0, #offset]

Que almacena el valor del registro x1 en la dirección calculada por x0 más el desplazamiento "offset". Esto es útil para escribir datos específicos dentro de una página después de haber cargado la dirección base con adrp.

## Funcion mov ensamblador ARM64

mov x0, #value

Que carga el valor inmediato "value" en el registro x0. Esto es útil para cargar constantes o valores específicos en un registro sin necesidad de acceder a la memoria.

## Funcion bl ensamblador ARM64

bl x0

Que realiza una llamada a la función cuyo punto de entrada está almacenado en el registro x0. Esto es útil para ejecutar funciones o procedimientos definidos en otras partes del código.

## Funcion ret ensamblador ARM64

ret

Que indica el final de una función y devuelve el control al llamador. Es importante usar esta instrucción para asegurarse de que el programa se ejecute correctamente y no se produzcan errores de ejecución.

## Funcion b ensamblador ARM64

b label

Que realiza un salto incondicional a la etiqueta "label". Esto es útil para controlar el flujo del programa y ejecutar diferentes secciones de código según las condiciones establecidas.

## Funcion cbz ensamblador ARM64

cbz x0, label

Que realiza un salto condicional a la etiqueta "label" si el valor en el registro x0 es cero. Esto es útil para controlar el flujo del programa basado en condiciones específicas.

## Funcion cbnz ensamblador ARM64

cbnz x0, label

Que realiza un salto condicional a la etiqueta "label" si el valor en el registro x0 no es cero. Esto es útil para controlar el flujo del programa basado en condiciones específicas.

## Funcion cmp ensamblador ARM64

cmp x0, #value

Que compara el valor en el registro x0 con el valor inmediato "value". Esto es útil para establecer condiciones para saltos condicionales como cbz o cbnz.

## Funcion b.eq ensamblador ARM64

b.eq label

Que realiza un salto condicional a la etiqueta "label" si la comparación previa con cmp resultó en igualdad. Esto es útil para controlar el flujo del programa basado en condiciones específicas.

## Funcion b.ne ensamblador ARM64

b.ne label

Que realiza un salto condicional a la etiqueta "label" si la comparación previa con cmp resultó en desigualdad. Esto es útil para controlar el flujo del programa basado en condiciones específicas.

## Funcion b.lt ensamblador ARM64

b.lt label

Que realiza un salto condicional a la etiqueta "label" si la comparación previa con cmp resultó en que el valor en el registro x0 es menor que el valor inmediato. Esto es útil para controlar el flujo del programa basado en condiciones específicas.

## Funcion b.gt ensamblador ARM64

b.gt label

Que realiza un salto condicional a la etiqueta "label" si la comparación previa con cmp resultó en que el valor en el registro x0 es mayor que el valor inmediato. Esto es útil para controlar el flujo del programa basado en condiciones específicas.

## Funcion b.le ensamblador ARM64

b.le label

Que realiza un salto condicional a la etiqueta "label" si la comparación previa con cmp resultó en que el valor en el registro x0 es menor o igual que el valor inmediato. Esto es útil para controlar el flujo del programa basado en condiciones específicas.

## Funcion b.ge ensamblador ARM64

b.ge label

Que realiza un salto condicional a la etiqueta "label" si la comparación previa con cmp resultó en que el valor en el registro x0 es mayor o igual que el valor inmediato. Esto es útil para controlar el flujo del programa basado en condiciones específicas.

## Funcion ldrb ensamblador ARM64

ldrb x1, [x0, #offset]

Que carga un byte desde la dirección calculada por x0 más el desplazamiento "offset" en el registro x1. Esto es útil para acceder a datos específicos dentro de una página después de haber cargado la dirección base con adrp, especialmente cuando se trabaja con datos de tipo byte.

## Funcion strb ensamblador ARM64

strb x1, [x0, #offset]

Que almacena un byte desde el registro x1 en la dirección calculada por x0 más el desplazamiento "offset". Esto es útil para escribir datos específicos dentro de una página después de haber cargado la dirección base con adrp, especialmente cuando se trabaja con datos de tipo byte.

## Funcion ldrh ensamblador ARM64

ldrh x1, [x0, #offset]

Que carga una mitad de palabra (16 bits) desde la dirección calculada por x0 más el desplazamiento "offset" en el registro x1. Esto es útil para acceder a datos específicos dentro de una página después de haber cargado la dirección base con adrp, especialmente cuando se trabaja con datos de tipo mitad de palabra.

## Funcion strh ensamblador ARM64

strh x1, [x0, #offset]

Que almacena una mitad de palabra (16 bits) desde el registro x1 en la dirección calculada por x0 más el desplazamiento "offset". Esto es útil para escribir datos específicos dentro de una página después de haber cargado la dirección base con adrp, especialmente cuando se trabaja con datos de tipo mitad de palabra.

## Funcion ldrsw ensamblador ARM64

ldrsw x1, [x0, #offset]

Que carga una palabra con signo (32 bits) desde la dirección calculada por x0 más el desplazamiento "offset" en el registro x1. Esto es útil para acceder a datos específicos dentro de una página después de haber cargado la dirección base con adrp, especialmente cuando se trabaja con datos de tipo palabra con signo.

## Funcion strsw ensamblador ARM64

strsw x1, [x0, #offset]

Que almacena una palabra con signo (32 bits) desde el registro x1 en la dirección calculada por x0 más el desplazamiento "offset". Esto es útil para escribir datos específicos dentro de una página después de haber cargado la dirección base con adrp, especialmente cuando se trabaja con datos de tipo palabra con signo.

## Funcion ldrsb ensamblador ARM64

ldrsb x1, [x0, #offset]

Que carga un byte con signo desde la dirección calculada por x0 más el desplazamiento "offset" en el registro x1. Esto es útil para acceder a datos específicos dentro de una página después de haber cargado la dirección base con adrp, especialmente cuando se trabaja con datos de tipo byte con signo.

## Funcion strsb ensamblador ARM64

strsb x1, [x0, #offset]

Que almacena un byte con signo desde el registro x1 en la dirección calculada por x0 más el desplazamiento "offset". Esto es útil para escribir datos específicos dentro de una página después de haber cargado la dirección base con adrp, especialmente cuando se trabaja con datos de tipo byte con signo.

## Funcion ldrsh ensamblador ARM64

ldrsh x1, [x0, #offset]

Que carga una mitad de palabra con signo (16 bits) desde la dirección calculada por x0 más el desplazamiento "offset" en el registro x1. Esto es útil para acceder a datos específicos dentro de una página después de haber cargado la dirección base con adrp, especialmente cuando se trabaja con datos de tipo mitad de palabra con signo.

## Funcion strsh ensamblador ARM64

strsh x1, [x0, #offset]

Que almacena una mitad de palabra con signo (16 bits) desde el registro x1 en la dirección calculada por x0 más el desplazamiento "offset". Esto es útil para escribir datos específicos dentro de una página después de haber cargado la dirección base con adrp, especialmente cuando se trabaja con datos de tipo mitad de palabra con signo.

## Funcion ldrsw ensamblador ARM64

ldrsw x1, [x0, #offset]

Que carga una palabra con signo (32 bits) desde la dirección calculada por x0 más el desplazamiento "offset" en el registro x1. Esto es útil para acceder a datos específicos dentro de una página después de haber cargado la dirección base con adrp, especialmente cuando se trabaja con datos de tipo palabra con signo.

# GLOSARIO

- **Página:** La memoria se organiza en bloques llamados páginas, que suelen tener un tamaño de 4 KB. La instrucción adrp carga la dirección base de una página, y luego se pueden usar otras instrucciones para acceder a datos específicos dentro de esa página.

Por ejemplo, si la etiqueta "buffer" está ubicada en una dirección que pertenece a una página, adrp cargará la dirección base de esa página en el registro x0. Luego, se pueden usar instrucciones como add o ldr para acceder a datos específicos dentro de esa página utilizando desplazamientos.

representación gráfica de la memoria con páginas:

| Column1 |
| ------- |
| Item1   |
| Item2   |
| Item3   |

aqui se muestra una representación gráfica de la memoria organizada en páginas. Cada bloque representa una página de memoria, y dentro de cada página se pueden almacenar datos específicos. La instrucción adrp carga la dirección base de una página, y luego se pueden usar otras instrucciones para acceder a los datos dentro de esa página utilizando desplazamientos.

- **Buffer:** Un buffer es un área de memoria utilizada para almacenar datos temporalmente mientras se procesan. En el contexto de ensamblador ARM64, un buffer puede ser una sección de memoria donde se almacenan datos que se van a manipular o procesar. La etiqueta "buffer" en el ejemplo se refiere a una ubicación específica en la memoria donde se pueden almacenar datos para su posterior uso.

- **Offset:** Un offset es un valor que se utiliza para calcular una dirección de memoria específica a partir de una dirección base. En el contexto de ensamblador ARM64, un offset se utiliza junto con la instrucción adrp para acceder a datos específicos dentro de una página de memoria. El offset se suma a la dirección base cargada por adrp para obtener la dirección final donde se encuentran los datos.

- **Registro:** Un registro es una pequeña cantidad de almacenamiento de datos dentro del procesador que se utiliza para realizar operaciones rápidas. En el contexto de ensamblador ARM64, los registros se utilizan para almacenar valores temporales, direcciones de memoria, resultados de operaciones, entre otros. Los registros se identifican por nombres como x0, x1, etc., y se utilizan en las instrucciones para realizar operaciones específicas.

- **32 bits** Se refiere a la cantidad de bits que se utilizan para representar un valor en un registro o en la memoria. En el contexto de ensamblador ARM64, un valor de 32 bits puede ser almacenado en un registro o en la memoria, y se utiliza para representar números enteros, direcciones de memoria, entre otros.
  Un valor de 32 bits puede representar un rango de números enteros desde -2,147,483,648 hasta 2,147,483,647 en el caso de números con signo, o desde 0 hasta 4,294,967,295 en el caso de números sin signo. En el contexto de ensamblador ARM64, se pueden utilizar instrucciones específicas para cargar o almacenar valores de 32 bits en registros o en la memoria.
  Los registros de 32 bits en ARM64 se identifican como w0, w1, etc., y se utilizan para almacenar valores de 32 bits. Las instrucciones como ldrsw o strsw se utilizan para cargar o almacenar valores de 32 bits con signo en la memoria.

- **16 bits** Se refiere a la cantidad de bits que se utilizan para representar un valor en un registro o en la memoria. En el contexto de ensamblador ARM64, un valor de 16 bits puede ser almacenado en un registro o en la memoria, y se utiliza para representar números enteros, direcciones de memoria, entre otros.
  Registros de 16 bits en ARM64 se identifican como w0, w1, etc., y se utilizan para almacenar valores de 16 bits. Las instrucciones como ldrh o strh se utilizan para cargar o almacenar valores de 16 bits en la memoria.
  A diferencia de los registros de 32 bits, los registros de 16 bits no pueden representar un rango tan amplio de números enteros, pero pueden ser útiles para almacenar datos más pequeños o para optimizar el uso de memoria en ciertos casos.

- **64 bits:** Es la cantidad de bits que se utilizan para representar un valor en un registro o en la memoria. En el contexto de ensamblador ARM64, un valor de 64 bits puede ser almacenado en un registro o en la memoria, y se utiliza para representar números enteros, direcciones de memoria, entre otros.
  Registros de 64 bits en ARM64 se identifican como x0, x1, etc., y se utilizan para almacenar valores de 64 bits. Las instrucciones como ldr o str se utilizan para cargar o almacenar valores de 64 bits en la memoria.

```

```
