section .data
    prompt db "Enter the first term: ", 0
    prompt2 db "Enter the common difference: ", 0
    prompt3 db "Enter the number of terms: ", 0
    result db "Sum of the arithmetic sequence: ", 0
    format db "%lf", 0
    newline db 10, 0

section .bss
    firstTerm resq 1
    commonDifference resq 1
    numTerms resq 1
    sum resq 1

section .text
    global _start

_start:
    ; Prompt for and read the first term
    mov rdi, 1
    mov rsi, prompt
    mov rdx, 24
    call input

    ; Parse the first term as a double
    mov rdi, firstTerm
    mov rsi, format
    call parse_double

    ; Prompt for and read the common difference
    mov rsi, prompt2
    call input
    mov rdi, commonDifference
    call parse_double

    ; Prompt for and read the number of terms
    mov rsi, prompt3
    call input
    mov rdi, numTerms
    call parse_double

    ; Calculate the sum of the arithmetic sequence
    movq xmm0, [firstTerm]
    movq xmm1, [commonDifference]
    movq xmm2, [numTerms]
    cvtsi2sd xmm1, xmm1
    cvtsi2sd xmm2, xmm2
    mulsd xmm1, xmm2
    mulsd xmm2, xmm2
    mulsd xmm0, xmm2
    addsd xmm0, xmm1
    divsd xmm0, [rdi]
    movq [sum], xmm0

    ; Display the result
    mov rdi, 1
    mov rsi, result
    mov rdx, 30
    call print_string
    mov rdi, [sum]
    call print_double

    ; Exit
    mov rax, 60         ; sys_exit
    xor rdi, rdi        ; return code 0
    syscall

; Input function
input:
    mov rax, 0          ; sys_read
    syscall
    ret

; Print a string
print_string:
    mov rax, 1          ; sys_write
    syscall
    ret

; Parse a double from input
parse_double:
    mov rax, 0          ; Clear RAX
    mov rcx, 0          ; Clear RCX
.loop:
    movzx rsi, byte [rdi + rcx]  ; Load the next character
    test rsi, rsi
    jz .found_end
    cmp rsi, 45         ; Check for minus sign
    je .process_minus
    cmp rsi, 46         ; Check for decimal point
    je .process_decimal
    sub rsi, 48          ; Convert ASCII to integer
    imul rax, rax, 10
    add rax, rsi
    inc rcx
    jmp .loop
.process_minus:
    inc rcx
    jmp .loop
.process_decimal:
    inc rcx
    mov r8, 0            ; Initialize fractional part
.frac_loop:
    movzx rsi, byte [rdi + rcx]
    test rsi, rsi
    jz .found_end
    sub rsi, 48
    imul r8, r8, 10
    add r8, rsi
    inc rcx
    jmp .frac_loop
.found_end:
    mov r9, 1.0
    mov r10, r8
    mov r11, 1.0
    mov r12, 1
    .fraction_loop:
    div r11
    add r9, r10
    imul r11, 10
    inc r12
    cmp r12, rcx
    jl .fraction_loop
    cvtsi2sd xmm1, r9
    mov r8, rax
    movsd qword [rdi], xmm1
    ret

; Print a double
print_double:
    mov rax, 1          ; sys_write
    lea rsi, [rdi]      ; Load the double to print
    mov rdx, 15         ; Number of decimal places to print
    syscall
    ret
