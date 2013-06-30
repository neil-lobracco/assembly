section .data		
msg     db      "Hello World!",0xa	
len     equ     $ - msg         
section .text	
global _start
_start:
mov	ecx,0
_loop:
add ecx, msg
mov     edx,1
mov     ebx,1 
mov     eax,4
int     0x80
sub ecx, msg
inc ecx
mov eax,len
cmp ecx,eax
jl _loop
mov	ebx,0
mov     eax,1
int     0x80
