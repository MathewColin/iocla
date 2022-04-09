%include "../utils/printf32.asm"

section .text
	extern printf
	global main

main:
    push ebp
    mov ebp, esp

    mov eax, 211    ; to be broken down into powers of 2
    mov ebx, 1      ; stores the current power

    ; TODO - print the powers of 2 that generate number stored in EAX


label:
    mov ecx, eax
    and ecx, ebx
    jnz print
 	shl ebx, 1
 	test ebx, ebx
	jnz label
	jmp end

print:
	PRINTF32 `%u\n\x0`, ecx
	shl ebx, 1
	jmp label

end:
    leave
    ret
