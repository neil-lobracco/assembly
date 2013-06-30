extern malloc
section .text
global _start
_start:
mov eax,1024
call malloc
