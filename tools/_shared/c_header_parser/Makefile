ARENA_ALLOC_DIR = ../arena_alloc

AR = ar
CC = gcc
NO_ERROR = -Wno-error=unused-parameter -Wno-error=unused-variable

SRCS = c_header_parser.c

CFLAGS = -I $(ARENA_ALLOC_DIR) -Wall -Wextra -Werror $(NO_ERROR) -std=gnu11 -O2

# Clear the default suffixes
.SUFFIXES:

.PHONY: all clean

all: libc_header_parser.a
	@:

%.o: $(SRCS)
	$(CC) -O2 $(CFLAGS) $< -static -c -o $@ $(LDFLAGS)

libc_header_parser.a: c_header_parser.o
	$(AR) -rcs $@ $<

clean:
	$(RM) c_header_parser.o libc_header_parser.a
