ARENA_ALLOC_DIR = ../_shared/arena_alloc/
PARSER_DIR      = ../_shared/c_header_parser/
CSV_CONV_DIR    = ../_shared/csv_conv/
ARENA_ALLOC_LIB = $(ARENA_ALLOC_DIR)libarena_alloc.a 
PARSER_LIB      = $(PARSER_DIR)libc_header_parser.a 
CSV_CONV_LIB    = $(CSV_CONV_DIR)/libcsv_conv.a

LIB_OBJS = $(ARENA_ALLOC_LIB) $(PARSER_LIB) $(CSV_CONV_LIB)

CC = gcc
NO_ERROR = -Wno-error=sign-compare -Wno-error=implicit-function-declaration -Wno-error=unused-parameter -Wno-error=unused-variable

# TODO: Maybe change this:
#       Needs to use -std-gnu11 to use MAP_ANONYMOUS in mmap call in ArenaAlloc.
CFLAGS = -I $(PARSER_DIR) -I $(CSV_CONV_DIR) -Wall -Wextra -Werror $(NO_ERROR) -std=gnu11 -O2
LDFLAGS = -L$(ARENA_ALLOC_DIR) -L$(PARSER_DIR) -L $(CSV_CONV_DIR) -lcsv_conv -lc_header_parser -larena_alloc 

.PHONY: all clean


SRCS = entity_positions.c

all: entity_positions
	@:

entity_positions: $(SRCS) $(LIB_OBJS)
	$(CC) $(CFLAGS) $(SRCS) -o $@ $(LDFLAGS)

$(ARENA_ALLOC_LIB):
	make -C ../_shared/arena_alloc

$(PARSER_LIB):
	make -C ../_shared/c_header_parser

$(CSV_CONV_LIB):
	make -C ../_shared/csv_conv

clean:
	$(RM) entity_positions entity_positions.exe
