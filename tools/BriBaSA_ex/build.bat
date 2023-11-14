@echo off

set RL_BUILD_DIR="build/raylib/"

if not exist %RL_BUILD_DIR%/raylib.lib (
	call build_raylib.bat
)

REM Debug
cl -Od -Zi /Fe:BriBaSA_ex.exe /Fo./build/ src/main.c ../_shared/arena_alloc/ArenaAlloc.c ../_shared/c_header_parser/parser.c ../_shared/csv_conv/csv_conv.c -I ../_shared/arena_alloc -I ../_shared/c_header_parser src/jasc_parser/jasc_parser.c -I .src/jasc_parser -I ./ext/raylib/src Winmm.lib gdi32.lib User32.lib Shell32.lib /link ./build/raylib/raylib.lib

REM Optimized
REM cl -O2 /Fe:BriBaSA_ex.exe /Fo./build/ src/main.c ../_shared/arena_alloc/ArenaAlloc.c ../_shared/c_header_parser/parser.c ../_shared/csv_conv/csv_conv.c -I ../_shared/arena_alloc -I ../_shared/c_header_parser src/jasc_parser/jasc_parser.c -I .src/jasc_parser -I ./ext/raylib/src Winmm.lib gdi32.lib User32.lib Shell32.lib /link ./build/raylib/raylib.lib
