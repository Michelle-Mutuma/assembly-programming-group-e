section .data
    num dd 55

    ; contains ADDRESS of num
    myptr dd num

section .text
    global _start

_start:
    mov eax, [myptr]

    ; Exit
    mov eax, 1
    xor ebx, ebx
    int 0x80
