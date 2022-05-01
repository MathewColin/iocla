%include "../utils/printf32.asm"

%define NUM 5
   
section .text

extern printf
global main
main:
    mov ebp, esp

    ; TODO 1: replace every push by an equivalent sequence of commands (use direct addressing of memory. Hint: esp)
    mov ecx, NUM
push_nums:
    ;push ecx
    sub esp, 4
    mov [esp], ecx
    loop push_nums

    ;push 0
    sub esp, 4
    mov eax, 0
    mov [esp], eax
    ;push "mere"
    sub esp, 4
    mov eax, "mere"
    mov [esp], eax
    ;push "are "
    sub esp, 4
    mov eax, "are "
    mov [esp], eax
    ;push "Ana "
    sub esp, 4
    mov eax, "Ana "
    mov [esp], eax

    

    ; TODO 2: print the stack in "address: value" format in the range of [ESP:EBP]
    ; use PRINTF32 macro - see format above
    mov ebx, esp
    mov ecx, ebp
    sub ecx, ebx

print:
    cmp ecx, 0
    je iesire
    PRINTF32 `%p \x0`, ebx
    PRINTF32 `%hhu\n\x0`, byte [ebx]
    add ebx, 1
    sub ecx, 1
    jmp print

iesire:
    ; TODO 3: print the string
    lea esi, [esp]
    PRINTF32 `%s\n\x0`, esi

    ; TODO 4: print the array on the stack, element by element.
    xor ecx, ecx
    mov ecx, NUM
    mov ebx, ebp
    sub ebx, 4 * NUM

afis:
    cmp ecx, 0
    je iesire_afis
    PRINTF32 `%hhu \x0`, byte[ebx]
    add ebx, 4
    sub ecx, 1
    jmp afis

iesire_afis:
    PRINTF32 `\n\x0`
    ; restore the previous value of the EBP (Base Pointer)
    mov esp, ebp

    ; exit without errors
    xor eax, eax
    ret
