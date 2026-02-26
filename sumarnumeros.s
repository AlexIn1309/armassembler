.global _start

.section .text
_start:
  mov w20, #0 // contador i = 0
  mov w19, #0 // varibale de suma

loop:
  cmp w20, #10  // i == 10?
  b.eq done

  mov x0, #0  // stdin
  ldr x1, =buffer // direccion de buffer
  mov x2, #16 // Tamaño de buffer
  mov x8, #63 // syscall read en linux
  svc #0

  // Cargar primer byte del buffer
  ldr x1, =buffer
  ldrb w2, [x1] // ASCII del numero

  // Convertir a ASCII -> Entero
  sub w2, w2, #48 // '0' = 48

  add w19, w19, w2

  add w20, w20, #1  // iterador i++
  b loop          // repetir

done:
  // Converti suma a ASCII (solo de 0 a 9)
  // add w19, w19, #48
  // x2 = suma 
  mov x2, x19

  mov x3, #10 //  Divisor base 10

  udiv x4, x2, x3 // x4 = decenas asigna

  msub x5, x4, x3, x2 // x5 = (x5 = x2 - x4 * 10)unidades restar y multiplicar

  // agregamos 0
  add x4, x4, #'0'
  add x5, x5, #'0'
  // Guardar en memoria para write
  ldr x1, =outbuf // Direccion del buffer
  strb w4, [x1] // ASCII del numero
  strb w5, [x1, #1] // ASCII del numero

  mov x0, #1
  mov x2, #2
  mov x8, #64 // syscall write en linux
  svc #0

  mov x0, #0
  mov x8, #93 // syscall exit linux
  svc #0

.section .bss
  .align 3
outbuf: .space 4  // Aqui guardamos lo que imprimirá
buffer: .space 16 // Buffer para almacenar la entrada
