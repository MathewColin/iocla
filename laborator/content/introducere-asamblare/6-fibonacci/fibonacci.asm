%include "printf32.asm"

section .text
    global main
    extern printf

main:
    mov eax, 7       ; vrem sa aflam al N-lea numar; N = 7
    mov ebx, 0
    mov ecx, 1

    ; TODO: calculati al N-lea numar fibonacci (f(0) = 0, f(1) = 1)
    cmp eax, 0
    je thend

fibo:
    dec eax
    jz print
    add ebx, ecx
    xchg ebx, ecx
    jmp fibo

thend:
	mov ecx, 0 

print:
	PRINTF32 `%d\n\x0`, ecx
    ret
