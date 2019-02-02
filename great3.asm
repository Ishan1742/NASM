section .data
msg1 : db 'Enter 1st 2digit number : '
l1 : equ $-msg1
msg2 : db 'Enter 2nd 2digit number : '
l2 : equ $-msg2
msg3 : db 'Enter 3rd 2digit number : '
l3 : equ $-msg3
msg4 : db 'Largest of the 3 is : '
l4 : equ $-msg4
newL : db 10

section .bss
d1 : resb 1
d2 : resb 1
num1 : resb 1
num2 : resb 1
num3 : resb 1
ans1 : resb 1
ans2 : resb 1
junk : resb 1

section .text
global _start:
	_start:

	mov eax, 4
	mov ebx, 1
	mov ecx, msg1
	mov edx, l1
	int 80h

	mov eax, 3
	mov ebx, 0
	mov ecx, d1
	mov edx, 1
	int 80h

	mov eax, 3
	mov ebx, 0
	mov ecx, d2
	mov edx, 1
	int 80h

	mov eax, 3
	mov ebx, 0
	mov ecx, junk
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

	mov eax, 4
	mov ebx, 1
	mov ecx, msg2
	mov edx, l2
	int 80h

	mov eax, 3
	mov ebx, 0
	mov ecx, d1
	mov edx, 1
	int 80h

	mov eax, 3
	mov ebx, 0
	mov ecx, d2
	mov edx, 1
	int 80h

	mov eax, 3
	mov ebx, 0
	mov ecx, junk
	mov edx, 1
	int 80h

	sub byte[d1], 30h
	sub byte[d2], 30h

	mov al, byte[d1]
	mov bl, 10
	mul bl
	movzx bx, byte[d2]
	add ax, bx
	mov byte[num2], al

	mov eax, 4
	mov ebx, 1
	mov ecx, msg3
	mov edx, l3
	int 80h

	mov eax, 3
	mov ebx, 0
	mov ecx, d1
	mov edx, 1
	int 80h

	mov eax, 3
	mov ebx, 0
	mov ecx, d2
	mov edx, 1
	int 80h

	mov eax, 3
	mov ebx, 0
	mov ecx, junk
	mov edx, 1
	int 80h

	sub byte[d1], 30h
	sub byte[d2], 30h

	mov al, byte[d1]
	mov bl, 10
	mul bl
	movzx bx, byte[d2]
	add ax, bx
	mov byte[num3], al

	mov al, byte[num1]
	cmp byte[num2], al
	jg TwoGreater

	OneGreater:
	mov al, byte[num1]
	cmp byte[num3], al
	jg ThreeGreatest

	jmp printNum1

	ThreeGreatest:
	jmp printNum3

	TwoGreater:
	mov al, byte[num2]
	cmp byte[num3], al
	jg ThreeGreatest

	jmp printNum2

	printNum1:
	movzx ax, byte[num1]
	mov bl, 10
	mov ah, 0
	div bl
	add al, 30h
	add ah, 30h
	mov byte[ans1], al
	mov byte[ans2], ah

	mov eax, 4
	mov ebx, 1
	mov ecx, msg4
	mov edx, l4
	int 80h

	mov eax, 4
	mov ebx, 1
	mov ecx, ans1
	mov edx, 1
	int 80h

	mov eax, 4
	mov ebx, 1
	mov ecx, ans2
	mov edx, 1
	int 80h

	jmp Exit

	printNum2:
	movzx ax, byte[num2]
	mov bl, 10
	mov ah, 0
	div bl
	add al, 30h
	add ah, 30h
	mov byte[ans1], al
	mov byte[ans2], ah

	mov eax, 4
	mov ebx, 1
	mov ecx, msg4
	mov edx, l4
	int 80h

	mov eax, 4
	mov ebx, 1
	mov ecx, ans1
	mov edx, 1
	int 80h

	mov eax, 4
	mov ebx, 1
	mov ecx, ans2
	mov edx, 1
	int 80h

	jmp Exit


	printNum3:
	movzx ax, byte[num3]
	mov bl, 10
	mov ah, 0
	div bl
	add al, 30h
	add ah, 30h
	mov byte[ans1], al
	mov byte[ans2], ah

	mov eax, 4
	mov ebx, 1
	mov ecx, msg4
	mov edx, l4
	int 80h

	mov eax, 4
	mov ebx, 1
	mov ecx, ans1
	mov edx, 1
	int 80h

	mov eax, 4
	mov ebx, 1
	mov ecx, ans2
	mov edx, 1
	int 80h

	jmp Exit

	Exit:
	mov eax, 4
	mov ebx, 1
	mov ecx, newL
	mov edx, 1
	int 80h

	mov eax, 1
	mov ebx, 0
	int 80h
