rm -Rf practice1.o
rm -Rf start_practice1
nasm -f macho32 -o practice1.o practice1.asm
gcc -m32  -o start_practice1 practice1.o start_practice1.c
