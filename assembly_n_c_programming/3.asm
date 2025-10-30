global _start

section .bss
    outbuf: resb 32

section .text
_start:
    xor     rax, rax
    mov     rcx, 25
.sum_loop:
    add     rax, rcx
    dec     rcx
    cmp     rcx, 14
    jne     .sum_loop

    lea     rsi, [outbuf + 32]
    mov     rbx, 10
    cmp     rax, 0
    jne     .conv_loop2
    dec     rsi
    mov     byte [rsi], '0'
    jmp .conv_done2

.conv_loop2:
    xor     rdx, rdx
    div     rbx
    add     dl, '0'
    dec     rsi
    mov     [rsi], dl
    cmp     rax, 0
    jne     .conv_loop2

.conv_done2:
    dec     rsi
    mov     byte [rsi], 10

    lea     rdx, [outbuf + 32]
    sub     rdx, rsi

    mov     rax, 1
    mov     rdi, 1
    syscall

    mov     rax, 60
    xor     rdi, rdi
    syscall
