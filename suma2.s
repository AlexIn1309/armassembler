.global _start

.section .text
_start:
    // ----------- NUMEROS -----------
    mov x0, #20        // Primer número
    mov x1, #7         // Segundo número
    add x2, x0, x1     // x2 = resultado (27)

    // ----------- CONVERTIR A ASCII -----------
    // Vamos a convertir 27 en dos dígitos: '2' y '7'

    mov x3, #10        // divisor 10
    udiv x4, x2, x3    // x4 = decenas (27 / 10 = 2)
    msub x5, x4, x3, x2 // x5 = unidades (27 - (2*10) = 7)

    add x4, x4, #'0'   // convertir a ASCII ('2')
    add x5, x5, #'0'   // convertir a ASCII ('7')

    // Guardar los dígitos en el buffer
    ldr x6, =num_buf
    strb w4, [x6]
    strb w5, [x6, #1]

    // ----------- IMPRIMIR TEXTO -----------
    // write(1, msg1, len1)
    mov x0, #1
    ldr x1, =msg1
    mov x2, #11
    mov x8, #64        // syscall write (Linux ARM64)
    svc #0

    // write(1, num_buf, 2)
    mov x0, #1
    ldr x1, =num_buf
    mov x2, #2
    mov x8, #64
    svc #0

    // salto de línea
    mov x0, #1
    ldr x1, =newline
    mov x2, #1
    mov x8, #64
    svc #0

    // exit(0)
    mov x0, #0
    mov x8, #93        // syscall exit
    svc #0

.section .data
msg1:    .ascii "La suma es "
num_buf: .space 2
newline: .ascii "\n"
