.global _start

.section .text
_start:
  mov x0, #6          // Primer número
  mov x1, #7          // Segundo número
  mul x2, x0, x1      // x2 = x0 * x1 (42)

  mov x3, #10         // Divisor para convertir a ASCII
  udiv x4, x2, x3     // x4 = decenas
  msub x5, x4, x3, x2 // x5 = unidades

  add x4, x4, #'0'    // Convertir decena a ASCII
  add x5, x5, #'0'    // Convertir unidad a ASCII

  ldr x6, =buffer    // Cargar dirección del buffer
  strb w4, [x6]     // Primer dígito
  strb w5, [x6, #1] // Segundo dígito

  mov x0, #1          // stdout
  ldr x1, =buffer    // Dirección del buffer
  mov x2, #2          // Tamaño
  mov x8, #64         // syscall write en Linux
  svc #0

  mov x0, #1          // syscall exit
  ldr x1, =newline   // Cargar dirección del salto de línea
  mov x2, #1          // Tamaño
  mov x8, #64         // syscall write en Linux
  svc #0

  mov x0, #0          // Código de salida
  mov x8, #93         // syscall exit en Linux
  svc #0

.section .data
buffer: .space 16    // Buffer para almacenar el resultado en ASCII
newline: .ascii "\n"
