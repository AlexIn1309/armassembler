.section .data
enable_mouse: .asciz "\033[?1000h\033[?1006h"
disable_mouse: .asciz "\033[?1000l\033[?1006l"
clear: .asciz "\033[2J\033[H"

button: .asciz "[   CLICK ME   ]"
cursor_pos: .asciz "\033[5;10H"
msg: .asciz "\nBoton presionado!\n"

termios_buf: .space 64
buffer: .space 32

.section .text
.global _start

_start:
    // Limpiar pantalla
    mov x0, #1
    ldr x1, =clear
    mov x2, #7
    mov x8, #64
    svc #0

    // Habilitar mouse (modo SGR)
    mov x0, #1
    ldr x1, =enable_mouse
    mov x2, #14
    mov x8, #64
    svc #0

    // Mover cursor a fila 5, columna 10
    mov x0, #1
    ldr x1, =cursor_pos
    mov x2, #8
    mov x8, #64
    svc #0

    // Dibujar boton en fila 5, columna 10
    mov x0, #1
    ldr x1, =button
    mov x2, #16
    mov x8, #64
    svc #0

// fd = 0 (stdin)
mov x0, #0

// puntero a estructura termios
ldr x1, =termios_buf

// ioctl TCGETS (leer config actual)
mov x2, #0x5401
mov x8, #29      // syscall ioctl en ARM64 Linux
svc #0

// ---- modificar flags ----
// lflag está en offset 12 (c_lflag)
ldr w3, [x1, #12]

// quitar ICANON (0x0002) y ECHO (0x0008)
mov w4, #(0x0002 | 0x0008)
bic w3, w3, w4

// guardar flags modificados
str w3, [x1, #12]

// VMIN = 1 (leer byte inmediato)
mov w5, #1
strb w5, [x1, #6]

// VTIME = 0 (sin timeout)
mov w5, #0
strb w5, [x1, #5]

// aplicar nueva configuración (TCSETS)
mov x0, #0
ldr x1, =termios_buf
mov x2, #0x5402
mov x8, #29
svc #0


loop:
    // read(stdin, buffer, 32)
    mov x0, #0
    ldr x1, =buffer
    mov x2, #32
    mov x8, #63
    svc #0

    cmp x0, #6
    blt loop

    // Verificar ESC
    ldrb w3, [x1]
    cmp w3, #27
    b.ne loop

    // Verificar '['
    ldrb w3, [x1, #1]
    cmp w3, #'['
    b.ne loop

    // Verificar 'M' (FORMATO CORRECTO)
    ldrb w3, [x1, #2]
    cmp w3, #'M'
    b.ne loop

    // -------- EXTRAER COORDENADAS --------
    ldrb w4, [x1, #4]   // X codificado
    ldrb w5, [x1, #5]   // Y codificado

    sub w4, w4, #32     // X real
    sub w5, w5, #32     // Y real


    // -------- HITBOX DEL BOTÓN --------
    // Botón está en Y = 5
    cmp w5, #5
    b.ne loop          // Si no es la fila 5, ignorar click

    // X >= 10 (inicio del botón)
    cmp w4, #10
    blt loop           // Click a la izquierda del botón

    // X <= 25 (fin del botón: 10 + 15)
    cmp w4, #25
    bgt loop           // Click a la derecha del botón

    // -------- SI LLEGA AQUÍ, CLICK DENTRO DEL BOTÓN --------
    mov x0, #1
    ldr x1, =msg
    mov x2, #18
    mov x8, #64
    svc #0


    b loop

