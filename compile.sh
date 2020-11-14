#!/bin/sh
nasm -f elf64 $1 -o main.o && ld main.o -o main && ./main && rm main.o 
