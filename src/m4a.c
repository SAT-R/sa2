#include "global.h"
#include "m4a.h"

extern ALIGNED(4) char SoundMainRAM_Buffer[0x400];
extern struct SoundInfo gSoundInfo;

void m4aSoundInit(void) {
     s32 i;

    CpuCopy32((void *)((s32)SoundMainRAM & ~1), SoundMainRAM_Buffer, sizeof(SoundMainRAM_Buffer));
    SoundInit(&gSoundInfo);
    MPlayExtender(gCgbChans);
    m4aSoundMode(SOUND_MODE_DA_BIT_8
               | SOUND_MODE_FREQ_10512
               | (15 << SOUND_MODE_MASVOL_SHIFT)
               | (5 << SOUND_MODE_MAXCHN_SHIFT));
    for (i = 0; i < NUM_MUSIC_PLAYERS; ++i)
    {
        struct MusicPlayerInfo *mplayInfo = gMPlayTable[i].info;

        MPlayOpen(mplayInfo, gMPlayTable[i].track, gMPlayTable[i].unk_8);
        mplayInfo->unk_B = gMPlayTable[i].unk_A;
        mplayInfo->memAccArea = gMPlayMemAccArea;
    }
}
