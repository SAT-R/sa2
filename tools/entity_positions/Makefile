PARSER_DIR = ext/c_header_parser

CC = gcc
NO_ERROR = -Wno-error=sign-compare -Wno-error=implicit-function-declaration -Wno-error=unused-parameter -Wno-error=unused-variable

# TODO: Maybe change this:
#       Needs to use -std-gnu11 to use MAP_ANONYMOUS in mmap call in ArenaAlloc.
CFLAGS = -I $(PARSER_DIR) $(NO_ERROR) -Wall -Wextra -Werror -std=gnu11 -O2 -s

.PHONY: all clean


SRCS = epos.c $(PARSER_DIR)/ArenaAlloc.c $(PARSER_DIR)/parser.c

all: epos
	@:

epos: $(SRCS)
	$(CC) $(CFLAGS) $(SRCS) -o $@ $(LDFLAGS)

clean:
	$(RM) epos epos.exe
