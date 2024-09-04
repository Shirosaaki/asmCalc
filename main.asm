[bits 64]

section .bss
    buffer resb 256

section .text
global _start
extern my_putnbr
extern my_getnbr
extern my_getlennbr
extern my_putchar

_start:

.loop:
    mov rax, 0
    mov rdi, 0
    mov rsi, buffer
    mov rdx, 256
    syscall
    mov r13, 0
    mov r14, 0
    mov r15, 0

    mov rbx, rax
    mov byte [buffer + rbx], 0

    cmp byte [buffer], 'q'
    je .done

    mov rdi, buffer
    call my_getnbr
    mov r13, rax

    mov rdi, rax
    call my_getlennbr
    mov r14, rax
    mov rdi, buffer
    add rdi, r14
    mov r14, rdi
    add rdi, 1
    call my_getnbr
    mov r15, rax
    
    cmp byte [r14], '+'
    je .add
    cmp byte [r14], '-'
    je .sub
    cmp byte [r14], '*'
    je .mul
    cmp byte [r14], '/'
    je .div

.add:
    xor rax, rax
    mov rax, r13
    add rax, r15
    mov rdi, rax
    call my_putnbr
    jmp .return

.sub:
    xor rax, rax
    mov rax, r13
    sub rax, r15
    mov rdi, rax
    call my_putnbr
    jmp .return

.mul:
    xor rax, rax
    mov rax, r13
    imul rax, r15
    mov rdi, rax
    call my_putnbr
    jmp .return

.div:
    xor rax, rax
    mov rax, r13
    xor rdx, rdx
    div r15
    mov rdi, rax
    call my_putnbr
    jmp .return

.return:
    mov rdi, 10
    call my_putchar
    call my_putchar
    jmp .loop

.done:
    mov rax, 60
    xor rdi, rdi
    syscall