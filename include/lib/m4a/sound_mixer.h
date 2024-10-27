#ifndef SOUND_MIXER_H
#define SOUND_MIXER_H

#include "gba/types.h"
#include "lib/m4a/music_player.h"

#define MIXER_UNLOCKED 0x68736D53
#define MIXER_LOCKED   PLAYER_UNLOCKED + 1

enum { MAX_SAMPLE_CHANNELS = 12 };
enum { MIXED_AUDIO_BUFFER_SIZE = 4907 };

typedef void (*MixerRamFunc)(struct SoundMixerState *, u32, u16, s8 *, u16);

extern void RunMixerFrame(void);

#endif // SOUND_MIXER_H
