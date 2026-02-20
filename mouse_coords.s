.global _start

.section .text
_start:
    // Activar mouse SGR (coordenadas reales)
    mov x0, #1
    ldr x1, =enable_mouse
    mov x2, #18
    mov x8, #64
    svc #0

    // Mensaje
    mov x0, #1
    ldr x1, =msg
    mov x2, #17
    mov x8, #64
    svc #0

    // Leer entrada (mouse)
    mov x0, #0
    ldr x1, =buffer
    mov x2, #32
    mov x8, #63
    svc #0

    // x1 = buffer
    ldr x1, =buffer

    // Saltar ESC[<
    add x1, x1, #3

    // -------- Parsear botón (lo ignoramos) --------
parse_button:
    ldrb w2, [x1]
    cmp w2, #';'
    beq parse_x
    add x1, x1, #1
    b parse_button

// -------- Parsear X --------
parse_x:
    add x1, x1, #1   // saltar ';'
    mov x3, #0       // X = 0

parse_x_loop:
    ldrb w2, [x1]
    cmp w2, #';'
    beq parse_y
    sub w2, w2, #'0'
    mov x4, #10
    mul x3, x3, x4
    add x3, x3, x2
    add x1, x1, #1
    b parse_x_loop

// -------- Parsear Y --------
parse_y:
    add x1, x1, #1   // saltar ';'
    mov x5, #0       // Y = 0

parse_y_loop:
    ldrb w2, [x1]
    cmp w2, #'M'
    beq print_coords
    sub w2, w2, #'0'
    mov x4, #10
    mul x5, x5, x4
    add x5, x5, x2
    add x1, x1, #1
    b parse_y_loop

// -------- Imprimir resultado --------
print_coords:
    // "X="
    mov x0, #1
    ldr x1, =txt_x
    mov x2, #2
    mov x8, #64
    svc #0

    // Convertir X a ASCII (2 dígitos máx simple)
    mov x6, #10
    udiv x7, x3, x6
    msub x9, x7, x6, x3

    add x7, x7, #'0'
    add x9, x9, #'0'

    ldr x10, =num_buf
    strb w7, [x10]
    strb w9, [x10, #1]

    mov x0, #1
    ldr x1, =num_buf
    mov x2, #2
    mov x8, #64
    svc #0

    // " Y="
    mov x0, #1
    ldr x1, =txt_y
    mov x2, #3
    mov x8, #64
    svc #0

    // Convertir Y a ASCII
    mov x6, #10
    udiv x7, x5, x6
    msub x9, x7, x6, x5

    add x7, x7, #'0'
    add x9, x9, #'0'

    ldr x10, =num_buf
    strb w7, [x10]
    strb w9, [x10, #1]

    mov x0, #1
    ldr x1, =num_buf
    mov x2, #2
    mov x8, #64
    svc #0

    // newline
    mov x0, #1
    ldr x1, =newline
    mov x2, #1
    mov x8, #64
    svc #0

    // Desactivar mouse (limpio)
    mov x0, #1
    ldr x1, =disable_mouse
    mov x2, #18
    mov x8, #64
    svc #0

    // exit
    mov x0, #0
    mov x8, #93
    svc #0

.section .data
enable_mouse:  .ascii "\033[?1000h\033[?1006h"
disable_mouse: .ascii "\033[?1000l\033[?1006l"
msg:           .ascii "Haz click...\n"
txt_x:         .ascii "X="
txt_y:         .ascii " Y="
newline:       .ascii "\n"
num_buf:       .space 2
buffer:        .space 32

