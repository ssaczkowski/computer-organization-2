rm -Rf ./*.o
nasm -f macho32 -o practice1_lme_macos.o practice1_lme_macos.asm
gcc -m32  -o practice1_lme_macos practice1_lme_macos.o
ld -no_pie -e _main -o mainpractice1_lme_macos -arch i386 practice1_lme_macos.o -macosx_version_min 10.7 -lc
