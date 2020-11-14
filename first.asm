BITS 64

section .bss
    a resb 256

section .data
    hello db `L'assembleur c'est trop galère\n`
    hello_len equ $-hello

section .text
    global _start
    
_start:
    mov rax, 1  ;syscall pour afficher à l'écran
    mov rdi, 1
    mov rsi, hello
    mov rdx, hello_len
    
    syscall ;passe la main au kernel
    
    mov rax, 123
    mov [a], rax
    mov rax, 60 ;syscall pour exit programme
    mov rdi, 0
    syscall 

