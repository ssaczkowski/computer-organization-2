rm -Rf ./*.o
nasm -f macho -o practice1.o practice1.asm
ld -no_pie -e _CMAIN -o practice1 -arch i386 practice1.o -macosx_version_min 10.7 -lc
