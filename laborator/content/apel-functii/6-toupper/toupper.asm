section .data
    before_format db "before %s", 13, 10, 0
    after_format db "after %s", 13, 10, 0
    mystring db "abCdefghij", 0

section .text

extern printf
global main

toupper:
    push ebp
    mov ebp, esp

    ; TODO
    mov eax, [ebp + 8]
    xor ebx, ebx

loop:
    xor edx, edx
    mov dl, byte[eax + ebx]
    cmp dl, 0
    je out
    cmp dl, 97
    jge mai_mare_a
    jmp label

mai_mare_a:
    cmp dl, 122
    jle mai_mic_z
    jmp label

mai_mic_z:
    sub dl, 32

label:
    mov byte[eax + ebx], dl
    add ebx, 1
    jmp loop

    out:
    leave
    ret

main:
    push ebp
    mov ebp, esp

    push mystring
    push before_format
    call printf
    add esp, 8

    push mystring
    call toupper
    add esp, 4

    push mystring
    push after_format
    call printf
    add esp, 8

    leave
    ret
