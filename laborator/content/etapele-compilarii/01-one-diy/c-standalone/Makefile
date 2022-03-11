CFLAGS = -fno-PIC -m32 -g
LDEFLAGS = -nostdinc -nostdlib -no-pie -m elf_i386
LDFLAGS = -nostdinc -nostdlib -no-pie -m32
AS = nasm
ASFLAGS = -f elf32
OBJ = name.o start.o puts.o

.DEFAULT_GOAL: all

.PHONY: all clean

all: name

name: name.o start.o puts.o
	ld $(LDEFLAGS) name.o start.o puts.o -o name

name.o:
	gcc $(CFLAGS) -c name.c -o name.o

start.o: start.asm
	$(AS) $(ASFLAGS) -o $@ $<

puts.o: puts.asm
	$(AS) $(ASFLAGS) -o $@ $<

clean:
	-rm -f name name.o start.o puts.o
	-rm -f *~
