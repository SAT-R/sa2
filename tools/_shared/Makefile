all: libarena_alloc.a libc_header_parser.a libcsv_conv.a
	@:

libarena_alloc.a:
	@$(MAKE) -d -C arena_alloc

libc_header_parser.a:
	@$(MAKE) -d -C c_header_parser

libcsv_conv.a:
	@$(MAKE) -d -C csv_conv

clean:
	@$(MAKE) clean -C arena_alloc
	@$(MAKE) clean -C c_header_parser
	@$(MAKE) clean -C csv_conv
