.global _start

.section .text
_start:
    // ----------- NUMEROS -----------
    mov x0, #15        // Primer número
    mov x1, #15        // Segundo número

    // Comparar x0 y x1
    cmp x0, x1
    b.lt less_than    // Si x0 < x1, saltar a 'less_than'

less_than:
    mov x0, #1          // stdout
    ldr x1, =msg_less_than  // Cargar dirección del mensaje de menor que
    mov x2, #24         // Tamaño del mensaje
    mov x8, #64         // syscall write en Linux
    svc #0
    mov x0, #0          // Código de salida para x0 < x1
    b done

done:
    mov x8, #93         // syscall exit en Linux
    svc #0

.section .data
msg_less_than: .ascii "El primer número es menor\n"
