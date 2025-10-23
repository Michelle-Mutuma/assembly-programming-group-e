; JBE / JNA → Jump if Below or Equal

section .data
    str_be db "AX <= BX (Below or Equal). Michelle Mutuma 166958",10,0
    len_be equ $ - str_be - 1
    str_above db "AX > BX (Above). Michelle Mutuma 166958",10,0
    len_above equ $ - str_above - 1

section .text
    global _start
_start:
    mov ax,5
    mov bx,5
    cmp ax,bx
    jbe below_equal

    mov ecx, str_above
    mov edx, len_above
    jmp print

below_equal:
    mov ecx, str_be
    mov edx, len_be

print:
    mov eax,4
    mov ebx,1
    int 0x80

    mov eax,1
    xor ebx,ebx
    int 0x80
