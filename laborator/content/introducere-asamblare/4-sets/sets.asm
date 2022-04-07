%include "printf32.asm"

section .text
    global main
    extern printf

main:
    ;cele doua multimi se gasesc in eax si ebx
    mov eax, 139
    mov ebx, 169
    PRINTF32 `%u\n\x0`, eax ; afiseaza prima multime
    PRINTF32 `%u\n\x0`, ebx ; afiseaza cea de-a doua multime

    ; TODO1: reuniunea a doua multimi
    xor ecx, ecx
    mov ecx, eax
    or ecx, ebx
    PRINTF32 `Reuniunea este: \x0`
    PRINTF32 `%u\n\x0`, ecx

    ; TODO2: adaugarea unui element in multime
    xor ecx, ecx
    mov ecx, 1
    shl ecx, 2
    or ecx, eax
    PRINTF32 `Dupa adaugarea elementului 2, multimea este: \x0`
    PRINTF32 `%u\n\x0`, ecx

    ; TODO3: intersectia a doua multimi
    xor ecx, ecx
    mov ecx, eax
    and ecx, ebx
    PRINTF32 `Intersectia este: \x0`
    PRINTF32 `%u\n\x0`, ecx

    ; TODO4: complementul unei multimi
    xor ecx, ecx
    mov ecx, eax
    not ecx
    PRINTF32 `Complementul este: \x0`
    PRINTF32 `%u\n\x0`, ecx

    ; TODO5: eliminarea unui element
    xor ecx, ecx
    mov ecx, 1
    shl ecx, 3
    not ecx
    and ecx, eax
    PRINTF32 `Multimea dupa eliminarea elementului 3 este: \x0`
    PRINTF32 `%u\n\x0`, ecx

    ; TODO6: diferenta de multimi EAX-EBX
    xor ecx, ecx
    mov ecx, ebx
    not ecx
    and ecx, eax
    PRINTF32 `Diferenta multimiilor este: \x0`
    PRINTF32 `%u\n\x0`, ecx


    xor eax, eax
    ret
