section .data
msg1 : db 'Enter a two digit number : '
l1 : equ $-msg1
msg2 : db 'Number of times divisible : '
l2 : equ $-msg2
newL : db 10

section .bss
d1 : resb 1
d2 : resb 1
num1 : resb 1
counter : resb 1
ans1 : resb 1

section .text
global _start:
	_start:

	mov eax, 4
	mov ebx, 1
	mov ecx, msg1
	mov edx, l1
	int 80h

	mov eax, 3
	mov ebx, 1
	mov ecx, d1
	mov edx, 1
	int 80h

	mov eax, 3
	mov ebx, 1
	mov ecx, d2
	mov edx, 1
	int 80h

	sub byte[d1], 30h
	sub byte[d2], 30h

	mov al, byte[d1]
	mov bl, 10
	mul bl	
	movzx bx, byte[d2]
	add ax, bx
	mov byte[num1], al

	mov byte[counter], 0
	for:
		movzx ax, byte[num1]
		cmp ax, 0
		je endLoop
		mov bl, 2
		div bl
		cmp ah, 1
		je endLoop
		mov byte[num1], al
		add byte[counter], 1
		jmp for
	
	endLoop:
	mov eax, 4
	mov ebx, 1
	mov ecx, msg2
	mov edx, l2
	int 80h

	add byte[counter], 30h
	mov eax, 4
	mov ebx, 1
	mov ecx, counter
	mov edx, 1
	int 80h

	mov eax, 4
	mov ebx, 1
	mov ecx, newL
	mov edx, 1
	int 80h

	mov eax, 1
	mov ebx, 0
	int 80h
