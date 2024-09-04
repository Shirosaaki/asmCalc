[bits 64]
section .data
    msg db "-100"
section .text
global _start
extern my_putnbr
extern my_getnbr
_start:
    mov rdi, msg
    call my_getnbr
    mov rdi, rax
    call my_putnbr
    mov rax, 60
    xor rdi, rdi
    syscall