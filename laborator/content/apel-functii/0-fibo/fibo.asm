%include "../utils/printf32.asm"

%define NUM_FIBO 10

section .text

extern printf
global main
main:
    mov ebp, esp

    ; TODO - replace below instruction with the algorithm for the Fibonacci sequence

    mov ecx, NUM_FIBO
    xor eax, eax
    xor ebx, ebx
    mov ebx, 1
    push eax
    push ebx
    dec ecx
    dec ecx

loop_fibo:
    cmp ecx, 0
    je out
    mov edx, eax
    add edx, ebx
    mov eax, ebx
    mov ebx, edx
    push edx
    dec ecx
    jmp loop_fibo

out:
    mov ecx, NUM_FIBO
    
print:
    mov eax, dword [esp + (ecx - 1) * 4]
    PRINTF32 `%d \x0`, eax
    dec ecx
    cmp ecx, 0
    ja print

    PRINTF32 `\n\x0`
    mov esp, ebp
    xor eax, eax
    ret
