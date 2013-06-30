section .data
saystring db "Say something kid.", 10
lenss equ $ - saystring
hstring db "You said: "
lenhs equ $ - hstring
buf: times 64 db 0
section .text
global _start
start:
mov eax,4
mov ebx,1
mov ecx, saystring
mov edx, lenss
int 80h
mov eax, 3
mov ebx, 0
mov ecx,buf
mov edx, 64
int 80h
mov ecx, 0
dec eax
_loop:
cmp ecx, eax
je done
add ecx, buf
cmp [byte ecx], byte 65
jl it_done
cmp [byte ecx], byte 122
jg it_done
cmp [byte ecx], byte 97
jge is_lower
cmp [byte ecx], byte 90
jg it_done
jmp is_upper
is_lower:
sub [byte ecx], byte 32
jmp it_done
is_upper:
add [byte ecx], byte 32
it_done:
sub ecx, buf
inc ecx
jmp _loop
done:
add ecx, buf
mov [byte ecx], byte 10
inc  ecx
mov [byte ecx], byte 0
inc eax
add eax, lenhs
push eax
mov eax, 4
mov ebx, 1
pop edx
mov ecx, hstring
int 80h
mov eax, 1
mov ebx, 0
int 80h
