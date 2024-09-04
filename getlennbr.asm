[bits 64]

section .text
global my_getlennbr

my_getlennbr:
    mov rax, 0
    cmp rdi, -1
    jle .neg
    cmp rdi, 1
    jl .done
.loop:
    cmp rdi, 1
    jl .done
    inc rax
    mov r8, rax
    mov rax, rdi
    xor rdx, rdx
    mov rcx, 10
    div rcx
    mov rdi, rax
    mov rax, r8
    jmp .loop
.neg:
    neg rdi
    inc rax
    jmp .loop

.done:
    ret