; Linux x64 hello world 
; Install nasm and linker: sudo apt-get install nasm binutils
; Compile: nasm -f elf64 hello_world.asm -o hello_world.o
; Link: ld hello_world.o -o hello_world
; Run: ./hello_world

SECTION .DATA
	hello:     db 'Hello world!',10
	helloLen:  equ $-hello

SECTION .TEXT
	GLOBAL _start 

_start:
	mov eax,4            ; 'write' system call = 4
	mov ebx,1            ; file descriptor 1 = STDOUT
	mov ecx,hello        ; string to write
	mov edx,helloLen     ; length of string to write
	int 80h              ; call interrupt to execute systemcall

	; Exist gracefully :)
	mov eax,1            ; 'exit' system call = 1
	mov ebx,0            ; exit with error code 0
	int 80h              ; call interrupt