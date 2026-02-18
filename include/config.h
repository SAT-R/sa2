#ifndef GUARD_SA2_CONFIG_H
#define GUARD_SA2_CONFIG_H

/* TODO: Move config.h into a different location? */

#define GAME_SA1   1
#define GAME_SA2   2
#define GAME_SA3   3
#define GAME_KATAM 4

#define ENGINE_1 1
#define ENGINE_2 2
#define ENGINE_3 3
#define ENGINE_4 4

// TODO: Define this in Makefile through a compiler macro?
#define GAME GAME_SA2

// TODO: Do SA1 and SA2 use the same engine ver?
// TODO: Do SA3 and KATAM use the same engine ver?
#define ENGINE GAME

// TODO: Put somewhere else?
#if PLATFORM_GBA
#define USE_NEW_DMA 0
#else
#define USE_NEW_DMA 1
#endif

#ifndef TAS_TESTING
#define TAS_TESTING 0
#endif

#define TAS_INPUT_LOGGING 0

#ifndef HEADLESS
#define HEADLESS 0
#endif

#define TAS_TESTING_WIDESCREEN_HACK 1

#define RENDERER_SOFTWARE      0
#define RENDERER_OPENGL        1
#define RENDERER_SOFTWARE_FAST 2
#define RENDERER_COUNT         3

#ifndef RENDERER
#if defined(__PSP__) || defined(__PS2__)
#define RENDERER RENDERER_SOFTWARE_FAST
#elif PLATFORM_WIN32 && !PLATFORM_SDL
// TODO: Only win32 for now
#define RENDERER RENDERER_OPENGL
#else
#define RENDERER RENDERER_SOFTWARE_FAST
#endif
#endif

#endif // GUARD_SA2_CONFIG_H
