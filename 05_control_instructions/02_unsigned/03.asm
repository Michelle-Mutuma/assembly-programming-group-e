; JB / JNAE → Jump if Below

section .data
    str_below     db "AX < BX (Below). Michelle Mutuma 166958",10,0
    len_below equ $ - str_below - 1
    str_not_below db "AX >= BX (Not Below). Michelle Mutuma 166958",10,0
    len_not_below equ $ - str_not_below - 1

section .text
    global _start
_start:
    mov ax,2
    mov bx,5
    cmp ax,bx
    jb below

    mov ecx, str_not_below
    mov edx, len_not_below
    jmp print

below:
    mov ecx, str_below
    mov edx, len_below

print:
    mov eax,4
    mov ebx,1
    int 0x80

    mov eax,1
    xor ebx,ebx
    int 0x80
