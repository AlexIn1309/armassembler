.global _start

.section .text
_start:
    mov x0, #1          // stdout
    ldr x1, =msg    // Dirección del buffer
    mov x2, #18
    mov x8, #64         // syscall write en Linux
    svc #0

    mov x0, #1          // stdout
    ldr x1, =newline    // Dirección del buffer
    mov x2, #2
    mov x8, #64         // syscall write en Linux
    svc #0

    mov x0, #0          // stdin
    ldr x1, =buffer    // Dirección del buffer
    mov x2, #16      // Tamaño del buffer
    mov x8, #63         // syscall read en Linux
    svc #0

    mov x2, x0          // Cantidad de bytes leídos
    mov x0, #1          // stdout
    ldr x1, =saludo    // Dirección del buffer
    mov x2, #5
    mov x8, #64         // syscall write en Linux
    svc #0

    mov x0, #1          // stdout
    ldr x1, =buffer    // Dirección del buffer
    mov x8, #64         // syscall write en Linux
    svc #0

    mov x0, #1          // stdout
    ldr x1, =newline    // Dirección del buffer
    mov x2, #2
    mov x8, #64         // syscall write en Linux
    svc #0

    mov x0, #0          // Código de salida
    mov x8, #93         // syscall exit en Linux
    svc #0

.section .bss
.align 3
  buffer: .space 16      // Buffer para almacenar la entrada
.section .data
  msg: .ascii "Cual es tu nombre?" // 18 caracteres
  saludo: .ascii "Hola "
  newline: .ascii "\n"
