%include "printf32.asm"

section .data
    myString: db "Hello, World!", 0
    mySecondString: db "Goodbye, Cruel World!", 0

section .text
    global main
    extern printf

main:
    mov ecx, 6                      ; N = valoarea registrului ecx
    mov eax, 2
    mov ebx, 1
    mov edx, 1
    cmp eax, ebx
    ;je print                        ; TODO1: eax > ebx?
    jg print
    ret

print:
    PRINTF32 `%s\n\x0`, myString
    cmp edx, ecx
    jne printare;
                                        ; TODO2.2: afisati "Hello, World!" de N ori
    PRINTF32 `%s\n\x0`, mySecondString  ; TODO2.1: afisati "Goodbye, World!"
    ret

printare:
    add edx, 1
    jmp print
