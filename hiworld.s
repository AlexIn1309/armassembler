.global _main
.align 4

_main:
    // PRINT MESSAGE
    ADRP    X0, message@PAGE
    ADD X0, X0, message@PAGEOFF
    BL  _printf

    BL read_from_keyboard

    // READ NUMBER FROM DATA AND MOVE TO STACK FOR PRINTING
    ADRP    X10, num@PAGE
    ADD X10, X10, num@PAGEOFF
    LDR X1, [X10]
    STR X1, [SP, #-16]!

    // LOAD THE PRINTF FORMATTED MESSAGE
    ADRP    X0, output_format@PAGE
    ADD X0, X0, output_format@PAGEOFF

end:
    BL  _printf
    mov X16, #1
    svc 0

read_from_keyboard:
    STP X29, X30, [SP, #-16]!

    ADRP    X0, input_format@PAGE
    ADD X0, X0, input_format@PAGEOFF
    ADRP    X11, num@PAGE
    ADD X11, X11, num@PAGEOFF
    STR X11, [SP, #-16]!
    BL _scanf
    ADD SP, SP, #16

    LDP X29, X30, [SP], #16
    ret


.data
.balign 4
message:    .asciz "What is your favorite number?\n"
.balign 4
num:    .word 32
.balign 4
input_format:   .asciz "%d"
.balign 4
output_format:  .asciz "Your favorite number is %d \n"
