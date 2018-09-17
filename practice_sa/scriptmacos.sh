rm -Rf ./*.o
nasm -f macho -o practice1.o practice1.asm
gcc -m32 -Wall -o start_practice1 practice1.o start_practice1.c
ld -no_pie -e _start -o start_practice1 -arch i386 practice1.o -macosx_version_min 10.7 -lc
