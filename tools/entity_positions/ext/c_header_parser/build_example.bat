@echo off

REM Debug version - creates a PDB file
cl /Od /Zi example_main.c parser.c ArenaAlloc.c

REM Release version
REM cl /O2 example_main.c parser.c ArenaAlloc.c
