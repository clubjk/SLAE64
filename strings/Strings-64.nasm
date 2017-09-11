; Filename: Strings-64.nasm
; Author:  Vivek Ramachandran
; Website:  http://securitytube.net
; Training: http://securitytube-training.com 
;
;
; Purpose: String Operations in 64-bit CPU

global _start			

section .text
_start:

	; Movsb/w/d/q
	; Memory to Memory 
	cld                   ;clear direction so copy increments forward
	lea rsi, [HelloWorld] ;move the address of the HelloWorld variable into rsi 
	lea rdi, [Copy]       ;move the address of the Copy variable into rdi
	movsq                 ;Move qword (8 bytes) from address RSI to RDI.

	cld                   ;clear direction so copy increments forward direction
	lea rsi, [HelloWorld] ;move the address of HelloWorld variable in rsi
	xor rax, rax          ;zeroize the rax
	mov qword [Copy], rax ;move the rax value (0) to the 8 byte address of the Copy variable
	lea rdi, [Copy]       ;move the address of the Copy variable into rdi
	mov rcx, len          ;move the value of len into rcx
	rep movsb             ;move byte from address of RSI into RDI; repeat until rcx dec's to zero


	; stosb/w/d/q
	; Register to Memory 

	mov rax, 0x0123456789abcdef
	lea rdi, [var1]
	stosq

	; lodsb/w/d/q 
	; Memory to Register 

	xor rax, rax 
	lea rsi, [var1]
	lodsq

		
	; exit the program gracefully  

	mov rax, 0x3c
	mov rdi, 0		
	syscall


section .data

	HelloWorld:	db	"Hello World"
	len:	equ	$-HelloWorld

section .bss

	Copy:	resb	len
	var1:	resb	8

	
