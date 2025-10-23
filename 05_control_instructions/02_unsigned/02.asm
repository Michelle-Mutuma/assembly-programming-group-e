; JAE / JNB → Jump if Above or Equal

section .data
    str_ae db "AX >= BX (Above or Equal). Michelle Mutuma 166958",10,0
    len_ae equ $ - str_ae - 1
    str_below db "AX < BX (Below). Michelle Mutuma 166958",10,0
    len_below equ $ - str_below - 1

section .text
    global _start
_start:
    mov ax,5
    mov bx,5
    cmp ax,bx
    jae above_equal

    mov ecx, str_below
    mov edx, len_below
    jmp print

above_equal:
    mov ecx, str_ae
    mov edx, len_ae

print:
    mov eax,4
    mov ebx,1
    int 0x80

    mov eax,1
    xor ebx,ebx
    int 0x80
