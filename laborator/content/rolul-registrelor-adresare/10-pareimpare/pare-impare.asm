%include "../utils/printf32.asm"

%define ARRAY_SIZE    10

section .data
    dword_array dd 1392849, -12544, 879923, 8799279, 7202277, -971872, 28789292, -17897892, 12988, 8799201
    

section .text
extern printf
global main
main:
    push ebp
    mov ebp, esp

    mov ecx, ARRAY_SIZE     ; Use ecx as loop counter.
    xor edx, edx            ; Store current value in dl; zero entire edx.
    xor esi, esi            ; Stores the number of odd elements
    xor edi, edi            ; Stores the number of even elements

count:
    cmp ecx, 0
    je print
    mov ebx, dword [dword_array + 4 * (ecx - 1)]
    test ebx, ebx
    jnp odd
    test ebx, ebx
    jp even

back:
    dec ecx
    jmp count

even:
    add esi, 1
    jmp back
odd:
    add edi, 1
    jmp back

print:
    PRINTF32 `Odd: %u\nEven: %u\n\x0`, edi, esi

    leave
    ret
