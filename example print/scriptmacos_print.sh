rm -Rf ./*.o
nasm -f macho -o print.o print.asm
gcc -m32 -Wall -o startprint.exe print.o start_print.c
ld -no_pie -e _start -o startprint -arch i386 print.o -macosx_version_min 10.7 -lc
