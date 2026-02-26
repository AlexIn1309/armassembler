.global _start

.section .text
_start:
  adrp x0, buffer // puntero al buffer
  add x0, x0, :lo12:buffer

  mov x1, #8000 // total samples
  mov x2, #0  //  contador
  mov x3, #50 //  periodo (ajusta frecuencia)
  mov x4, #0  //  fase
  
generate_loop:
  // alternar entre 0xFF y 0x00 (onda cuadrada)
  cmp x4, #25
  b.lt low // menor que 25

high:
  mov w5, #255  // registro 16 bits
  b store

low:
  mov w5, #0

store:
  strb w5, [x0, x2]

  add x2, x2, #1  // contador++
  add x4, x4, #1  // fase++

  cmp x4, x3
  b.lt continue
  mov x4, #0  //  reiniciar fase

continue:
  cmp x2, x1
  b.lt generate_loop

  //  syscall write(1, buffer, 8000)
  mov x0, #1
  adrp x1, buffer
  add x1, x1, :lo12:buffer
  mov x2, #8000
  mov x8, #64
  svc #0

  // exit
  mov x0, #0
  mov x8, #93
  svc #0

.section .bss
.align 4
buffer: .skip 8000  // 1 segundo de audio



