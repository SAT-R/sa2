CSV_CONV_DIR = ../csv_conv

AR = ar
CC = gcc
NO_ERROR = -Wno-error=unused-parameter -Wno-error=unused-variable

SRCS = csv_conv.c

CFLAGS = -I $(CSV_CONV_DIR) -Wall -Wextra -Werror $(NO_ERROR) -std=gnu11 -O2
LDFLAGS = 

# Clear the default suffixes
.SUFFIXES:

.PHONY: all clean

all: libcsv_conv.a
	@:

%.o: $(SRCS)
	$(CC) -O2 $(CFLAGS) $< -static -c -o $@ $(LDFLAGS)

libcsv_conv.a: csv_conv.o
	$(AR) -rcs $@ $<

clean:
	$(RM) csv_conv.o libcsv_conv.a
