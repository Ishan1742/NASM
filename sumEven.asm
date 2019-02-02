section .data
msg1 : db 'Enter a two digit number : '
l1 : equ $-msg1
msg2 : db 'sum of all even numbers is : '
l2 : equ $-msg2
newL : db 10

section .bss
d1 : resb 1
d2 : resb 1
num1 : resw 1
sum1 : resw 1
counter : resw 1
ans1 : resb 1
ans2 : resb 1
ans3 : resb 1
ans4 : resb 1

section .text
global _start:
	_start:
	
	;Print message
	mov eax, 4
	mov ebx, 1
	mov ecx, msg1
	mov edx, l1
	int 80h

	;reading two digits
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

	;num1 = 10*d1 + d2
	sub byte[d1], 30h
	sub byte[d2], 30h

	mov al, byte[d1]
	mov bl, 10
	mul bl
	movzx bx, byte[d2]
	add ax, bx
	mov word[num1], ax

	mov word[counter], 0
	mov word[sum1], 0

	for:
		add word[counter], 2
		mov ax, word[counter]
		cmp ax, word[num1]
		jg Next
		mov ax, word[counter]
		add word[sum1], ax
		mov ax, word[counter]
		cmp ax, word[num1]
		jl for

	Next:	
	mov eax, 4
	mov ebx, 1
	mov ecx, msg2
	mov edx, l2
	int 80h

	;sum1 = abcd
	;get a
	mov dx, 0
	mov ax, word[sum1]
	mov cx, 1000
	div cx
	mov byte[ans1], al
	mov word[sum1], dx
	
	add byte[ans1], 30h
	mov eax, 4
	mov ebx, 1
	mov ecx, ans1
	mov edx, 1
	int 80h

	;get b
	mov dx, 0
	mov ax, word[sum1]
	mov cx, 100
	div cx
	mov byte[ans2], al
	mov word[sum1], dx

	add byte[ans2], 30h
	mov eax, 4
	mov ebx, 1
	mov ecx, ans2
	mov edx, 1
	int 80h

	;get c and d
	mov dx, 0
	mov ax, word[sum1]
	mov cx, 10
	div cx
	mov byte[ans3], al
	mov byte[ans4], dl

	add byte[ans3], 30h
	add byte[ans4], 30h

	mov eax, 4
	mov ebx, 1
	mov ecx, ans3
	mov edx, 1
	int 80h

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

	Exit:
	mov eax, 1
	mov ebx, 0
	int 80h
