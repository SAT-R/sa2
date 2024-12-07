#ifndef GUARD_SA2_CONFIG_H
#define GUARD_SA2_CONFIG_H

/* TODO: Move config.h into a different location? */

#define GAME_SA1 1
#define GAME_SA2 2
#define GAME_SA3 3

// TODO: Define this in Makefile through a compiler macro!
#define GAME GAME_SA2

// TODO: Put somewhere else?
#if PLATFORM_GBA
#define USE_NEW_DMA 0
#else
#define USE_NEW_DMA 1
#endif

#define TAS_TESTING                 0
#define TAS_TESTING_WIDESCREEN_HACK 1

#if PLATFORM_GBA
#define ENABLE_AUDIO TRUE
#else
#ifdef PS2
#define ENABLE_AUDIO     FALSE
#define ENABLE_VRAM_VIEW FALSE
#else
#define ENABLE_AUDIO     TRUE
#define ENABLE_VRAM_VIEW FALSE
#endif

#endif

#endif // GUARD_SA2_CONFIG_H
