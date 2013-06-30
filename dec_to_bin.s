section .data
sstring db "Enter a number in decimal",10
lenss equ $ - sstring
rstring db "That number in binary is: "
lenrs equ $ - rstring
estring db "That is not a number.",10
lenes equ $ - estring
buf: times 64 db 0
buf2: times 64 db 0
section .text
global _start
start:
mov eax, 4
mov ebx, 1
mov ecx, sstring
mov edx, lenss
int 80h
mov eax, 3
mov ebx, 0
mov ecx, buf
mov edx, 64
int 80h
mov ecx, 0
mov edx, 0
_loop:
cmp ecx, eax
je done
add ecx, buf
cmp [byte ecx], byte 48
jl error
cmp [byte ecx], byte 57
jg error
mov ebx, [byte ecx]
sub ebx, 48
add edx, ebx
sub ecx, buf
jmp _loop
error:
mov eax, 4
mov ebx, 1
mov ecx, estring
mov edx, lenes
int 80h
mov eax, 1
mov ebx, 1
int 80h
done:
mov ecx, buf2
mov eax, 1
loop2:
cmp eax, edx
jg done_with_second
push edx
mov ebx, eax
mov ax,0
push edx
pop dx
div word 2
cmp dx,0
cmp edx, eax
je dosub
mov [byte ecx],byte 48
jmp it_done
dosub:
sub dx, eax
mov [byte ecx], byte 49
it_done:
mov edx, dx
inc ecx
add eax,eax
jmp loop2
done_with_second:
sub ecx, buf2
mov eax, 4
mov ebx, 1
push ecx
mov ecx, buf2
pop edx
int 80h
mov eax, 1
mov ebx, 0
int 80h
