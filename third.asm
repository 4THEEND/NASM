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

section .text
    global _start
    
_start:
    jmp prompt

prompt:
    mov rax, 0x1
    mov rdi, 0x1
    mov rsi, age
    mov rdx, age_len   
    syscall
    jmp enter

enter:
    mov rax, 0x0
    mov rdi, 0x1
    mov rsi, input
    mov rdx, LEN
    syscall
    push rsi
    jmp prompt_age

prompt_age:
    mov rax, 0x1
    mov rdi, 0x1
    mov rsi, print_age
    mov rdx, print_age_len
    syscall

    mov rax, 0x1
    mov rdi, 0x1
    pop rsi
    mov rdx, LEN
    syscall
    jmp exit 



exit:
    mov rax, 0x3c
    mov rdi, 0x0
    syscall 

