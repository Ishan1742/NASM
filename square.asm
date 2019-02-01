section .data
msg1 : db 'Enter a two digit number : '
l1 : equ $-msg1
msg2 : db 'Square of the number is : '
l2 : equ $-msg2
newL : db 10

section .bss
d1 : resb 1
d2 : resb 1
num1 : resw 1
ans1 : resb 1
ans2 : resb 1
ans3 : resb 1
ans4 : resb 1

extern printf
section .text
global _start:
	_start:

	;Print message
	mov eax, 4
	mov ebx, 1
	mov ecx, msg1
	mov edx, l1
	int 80h

	;Read first digit
	mov eax, 3
	mov ebx, 0
	mov ecx, d1
	mov edx, 1
	int 80h
	
	;Read second digit
	mov eax, 3
	mov ebx, 0
	mov ecx, d2
	mov edx, 1
	int 80h

	;Get the actual numbers from their ascii values
	sub byte[d1], 30h
	sub byte[d2], 30h

	;num = 10*d1 + d2
	mov al, byte[d1]
	mov bl, 10
	mul bl
	movzx bx, byte[d2]
	add ax, bx
	mov word[num1], ax

	;num1 = num1*num1
	mov ax, word[num1]
	mov bx, word[num1]
	mul bx
	mov word[num1], ax

	;Print
	mov eax, 4
	mov ebx, 1
	mov ecx, msg2
	mov edx, l2
	int 80h

	;num1 = abcd, then get digit a
	mov dx, 0
	mov ax, word[num1]
	mov cx, 1000
	div cx

	mov byte[ans1], al
	mov word[num1], dx	

	;print digit a
	add byte[ans1], 30h	
	mov eax, 4
	mov ebx, 1
	mov ecx, ans1
	mov edx, 1
	int 80h

	;get b
	mov dx, 0
	mov ax, word[num1]
	mov cx, 100
	div cx

	mov byte[ans2], al
	mov word[num1], dx

	add byte[ans2], 30h
	mov eax, 4
	mov ebx, 1
	mov ecx, ans2
	mov edx, 1
	int 80h
	
	;get c
	mov dx, 0
	mov ax, word[num1]
	mov cx, 10
	div cx

	mov byte[ans3], al
	mov word[num1], dx

	add byte[ans3], 30h
	mov eax, 4
	mov ebx, 1
	mov ecx, ans3
	mov edx, 1
	int 80h
	
	;get d
	mov al, byte[num1]
	mov byte[ans4], al

	add byte[ans4], 30h
	mov eax, 4
	mov ebx, 1
	mov ecx, ans4
	mov edx, 1
	int 80h

	mov eax, 4
	mov ebx, 1
	mov ecx, newL
	mov edx, 1
	int 80h
	
	
	;exit
	mov eax, 1
	mov ebx, 0
	int 80h
