#ifndef MUSIC_PLAYER_H
#define MUSIC_PLAYER_H

#include "gba/types.h"
#include "lib/m4a/shared.h"
#if PORTABLE
#include "lib/m4a/sound_mixer.h"
#endif

#define PLAYER_UNLOCKED 0x68736D53
#define PLAYER_LOCKED   PLAYER_UNLOCKED + 1

struct WaveData2 {
    u8 compressionFlags1;
    u8 compressionFlags2;
    u8 compressionFlags3;
    u8 loopFlags;
    u32 freq; // 22.10 fixed width decimal, freq of C4. Or just the frequency of C14.
    u32 loopStart;
    u32 size; // number of samples
    s8 data[]; // samples
};

struct MP2KInstrument {
    u8 type;
    u8 drumKey;
    u8 cgbLength;
    u8 pan_sweep; // pan or sweep (compatible sound ch. 1)
    union {
        struct WaveData *wav;
        struct MP2KInstrument *group;
        u32 *cgb3Sample;
        u32 squareNoiseConfig;
    };
    union {
        struct {
            u8 attack;
            u8 decay;
            u8 sustain;
            u8 release;
        };
        u8 *keySplitTable;
    };
};

struct MP2KPlayerCtor {
    struct MP2KPlayerState *player;
    struct MP2KTrack *tracks;
    u8 trackCount;
    u8 padding;
    bool16 checkSongPriority;
};

void clear_modM(struct MP2KPlayerState *unused, struct MP2KTrack *track);
void MP2K_event_endtie(struct MP2KPlayerState *unused, struct MP2KTrack *track);
void MP2K_event_lfos(struct MP2KPlayerState *unused, struct MP2KTrack *track);
void MP2K_event_mod(struct MP2KPlayerState *unused, struct MP2KTrack *track);

#endif
