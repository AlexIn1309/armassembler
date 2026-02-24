.global _start

.section .text
_start:
  mov w19, #0 // contador i = 0

loop:
  cmp w19, #10  // i == 10?
  b.eq end

  // convertir numero a ASCII 0 = 48 hex
  add w0, w19, #48  // w0 = '0' + 1

  // Guardar en stack
  sub sp, sp, #16
  strb w0, [sp]
  
  // syscall write(fd=1, buf=sp, size=1)
  mov x0, #1  // stdout
  mov x1, sp  // buffer
  mov x2, #1  // tamaño
  mov x8, #64 // syscall write
  svc #0

  add sp, sp, #16 // i++

  add w19, w19, #1
  b loop          // repetir


end:
  mov x0, #0
  mov x8, #93 // syscall exit linux
  svc #0
