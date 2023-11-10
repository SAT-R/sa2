@echo off

set RL_BUILD_DIR="build/raylib/"

if not exist %RL_BUILD_DIR%/raylib.lib (
	call build_raylib.bat
)

REM Debug
cl -Od -Zi /Fe:BriBaSA_ex.exe /Fo./build/ src/main.c src/jasc_parser/jasc_parser.c src/c_header_parser/ArenaAlloc.c src/c_header_parser/parser.c -I .src/c_header_parser -I .src/jasc_parser -I ./ext/raylib/src Winmm.lib gdi32.lib User32.lib Shell32.lib /link ./build/raylib/raylib.lib

REM Optimized
REM cl -O2 /Fe:BriBaSA_ex.exe /Fo./build/ src/main.c src/jasc_parser/jasc_parser.c src/c_header_parser/ArenaAlloc.c src/c_header_parser/parser.c -I .src/c_header_parser -I .src/jasc_parser -I ./ext/raylib/src Winmm.lib gdi32.lib User32.lib Shell32.lib /link ./build/raylib/raylib.lib
