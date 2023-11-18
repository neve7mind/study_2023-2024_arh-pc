%include 'in_out.asm' ; подключение внешнего файла
SECTION .data
    msg_str: 
        DB 'Введите значение переменной: ',0
    res_str:
        DB 'Результат: ',0
SECTION .bss
    x:
        RESB 16 ; Задаём переменную x
SECTION .text
GLOBAL _start
_start:
; ---- Вычисление выражения
    mov eax, msg_str ; string addr
    call sprintLF    ; print string

    mov edx, 15      ; buffer size
    mov ecx, x       ; buffer addr
    call sread       ; read string from stdin to buffer

    mov eax,x        ; string addr
    call atoi        ; convert to integer
    
    xor edx, edx     ; move edx, 0 (обнуление)
    mov ebx, 3
    div ebx          ; div eax, ebx ( by 3 )

    add eax, 5       ; plus 5

    mov ebx, 7       ;
    mul ebx          ; mul eax, ebx (7)
    mov edi, eax     ; save eax to edi

; ---- Вывод результата на экран
    mov eax, res_str ; 
    call sprint      ; print 'Результат: '
    mov eax, edi     ; restore eax
    call iprintLF    ; print eax as string
    call quit        ; exit

