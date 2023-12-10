ARENA_ALLOC_DIR = ../_shared/arena_alloc/
C_HEADER_PARSER_DIR = ../_shared/c_header_parser/
C_HEADER_PARSER_LIB = $(CSV_CONV_DIR)/libc_header_parser.a
CSV_CONV_DIR = ../_shared/csv_conv/
CSV_CONV_LIB = $(CSV_CONV_DIR)/libcsv_conv.a
RAYLIB_DIR = ext/raylib/src/
RAYLIB_LIB = $(RAYLIB_DIR)/libraylib.a

CC   = gcc
SRCS = src/main.c src/drawing.c src/file_paths.c src/parsing.c src/save.c src/texture.c src/ui.c src/jasc_parser/jasc_parser.c

CFLAGS   = -std=c11 -O2 
INCLUDES = -I src/jasc_parser -I $(RAYLIB_DIR) -I $(CSV_CONV_DIR)
LDFLAGS  = -L $(ARENA_ALLOC_DIR) -L $(RAYLIB_DIR) -L $(C_HEADER_PARSER_DIR) -L $(CSV_CONV_DIR) -larena_alloc -lc_header_parser -lraylib -lcsv_conv -lm -lpthread -ldl

.PHONY: all clean

all: BriBaSA_ex
	@:

BriBaSA_ex: $(SRCS) $(ARENA_ALLOC_LIB) $(RAYLIB_LIB) $(CSV_CONV_LIB)
	$(CC) $(INCLUDES) $(CFLAGS) $(SRCS) -o $@ $(LDFLAGS)

$(ARENA_ALLOC_LIB):
	make -C $(ARENA_ALLOC_DIR)
    
$(C_HEADER_PARSER_LIB):
	make -C $(C_HEADER_PARSER_DIR)
    
$(CSV_CONV_LIB):
	make -C $(CSV_CONV_DIR)

$(RAYLIB_LIB):
	make -C $(RAYLIB_DIR)

clean:
	$(RM) BriBaSA_ex BriBaSA_ex.exe