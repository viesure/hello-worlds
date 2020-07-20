# Brainfuck Hello World
Repository contains two files
* short-hello-world.b
  * taken from https://esolangs.org/wiki/Hello_world_program_in_esoteric_languages
* hello-world.b
  * my own attempt at hello world

## How to execute
Easy to use bash interpreter: https://github.com/Crestwave/brainbash


## Explanation
I used a loop to prefill 5 memory slots for easier access to the neeeded chars.
The loop created the following memory snapshot:

`00000:  000  070  100  110  030  090  100`

The chars are printed by incremeting decrementing the pointers.
