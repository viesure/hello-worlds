; Linux x64 basic rest endpoint
; Compile: nasm "-felf64" hello_rest.asm -l hello_rest.lst -o hello_rest.o
; Link: ld -s -melf_x86_64 -o hello_rest hello_rest.o
; Set NASM environment: EXPORT NASMENV=-I/home/nico/repos/linux-nasm/install/includes/
 
bits 64
[list -]
      %include "unistd.inc"
      %include "sys/wait.inc"
      %include "sys/socket.inc"
[list +]

section .bss
    sockfd:             resq 1
    sock_addr:          resq 1
 
section .data   
    server_listening:   db "Rest-endpoint is running..."
    .length:            equ $-server_listening
    lf:                 db 10
    trying:             db  "Starting..."
    trying.length:      equ $-trying     
    buffer:  times 1024 db 0 ; client request buffer
    .length: equ $-buffer
    reply:               
        db 'HTTP/1.1 200 OK',10  
        db 'Content-Type: application/json',10        
        db '{"hello":world}',10  
        db 0
    reply.length:   equ $-reply
    socketerror:    db  "socketerror", 10
    .length:        equ $-socketerror
    listenerror:    db  "listenerror", 10
    .length:        equ $-listenerror
    port:           db  35,40           ; port 9000 (256 * 35 + 40)
    
section .text
    global _start
 
_start:
    push    rax                         ;restore stack
    ;create a socket
    syscall socket,PF_INET,SOCK_STREAM,IPPROTO_IP
    cmp     rax, 0
    jz      .socketerror
    mov     qword[sockfd], rax
    ;fill in sock_addr structure on stack
    xor     r8,r8                       ;INADDR_ANY = 0
    push    r8                          ;push r8 to the stack
    push    word [port]                 ;port number
    push    word AF_INET                ;protocol argument
    mov     qword[sock_addr],rsp        ;Save the sock_addr_in
;bind the socket to the address, keep trying until we succeed.
    syscall write,stdout,trying,trying.length
.tryagain: 
    syscall bind,qword[sockfd],qword[sock_addr],16
    and     rax, rax
    jnz     .tryagain
.bindsuccess:
    ; end the previous line with LF
    syscall write,stdout,lf,1
    syscall listen,qword[sockfd],0
    and     rax,rax
    jnz     .listenerror
    ; print rest-endpoint running message
    mov     rsi,server_listening
    mov     rdx,server_listening.length
    mov     rdi,STDOUT
    mov     rax,SYS_WRITE
    syscall
.acceptloop:
    syscall accept,qword[sockfd],0,0
    test     rax,rax
    js      .acceptloop
    mov     r12,rax                    ;use the accept socket from here
    ;two waits to prevent zombie processes
    syscall wait4,-1,0,WNOHANG,0
    syscall wait4,-1,0,WNOHANG,0

    ;accept a connection, fork child process, while the parent process
    ;waits to accept other connections.
    syscall fork
    and     rax, rax
    jz      .serveclient                ;child continues here
    ;parent closes the connection
    syscall close,r12
    jmp     .acceptloop                 ;and go back to accept new incoming connections
 
.serveclient:
    ;put client request in buffer
    syscall read,r12,buffer,buffer.length
    ;the actual read bytes are stored in rax
    syscall write,stdout,buffer,rax
    ;additional end of line
    syscall write,stdout,lf,1   
    ;send the reply to the client
    syscall write,r12,reply,reply.length
    syscall close,r12
    ;exit child process
    syscall exit,0
; the errors
.listenerror:
    mov     rsi,listenerror
    mov     rdx,listenerror.length
    jmp     .print
.socketerror:
    mov     rsi,socketerror
    mov     rdx,socketerror.length
.print:
    syscall write,stdout
.exit:
    syscall exit,0
