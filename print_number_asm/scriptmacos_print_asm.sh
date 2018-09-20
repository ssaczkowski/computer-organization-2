rm -Rf ./*.o
nasm -f macho32 -o _printNumber.o _printNumber.asm
gcc -m32  -o _printNumber _printNumber.o
