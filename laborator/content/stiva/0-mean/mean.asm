%include "../utils/printf32.asm"

%define ARRAY_SIZE 13
%define DECIMAL_PLACES 5

section .data

    num_array dw 76, 12, 65, 19, 781, 671, 431, 761, 782, 12, 91, 25, 9
    decimal_point db ".",0


section .text

extern printf
global main
main:
    xor eax, eax
    mov ecx, ARRAY_SIZE

    ; TODO1 - compute the sum of the vector numbers - store it in eax

    sub ecx, 1
suma:
    add ax, word[num_array + 2 * ecx]
    test ecx, ecx
    jz pr
    sub ecx, 1
    jmp suma

pr:
    PRINTF32 `Sum of numbers: %d\n\x0`, eax

    ; TODO2 - compute the quotient of the mean

    mov ecx, eax
    mov ax, cx
    shr ecx, 16
    mov dx, cx
    mov bx, ARRAY_SIZE
    div bx

    PRINTF32 `Mean of numbers: %d\n\x0`, eax
    xor eax, eax
    ret
    ;PRINTF32 `.\x0`

    mov ecx, DECIMAL_PLACES
compute_decimal_place:

    ; TODO3 - compute the current decimal place - store it in ax

    ;PRINTF32 `%d\x0`, eax
    ;dec ecx
    ;cmp ecx, 0
    ;jg compute_decimal_place

    ;PRINTF32 `\n\x0`
    ;xor eax, eax
    ret
