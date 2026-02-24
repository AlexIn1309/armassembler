# armassembler

Se desarrollarán actividades en ensamblador para el apple M2, utilizando el lenguaje de ensamblador ARM64. Estas actividades incluirán la implementación de algoritmos básicos, manipulación de datos y operaciones aritméticas. El objetivo es familiarizarse con la arquitectura ARM64 y comprender cómo se ejecutan las instrucciones a nivel de hardware. Se proporcionarán ejemplos y ejercicios prácticos para reforzar el aprendizaje.

## Compilación y Ejecución

as program.s -o program.o
ld program.o -o program
./program

## 1. Suma de dos números

## 2. Resta de dos números

## 3. Resto de la división de dos números

## 4. Conversión de grados Celsius a Fahrenheit

## 5. Factorial de un número

# Comparadores

Existe como if else que se puede implementar con instrucciones de comparación y saltos condicionales. Por ejemplo, para comparar dos números y ejecutar diferentes bloques de código según el resultado, se pueden usar las instrucciones `CMP` (comparar) y `BNE` (saltar si no son iguales) o `BEQ` (saltar si son iguales).

    cmp x0, x1         // Comparar x0 y x1
    b.eq equal         // Si son iguales, saltar a 'equal'

# Mayor que

-
