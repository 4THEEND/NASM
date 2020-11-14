BITS 64

section .data
    _finish db 'Lancement du programme[*]', 0xa, 0x0
    _finish_len equ $ - _finish

section .text
    global _start

_start:
    mov rcx, 10
    mov r12, 10
    jmp _loop2

_loop: ;while et for
    cmp r12, 0
    jz exit
    dec r12
    mov rax, 0x1
    mov rdi, 0x1
    mov rsi, _finish
    mov rdx, _finish_len
    syscall
    jmp _loop

_loop2: ;do while
    mov rax, 0x1
    mov rdi, 0x1
    mov rsi, _finish
    mov rdx, _finish_len
    push rcx
    syscall
    pop rcx
    cmp rcx, 0
    je exit
    loop _loop2 ;loop = dec rcx && jump _loop2

exit:
    mov rax, 0x3c
    mov rdi, 0x0
    syscall 