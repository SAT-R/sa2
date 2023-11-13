C_HEADER_PARSER_DIR = ../c_header_parser

AR = ar
CC = gcc
NO_ERROR = -Wno-error=unused-parameter -Wno-error=unused-variable

SRCS = csv_conv.c
LDFLAGS = -L $(C_HEADER_PARSER_DIR) -lc_header_parser

.PHONY: all clean

all: libcsv_conv.a
	@:

%.o: $(SRCS)
	$(CC) -O2 $(CFLAGS) $< -static -c -o $@ $(LDFLAGS)

libcsv_conv.a: csv_conv.o
	$(AR) -rcs $@ $<

clean:
	$(RM) csv_conv.o libcsv_conv.a
