ARENA_ALLOC_DIR = ../arena_alloc

AR = ar
CC = gcc
NO_ERROR = -Wno-error=unused-parameter -Wno-error=unused-variable -Wno-error=unused-command-line-argument

SRCS = parser.c

CFLAGS = -I $(ARENA_ALLOC_DIR) -Wall -Wextra -Werror $(NO_ERROR) -std=gnu11 -O2
LDFLAGS = -L $(ARENA_ALLOC_DIR) 

.PHONY: all clean

all: libc_header_parser.a
	@:

%.o: $(SRCS)
	$(CC) -O2 $(CFLAGS) $< -static -c -o $@ $(LDFLAGS)

libc_header_parser.a: parser.o
	$(AR) -rcs $@ $<

clean:
	$(RM) parser.o libc_header_parser.a
