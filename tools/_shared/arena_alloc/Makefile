AR = ar
CC = gcc

SOURCE = ArenaAlloc.c

.PHONY: all clean

all: libarena_alloc.a
	@:

# HACK: we have no idea why some environments attempt to build the makefile for these libs
# Makefile.o: ;

%.o: $(SOURCE)
	$(CC) -O2 $(SOURCE) -static -c $< $(LDFLAGS)

libarena_alloc.a: ArenaAlloc.o
	$(AR) -rcs $@ $<

clean:
	$(RM) ArenaAlloc.o libarena_alloc.a
