@echo off

REM Debug version - creates a PDB file
cl /Od /Zi -I ../arena_alloc example_main.c parser.c ../arena_alloc/ArenaAlloc.c

REM Release version
REM cl /O2 -I ../arena_alloc example_main.c parser.c ../arena_alloc/ArenaAlloc.c
