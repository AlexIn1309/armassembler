.global _start

.section .text
_start:
    // ---------------------------
    // Activar modo mouse SGR
    // ESC[?1003h  (movimiento)
    // ESC[?1006h  (coordenadas modernas)
    // ---------------------------
    mov x0, #1              // stdout
    ldr x1, =enable_mouse
    mov x2, #18
    mov x8, #64             // write syscall (Linux ARM64)
    svc #0

    // ---------------------------
    // Mensaje
    // ---------------------------
    mov x0, #1
    ldr x1, =msg
    mov x2, #20
    mov x8, #64
    svc #0

    // ---------------------------
    // Leer entrada (mouse o teclado)
    // ---------------------------
    mov x0, #0              // stdin
    ldr x1, =buffer
    mov x2, #32             // leer hasta 32 bytes
    mov x8, #63             // read syscall
    svc #0                  // x0 = bytes leídos

    // ---------------------------
    // Imprimir lo recibido crudo
    // ---------------------------
    mov x2, x0              // longitud = bytes leídos
    mov x0, #1              // stdout
    ldr x1, =buffer
    mov x8, #64             // write
    svc #0

    // salto de línea bonito
    mov x0, #1
    ldr x1, =newline
    mov x2, #1
    mov x8, #64
    svc #0

    // ---------------------------
    // Desactivar modo mouse (limpio)
    // ---------------------------
    mov x0, #1
    ldr x1, =disable_mouse
    mov x2, #18
    mov x8, #64
    svc #0

    // exit(0)
    mov x0, #0
    mov x8, #93
    svc #0

.section .data
enable_mouse:  .ascii "\033[?1003h\033[?1006h"
disable_mouse: .ascii "\033[?1003l\033[?1006l"
msg:           .ascii "Haz click en la terminal:\n"
newline:       .ascii "\n"
buffer:        .space 32
