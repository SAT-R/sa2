#ifndef SOUND_MIXER_H
#define SOUND_MIXER_H

#include "gba/types.h"
#include "lib/m4a/music_player.h"

#define MIXER_UNLOCKED 0x68736D53
#define MIXER_LOCKED   PLAYER_UNLOCKED + 1

struct MP2KPlayerState;

struct MixerSource {
    u8 status;
    u8 type;
    u8 rightVol;
    u8 leftVol;
    u8 attack;
    u8 decay;
    u8 sustain;
    u8 release;

    union {
        struct {
            u8 key;
            u8 envelopeVol;
            u8 envelopeCtr;
            u8 envelopeGoal;

            u8 echoVol;
            u8 echoLen;
            u8 padding1;
            u8 padding2;
            u8 gateTime;
            u8 untransposedKey;
            u8 velocity;
            u8 priority;
            u8 rhythmPan;
            u8 padding3;
            u8 padding4;
            u8 padding5;

            u8 padding6;
            u8 sustainGoal;
            u8 nrx4;
            u8 pan;

            u8 panMask;
            u8 cgbStatus;
            u8 length;
            u8 sweep;

            u32 freq;

            u32 *newCgb3Sample; // nextSample
            u32 *oldCgb3Sample; // currentSample
        } cgb;
        struct {
            u8 key;
            u8 envelopeVol;
            u8 envelopeVolR;
            u8 envelopeVolL;

            u8 echoVol;
            u8 echoLen;
            u8 padding1;
            u8 padding2;
            u8 gateTime;
            u8 untransposedKey;
            u8 velocity;
            u8 priority;
            u8 rhythmPan;
            u8 padding3;
            u8 padding4;
            u8 padding5;

            u32 ct;
            float fw;

            u32 freq;

            struct WaveData *wav;
            s8 *current; // todo: sample
        } sound;
    } data;

    struct MP2KTrack *track;
    struct MixerSource *prev;
    struct MixerSource *next;
    u32 padding7; // d4
    u32 blockCount; // bdpcm block count
};

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
