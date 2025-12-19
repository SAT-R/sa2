@echo off

REM Debug version - creates a PDB file
cl /Od /Zi -I ../arena_alloc example_main.c c_header_parser.c ../arena_alloc/arena_alloc.c

REM Release version
REM cl /O2 -I ../arena_alloc example_main.c c_header_parser.c ../arena_alloc/arena_alloc.c
