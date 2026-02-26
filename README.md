# ARM64 Assembler for Linux

Se desarrollarán actividades en ensamblador para el apple M2, utilizando el lenguaje de ensamblador ARM64. Estas actividades incluirán la implementación de algoritmos básicos, manipulación de datos y operaciones aritméticas. El objetivo es familiarizarse con la arquitectura ARM64 y comprender cómo se ejecutan las instrucciones a nivel de hardware. Se proporcionarán ejemplos y ejercicios prácticos para reforzar el aprendizaje.

## Compilación y Ejecución

as program.s -o program.o
ld program.o -o program
./program

- 1. Suma de dos números

- 2. Resta de dos números

- 3. Resto de la división de dos números

- 4. Conversión de grados Celsius a Fahrenheit

- 5. Factorial de un número

# Comparadores

Existe como if else que se puede implementar con instrucciones de comparación y saltos condicionales. Por ejemplo, para comparar dos números y ejecutar diferentes bloques de código según el resultado, se pueden usar las instrucciones `CMP` (comparar) y `BNE` (saltar si no son iguales) o `BEQ` (saltar si son iguales).

    cmp x0, x1         // Comparar x0 y x1
    b.eq equal         // Si son iguales, saltar a 'equal'

# ARCHIVOS CREADOS

- apuntes.md Generamos una guia con algunos nemonicos y sus funciones, ademas de un pequeño glosario

- hiworld.s / Imprime Hola ARM64

- leer.s /  Recibe string del usuario y se imprime

- suma.s / Hace uso directo del codigo ASCII para imprimir

- suma2.s /  Imprime con buffer la string

- multiplicacion.s /  Multiplica dos numeros con mul y lo imprimimos por pantalla

- igual.s /  Usa cmp para comparar dos numeros 

- menorque.s /  Hace uso del comparador con flag 

- resta.s /  Realiza la resta de dos numeros y los imprime

- imprimir09.s /  Ciclo imprime los numeros del 0 al 9

- sumarnumeros.s /  Lee 10 numeros y mostrar el resultado de la suma

- saludar.s / Leer el nombre en pantalla y saluda
 
