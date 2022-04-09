%include "../utils/printf32.asm"

%define ARRAY_SIZE    10

section .data
    dword_array dd 1392, 12544, 7992, 6992, 7202, 27187, 28789, 17897, 12988, 17992
    print_format db "Array sum of squared elements is ", 0

section .text
extern printf
global main
main:
    push ebp
    mov ebp, esp

    mov ecx, ARRAY_SIZE     ; Use ecx as loop counter.
    xor edx, edx
    xor eax, eax
    xor ebx, ebx
    xor esi, esi

add_dword_array_element:
    mov esi, eax
    mov eax, dword [dword_array + 4 * (ecx - 1)]
    mul eax
    add eax, ebx
    add eax, esi
    loop add_dword_array_element

    PRINTF32 `%s\x0`, print_format
    PRINTF32 `%u\n\x0`, eax

    leave
    ret
