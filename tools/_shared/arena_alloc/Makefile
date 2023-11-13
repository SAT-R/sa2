AR = ar
CC = gcc

SRCS = ArenaAlloc.c

.PHONY: all clean

all: libarena_alloc.a
	@:

%.o: $(SRCS)
	$(CC) -O2 $(SRCS) -static -c $< $(LDFLAGS)

libarena_alloc.a: ArenaAlloc.o
	$(AR) -rcs $@ $<

clean:
	$(RM) ArenaAlloc.o libarena_alloc.a
