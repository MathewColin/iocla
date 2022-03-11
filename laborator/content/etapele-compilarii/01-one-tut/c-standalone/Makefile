CFLAGS = -fno-PIC -m32 -g
LDEFLAGS = -nostdinc -nostdlib -no-pie -m elf_i386
LDFLAGS = -nostdinc -nostdlib -no-pie -m32
AS = nasm
ASFLAGS = -f elf32
OBJ = hello.o start.o puts.o

.DEFAULT_GOAL: all

.PHONY: all clean

all: hello

hello: hello.o start.o puts.o
	ld $(LDEFLAGS) hello.o start.o puts.o -o hello

hello.o:
	gcc $(CFLAGS) -c hello.c -o hello.o

start.o: start.asm
	$(AS) $(ASFLAGS) -o $@ $<

puts.o: puts.asm
	$(AS) $(ASFLAGS) -o $@ $<

clean:
	-rm -f hello hello.o start.o puts.o
	-rm -f *~
