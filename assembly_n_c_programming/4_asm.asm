; unsigned long long fact(unsigned long long n)
; SysV AMD64 ABI: argument in RDI, return value in RAX

section .note.GNU-stack
global fact
section .text

fact:
    ; if n == 0 return 1
    cmp     rdi, 0
    jne     .compute
    mov     rax, 1
    ret

.compute:
    mov     rax, 1      ; result = 1
    mov     rcx, rdi    ; rcx = n (loop counter)

.loop:
    imul    rax, rcx    ; rax = rax * rcx
    dec     rcx
    jnz     .loop
    ret
