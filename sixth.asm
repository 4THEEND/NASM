BITS 64

%define LEN 3

section .bss
    input resb LEN

section .data
    age db 'Type your age: '
    age_len equ $-age

    print_age db 'Your age is: '
    print_age_len equ $-print_age

    ent db `\n`
    ent_len equ $-ent


    b db 'cool2', 0xa, 0x0
    b_len equ $ - b

section .text
    global _start

_start:
    call _func

    mov rax, 0x1
    mov rdi, 0x1
    mov rsi, b
    mov rdx, b_len
    syscall

    jmp exit

_func:
    push rbp
    mov rbp, rsp

    mov rax, 0x1
    mov rdi, 0x1
    mov rsi, age
    mov rdx, age_len
    syscall

    mov rax, 0x0
    mov rdi, 0x1
    mov rsi, input
    mov rdx, LEN
    syscall
    push rsi

    mov rax, 0x1
    mov rdi, 0x1
    mov rsi, print_age
    mov rdx, print_age_len
    syscall
 
    mov rax, 0x1
    mov rdi, 0x1
    pop rsi
    push rax
    mov rdx, LEN
    syscall

    jmp _ret

exit:
    mov rax, 0x3c
    mov rdi, 0x0
    syscall

_ret:
    leave 
    ret