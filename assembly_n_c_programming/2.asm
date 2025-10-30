global _start

section .bss
    ; buffer for ascii digits (enough for 64-bit number + newline)
    outbuf:   resb 32

section .data
    newline db 10

section .text
_start:
    ; compute sum in rax
    xor     rax, rax        ; rax = 0 (sum)
    mov     rcx, 15         ; i = 15
.sum_loop:
    add     rax, rcx
    inc     rcx
    cmp     rcx, 26
    jne     .sum_loop

    ; rax now holds sum (220)
    ; convert rax (unsigned) to ascii in outbuf
    lea     rsi, [outbuf + 32]   ; rsi points just past end of buffer
    mov     rbx, 10
    xor     rdx, rdx

    cmp     rax, 0
    jne     .conv_loop
    ; special case zero:
    dec     rsi
    mov     byte [rsi], '0'
    jmp     .conv_done

.conv_loop:
    xor     rdx, rdx
    div     rbx                ; divide rdx:rax by 10 -> quotient in rax, remainder in rdx
    add     dl, '0'
    dec     rsi
    mov     [rsi], dl
    cmp     rax, 0
    jne     .conv_loop

.conv_done:
    ; append newline after number
    dec     rsi
    mov     byte [rsi], 10    ; newline char

    ; calculate length = (end - rsi)
    lea     rdx, [outbuf + 32]
    sub     rdx, rsi          ; rdx = length to write

    ; syscall write(1, rsi, rdx)
    mov     rax, 1            ; syscall: sys_write
    mov     rdi, 1            ; fd = stdout
    mov     rsi, rsi          ; buf
    syscall

    ; syscall exit(0)
    mov     rax, 60           ; sys_exit
    xor     rdi, rdi
    syscall
