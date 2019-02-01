section .data
msg1 : db 'System is Big Endian', 10
l1 : equ $-msg1
msg2 : db 'System is Little Endian', 10
l2 : equ $-msg2

section .bss
num1 : resd 1

section .text
global _start:
	_start:
	
	mov dword[num1], 76543210h

	mov al, byte[num1]

	cmp al, 10h
	je LitEnd

	mov eax, 4
	mov ebx, 1
	mov ecx, msg1
	mov edx, l1
	int 80h

	jmp Exit
	
	LitEnd:
	mov eax, 4
	mov ebx, 1
	mov ecx, msg2
	mov edx, l2
	int 80h

	Exit:
	mov eax, 1
	mov ebx, 0
	int 80h 
