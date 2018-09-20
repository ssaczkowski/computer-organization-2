rm -Rf ./*.o
nasm -f macho -o _printNumber.o _printNumber.asm
gcc -m32 -Wall -o startprint.exe _printNumber.o start_print.c
