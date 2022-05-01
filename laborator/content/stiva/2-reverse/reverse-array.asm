%include "../utils/printf32.asm"

%define ARRAY_LEN 7

section .data

input dd 122, 184, 199, 242, 263, 845, 911
output times ARRAY_LEN dd 0

section .text

extern printf
global main
main:

    ; TODO push the elements of the array on the stack
    mov ecx, ARRAY_LEN
    sub ecx, 1
label:
    mov eax, dword[input + 4 * ecx]
    push eax
    test ecx, ecx
    jz pr
    sub ecx, 1
    jmp label
    ; TODO retrieve the elements (pop) from the stack into the output array
pr:
    mov ecx, ARRAY_LEN
    xor edx, edx
    sub ecx, 1
iesire:
    pop eax
    mov [output + 4 * ecx], eax
    test ecx, ecx
    jz print
    sub ecx, 1
    jmp iesire
print:
    PRINTF32 `Reversed array: \n\x0`
    xor ecx, ecx
print_array:
    mov edx, [output + 4 * ecx]
    PRINTF32 `%d\n\x0`, edx
    inc ecx
    cmp ecx, ARRAY_LEN
    jb print_array

    xor eax, eax
    ret
