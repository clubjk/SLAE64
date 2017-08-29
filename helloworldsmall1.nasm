global start

section .text

_start:


	;print to screen

	xor rax, rax
	mov al, 1
	mov dil, 1
	mov sil, hello_world
	mov dl, length
	syscall

	;exit gracefully
	mov al, 60
	mov dil, 11
	syscall

section .data

	hello_world: db "Hello World to the SLAE-64 Course",0xa
	length: equ $-hello_world
