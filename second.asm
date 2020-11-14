BITS 64

section .bss

section .data
    n db `\n`
    n_len equ $-n

section .text
    global _start

_start:
    mov rax, 1  ;syscall pour afficher à l'écran
    mov rdi, 1
    mov rsi, [rsp+16]
    mov rdx, 0x3
    syscall

    mov rax, 1  ;syscall pour afficher à l'écran
    mov rdi, 1
    mov rsi, n
    mov rdx, n_len
    syscall

    mov rax, 1  ;syscall pour afficher à l'écran
    mov rdi, 1
    mov rsi, [rsp+16]
    mov rdx, 0x8
    syscall

    jmp exit

exit:
    mov rax, 60 ;syscall pour exit programme
    mov rdi, 0
    syscall 