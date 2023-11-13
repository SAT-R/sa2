CSV_CONV_DIR = ../_shared/csv_conv
CSV_CONV_LIB = $(CSV_CONV_DIR)/libcsv_conv.a
RAYLIB_DIR = ext/raylib/src
RAYLIB_LIB = $(RAYLIB_DIR)/libraylib.a

CC   = gcc
SRCS = src/main.c src/jasc_parser/jasc_parser.c

CFLAGS   = -std=c11 -O2 
INCLUDES = -I src/jasc_parser -I $(RAYLIB_DIR) -I $(CSV_CONV_DIR)
LDFLAGS  = -L $(RAYLIB_DIR) -lraylib -L $(CSV_CONV_DIR) -lcsv_conv

BriBaSA_ex: $(SRCS) $(RAYLIB_LIB) $(CSV_CONV_LIB)
	$(CC) $(INCLUDES) $(CFLAGS) $(SRCS) -o $@ $(LDFLAGS)

$(CSV_CONV_LIB):
	make -C $(CSV_CONV_DIR)

$(RAYLIB_LIB):
	make -C $(RAYLIB_DIR)
