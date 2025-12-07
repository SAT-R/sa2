AR = ar
CC = gcc

SOURCE = arena_alloc.c

# Clear the default suffixes
.SUFFIXES:

.PHONY: all clean

all: libarena_alloc.a
	@:

%.o: $(SOURCE)
	$(CC) -O2 -std=gnu11 $(SOURCE) -static -c $< $(LDFLAGS)

libarena_alloc.a: arena_alloc.o
	$(AR) -rcs $@ $<

clean:
	$(RM) arena_alloc.o libarena_alloc.a
