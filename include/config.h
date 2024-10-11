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
#define USE_NEW_DMA  0
#define ENABLE_AUDIO 1
#else
#define USE_NEW_DMA      1
#define ENABLE_AUDIO     0
#define ENABLE_VRAM_VIEW 0
#endif

#endif // GUARD_SA2_CONFIG_H
