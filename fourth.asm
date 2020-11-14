BITS 64

section .data
    grand db 'input > 10', 0xa, 0x0
    grand_len equ $ - grand

    equal db 'input = 10', 0xa, 0x0
    equal_len equ $ - equal

    petit db 'input < 10', 0xa, 0x0
    petit_len equ $ - petit

section .text
    global _start

_start:
    mov rax, 10
    cmp rax, 0xa
    je egal
    jl less
    ja big


big:
    mov rax, 0x1
    mov rdi, 0x1
    mov rsi, grand
    mov rdx, grand_len   
    syscall
    jmp exit

less:
    mov rax, 0x1
    mov rdi, 0x1
    mov rsi, petit
    mov rdx, petit_len   
    syscall
    jmp exit


egal:
    mov rax, 0x1
    mov rdi, 0x1
    mov rsi, equal
    mov rdx, equal_len   
    syscall
    jmp exit


exit:
    mov rax, 0x3c
    mov rdi, 0x0
    syscall 
