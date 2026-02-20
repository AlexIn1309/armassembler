.global _start

.section .text
_start:
    // write(1, msg, len)
    mov x0, #1          // stdout
    ldr x1, =msg        // dirección del mensaje
    mov x2, #14         // longitud
    mov x8, #64         // syscall write (Linux ARM64)
    svc #0

    // exit(0)
    mov x0, #0
    mov x8, #93         // syscall exit
    svc #0

.section .data
msg: .ascii "Hola ARM64!\n"
