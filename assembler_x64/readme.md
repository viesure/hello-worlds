# Assembler x64 Hello World

## Requirements

- 64bit Linux (tested on ubuntu 20.04)
- Nasm

## Setup
- `Install nasm, linker and httpie: sudo apt-get install nasm binutils httpie`

## Hello World
1. Compile: nasm -f elf64 hello_world.asm -o hello_world.o
2. Link: ld hello_world.o -o hello_world
3. Run: ./hello_world

Output: `Hello world!`

## Hello World Rest
1. Set NASM environment: `EXPORT NASMENV=-I/~/linux-nasm/install/includes/`
2. Compile: nasm "-felf64" hello_rest.asm -l hello_rest.lst -o hello_rest.o
3. Link: ld -s -melf_x86_64 -o hello_rest hello_rest.o
4. ./hello_rest

- After successful binding socket:
```
Starting...
Rest-endpoint is running...
```

- `http localhost:9000/hello-world`

Output: 
```
HTTP/1.1 200 OK
Content-Type: application/json
{"hello": world}
```
