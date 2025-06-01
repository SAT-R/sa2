AR = ar
CC = gcc

SOURCE = ArenaAlloc.c

# Clear the default suffixes
.SUFFIXES:

.PHONY: all clean

all: libarena_alloc.a
	@:

%.o: $(SOURCE)
	$(CC) -O2 -std=gnu11 $(SOURCE) -static -c $< $(LDFLAGS)

libarena_alloc.a: ArenaAlloc.o
	$(AR) -rcs $@ $<

clean:
	$(RM) ArenaAlloc.o libarena_alloc.a
