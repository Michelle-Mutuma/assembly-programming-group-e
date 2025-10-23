; JGE / JNL → Jump if Greater or Equal
section .data
    msg_ge db "AX >= BX (Signed Greater or Equal). Michelle Mutuma 166958",10,0
    len_ge equ $ - msg_ge - 1
    msg_less db "AX < BX (Signed Less). Michelle Mutuma 166958",10,0
    len_less equ $ - msg_less - 1

section .text
    global _start
_start:
    mov ax,5
    mov bx,5
    cmp ax,bx
    jge ge_label

    mov ecx, msg_less
    mov edx, len_less
    jmp print

ge_label:
    mov ecx, msg_ge
    mov edx, len_ge

print:
    mov eax,4
    mov ebx,1
    int 0x80

    mov eax,1
    xor ebx,ebx
    int 0x80
