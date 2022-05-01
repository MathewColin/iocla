%include "../utils/printf32.asm"

section .text

extern printf
global main
main:
    ; numbers are placed in these two registers
    mov eax, 4
    mov ebx, 1

    ; TODO: get maximum value. You are only allowed to use one conditional jump and push/pop instructions.

    cmp ebx, eax
    jl jump
    push eax
    push ebx
    pop eax
    pop ebx
jump:
    PRINTF32 `Max value is: %d\n\x0`, eax ; print maximum value
    xor eax, eax
    ret
