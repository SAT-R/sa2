#ifndef SOUND_MIXER_H
#define SOUND_MIXER_H

#include "gba/types.h"
#include "lib/m4a/music_player.h"

#define MIXER_UNLOCKED 0x68736D53
#define MIXER_LOCKED   PLAYER_UNLOCKED + 1

struct MP2KPlayerState;

enum { MAX_SAMPLE_CHANNELS = 12 };
enum { MIXED_AUDIO_BUFFER_SIZE = 4907 };

typedef void (*ExtVolPitFunc)(void);

struct SoundMixerState {
    vu32 lockStatus;
    vu8 dmaCounter;

    u8 reverb;
    u8 numChans;
    u8 masterVol;
    u8 freqOption;

    u8 extensionFlags;
    u8 cgbCounter15;
    u8 framesPerDmaCycle;
    u8 maxScanlines;
    u8 padding1;
    u8 padding2;
    u8 padding3;
    s32 samplesPerFrame;
    s32 sampleRate;
    float sampleRateReciprocal;
    struct MixerSource *cgbChans;
    void (*MPlayMainHead)(void *player);
    void *musicPlayerHead;
    void (*CgbSound)(void);
    void (*CgbOscOff)(u8 chan);
    u32 (*MidiKeyToCgbFreq)(u8 chan, u8 key, u8 pitch);
    void (**MPlayJumpTable)();
    void (*plynote)(u8 clock, struct MP2KPlayerState *player, struct MP2KTrack *track);
    ExtVolPitFunc ExtVolPit;
    void *reserved2;
    void *reserved3;
    void *reversed4;
    void *reserved5;
    struct MixerSource chans[MAX_SAMPLE_CHANNELS];
    float pcmBuffer[MIXED_AUDIO_BUFFER_SIZE * 2];
    // s8 pcmBuffer[MIXED_AUDIO_BUFFER_SIZE * 2];
};

typedef void (*MixerRamFunc)(struct SoundMixerState *, u32, u16, s8 *, u16);

extern void RunMixerFrame(void);

#endif // SOUND_MIXER_H
