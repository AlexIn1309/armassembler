.global _start

.section .text
_start:
    // ----------- NUMEROS -----------
    mov x0, #15        // Primer número
    mov x1, #15        // Segundo número
    cmp x0, x1         // Comparar x0 y x1
    b.eq equal         // Si son iguales, saltar a 'equal'

    mov x0, #1          // stdout
    ldr x1, =msg_not_equal  // Cargar dirección del mensaje de igualdad
    mov x2, #24         // Tamaño del mensaje
    mov x8, #64         // syscall write en Linux
    svc #0
    mov x0, #0          // Código de salida para números diferentes
    b done

equal:
    mov x0, #1          // stdout
    ldr x1, =msg_equal  // Cargar dirección del mensaje de igualdad
    mov x2, #24         // Tamaño del mensaje
    mov x8, #64         // syscall write en Linux
    svc #0
done:
  mov x8, #93         // syscall exit en Linux
  svc #0

.section .data
msg_equal: .ascii "Los números son iguales\n"
msg_not_equal: .ascii "Los números son diferentes\n"
