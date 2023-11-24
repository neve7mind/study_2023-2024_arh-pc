%include 'in_out.asm'
SECTION .data
msg1 db 'Введите x: ', 0h
msg2 db 'Введите a: ', 0h
msg3 db 'Результат: ', 0h

SECTION .bss
x resb 11
a resb 11
res resb 12

SECTION .text
global _start
_start:
; ---------- Вывод сообщения 'Введите x: '
mov eax, msg1
call sprint

; ---------- Ввод 'x'
mov ecx, x
mov edx, 10
call sread

; ---------- Вывод сообщения 'Введите a: '
mov eax, msg2
call sprint

; ---------- Ввод 'a'
mov ecx, a
mov edx, 10
call sread

; ---------- Преобразование 'x' из символа в число
mov eax, x
call atoi ; Вызов подпрограммы перевода символа в число
mov [x], eax ; запись преобразованного числа в 'x'
 
; ---------- Преобразование 'a' из символа в число
mov eax, a
call atoi ; Вызов подпрограммы перевода символа в число
mov [a], eax ; запись преобразованного числа в 'a'

; ---------- Сравниваем 'x' и 'a' (как числа)
mov eax, [a]
mov ecx, [x]
cmp eax, ecx ; Сравниваем 'a' и 'x'
jl add_xa ; если 'a<x', то переход на метку 'add_xa'
mov eax, ecx ; иначе 'eax = x'
mov [res], eax ; 'res = x'
jmp _res

; ---------- Записываем 'a+x' в переменную 'res'
add_xa:
add eax, ecx ; 'eax = eax + ecx = a + x' 
mov [res], eax ; 'res = a + x'
;jmp _res

; ---------- Вывод результата
_res:
mov eax, msg3
call sprint ; Вывод сообщения 'Результат: '
mov eax, [res]
call iprintLF ; Вывод
call quit ; Вызов подпрограммы завершения
