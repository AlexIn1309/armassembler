.global _main
.align 4

.data
msg: .asciz "suma "
newline: .asciz "\n"

.text
_main:
  mov x10, #5
  mov x11, #10
  add x12, x10, x11

  // Reservar buffer alineado en la pila
  sub sp, sp, #16

 // Copiar "suma " a la pila (ASCII: 0x73 0x75 0x6d 0x61 0x20)
  mov w8, #0x73      // 's'
  strb w8, [sp]
  mov w8, #0x75      // 'u'
  strb w8, [sp, #1]
  mov w8, #0x6d      // 'm'
  strb w8, [sp, #2]
  mov w8, #0x61      // 'a'
  strb w8, [sp, #3]
  mov w8, #0x20      // ' '
  strb w8, [sp, #4]

// Imprimir "suma "
  mov x0, #1
  mov x1, sp
  mov x2, #5
  movz x16, #0x4
  movk x16, #0x2000, lsl #16
  svc #0
  mov x2, x12
 bl print_num

  // Imprimir salto de línea
  mov x0, #1
  ldr x1, =newline
  mov x2, #1
  movz x16, #0x4
  movk x16, #0x2000, lsl #16
  svc #0

  // Liberar buffer
  add sp, sp, #16

  mov x0, #0
  mov x16, #1
  svc #0

print_num:
  mov x3, x2
  mov x6, #10
  udiv x4, x3, x6      // decenas
  mul x7, x4, x6
  sub x5, x3, x7       // unidades

  add x9, x4, #48
  strb w9, [sp]
  add x9, x5, #48
  strb w9, [sp, #1]

  mov x0, #1
  mov x1, sp
  mov x2, #2
  movz x16, #0x4
  movk x16, #0x2000, lsl #16
  svc #0
  ret
