; JLE / JNG → Jump if Less or Equal
section .data
    msg_le db "AX <= BX (Signed Less or Equal). Michelle Mutuma 166958",10,0
    len_le equ $ - msg_le - 1
    msg_greater db "AX > BX (Greater). Michelle Mutuma 166958",10,0
    len_greater equ $ - msg_greater - 1

section .text
    global _start
_start:
    mov ax,5
    mov bx,5
    cmp ax,bx
    jle le_label

    mov ecx, msg_greater
    mov edx, len_greater
    jmp print

le_label:
    mov ecx, msg_le
    mov edx, len_le

print:
    mov eax,4
    mov ebx,1
    int 0x80

    mov eax,1
    xor ebx,ebx
    int 0x80
