rm -Rf ./*.o
nasm -f macho32 -o practice1.o practice1.asm
gcc -m32  -o start_practice1 practice1.o
ld -no_pie -e _main -o start_practice1 -arch i386 practice1.o -macosx_version_min 10.7 -lc 
