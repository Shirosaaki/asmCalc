[bits 64]

section .text
global my_getnbr

my_getnbr:
    mov rax, 0
    mov r8, 1
    mov r9, rdi
    mov rcx, 0
    cmp byte [r9 + rcx], '-'
    jz .neg

.loop:
    cmp byte [r9 + rcx], 0
    jz .end
    cmp byte [r9 + rcx], '0'
    jl .end
    cmp byte [r9 + rcx], '9'
    jg .end
    mov bl, byte [r9 + rcx]
    sub bl, '0'
    imul rax, rax, 10
    add rax, rbx
    inc rcx
    jmp .loop

.neg:
    neg r8
    inc rcx
    jmp .loop

.end:
    imul rax, r8
    ret