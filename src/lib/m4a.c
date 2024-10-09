#include "lib/m4a.h"

#include "global.h"

#if !PORTABLE
__attribute__((section(".bss.code"))) char SoundMainRAM_Buffer[0x400] = {};
#else
char SoundMainRAM_Buffer[0x400] = {};
#endif

EWRAM_DATA struct SoundInfo gSoundInfo = {};
EWRAM_DATA MPlayFunc gMPlayJumpTable[36] = {};
EWRAM_DATA struct CgbChannel gCgbChans[4] = {};

// For some reason these were declared in this order
EWRAM_DATA struct MusicPlayerInfo gMPlayInfo_BGM = {};
EWRAM_DATA struct MusicPlayerInfo gMPlayInfo_SE1 = {};
EWRAM_DATA struct MusicPlayerInfo gMPlayInfo_SE2 = {};
EWRAM_DATA u8 gMPlayMemAccArea[0x10] = {};
EWRAM_DATA struct MusicPlayerInfo gMPlayInfo_SE3 = {};

static void DummyCallback(void);

u32 MidiKeyToFreq(struct WaveData *wav, u8 key, u8 fineAdjust)
{
    u32 val1;
    u32 val2;
    u32 fineAdjustShifted = fineAdjust << 24;

    if (key > 178) {
        key = 178;
        fineAdjustShifted = 255 << 24;
    }
    val1 = gScaleTable[key];
    val1 = gFreqTable[val1 & 0xF] >> (val1 >> 4);
    val2 = gScaleTable[key + 1];
    val2 = gFreqTable[val2 & 0xF] >> (val2 >> 4);
    return umul3232H32(wav->freq, val1 + umul3232H32(val2 - val1, fineAdjustShifted));
}

static void DummyFunc(void) { }

void MPlayContinue(struct MusicPlayerInfo *mplayInfo)
{
#if !ENABLE_AUDIO
    return;
#endif
    if (mplayInfo->ident == ID_NUMBER) {
        ++mplayInfo->ident;
        mplayInfo->status &= ~MUSICPLAYER_STATUS_PAUSE;
        mplayInfo->ident = ID_NUMBER;
    }
}

void MPlayFadeOut(struct MusicPlayerInfo *mplayInfo, u16 speed)
{
#if !ENABLE_AUDIO
    return;
#endif
    if (mplayInfo->ident == ID_NUMBER) {
        ++mplayInfo->ident;
        mplayInfo->fadeOC = speed;
        mplayInfo->fadeOI = speed;
        mplayInfo->fadeOV = (64 << FADE_VOL_SHIFT);
        mplayInfo->ident = ID_NUMBER;
    }
}

void m4aSoundInit(void)
{
    s32 i;
#if !ENABLE_AUDIO
    return;
#endif
    CpuCopy32((void *)((intptr_t)SoundMainRAM & ~1), SoundMainRAM_Buffer, sizeof(SoundMainRAM_Buffer));
    SoundInit(&gSoundInfo);
    MPlayExtender(gCgbChans);
    m4aSoundMode(DEFAULT_SOUND_MODE);
    for (i = 0; i < NUM_MUSIC_PLAYERS; ++i) {
        struct MusicPlayerInfo *mplayInfo = gMPlayTable[i].info;

        MPlayOpen(mplayInfo, gMPlayTable[i].track, gMPlayTable[i].unk_8);
        mplayInfo->unk_B = gMPlayTable[i].unk_A;
        mplayInfo->memAccArea = gMPlayMemAccArea;
    }
}

void m4aSoundMain(void) { SoundMain(); }

void m4aSongNumStart(u16 n)
{
#if !ENABLE_AUDIO
    return;
#endif
    const struct MusicPlayer *mplayTable = gMPlayTable;
    const struct Song *songTable = gSongTable;
    const struct Song *song = &songTable[n];
    const struct MusicPlayer *mplay = &mplayTable[song->ms];

    MPlayStart(mplay->info, song->header);
}

void m4aSongNumStartOrChange(u16 n)
{
#if !ENABLE_AUDIO
    return;
#endif
    const struct MusicPlayer *mplayTable = gMPlayTable;
    const struct Song *songTable = gSongTable;
    const struct Song *song = &songTable[n];
    const struct MusicPlayer *mplay = &mplayTable[song->ms];

    if (mplay->info->songHeader != song->header) {
        MPlayStart(mplay->info, song->header);
    } else {
        if ((mplay->info->status & MUSICPLAYER_STATUS_TRACK) == 0 || (mplay->info->status & MUSICPLAYER_STATUS_PAUSE)) {
            MPlayStart(mplay->info, song->header);
        }
    }
}

void m4aSongNumStartOrContinue(u16 n)
{
#if !ENABLE_AUDIO
    return;
#endif
    const struct MusicPlayer *mplayTable = gMPlayTable;
    const struct Song *songTable = gSongTable;
    const struct Song *song = &songTable[n];
    const struct MusicPlayer *mplay = &mplayTable[song->ms];

    if (mplay->info->songHeader != song->header)
        MPlayStart(mplay->info, song->header);
    else if ((mplay->info->status & MUSICPLAYER_STATUS_TRACK) == 0)
        MPlayStart(mplay->info, song->header);
    else if (mplay->info->status & MUSICPLAYER_STATUS_PAUSE)
        MPlayContinue(mplay->info);
}

void m4aSongNumStop(u16 n)
{
#if !ENABLE_AUDIO
    return;
#endif
    const struct MusicPlayer *mplayTable = gMPlayTable;
    const struct Song *songTable = gSongTable;
    const struct Song *song = &songTable[n];
    const struct MusicPlayer *mplay = &mplayTable[song->ms];

    if (mplay->info->songHeader == song->header)
        MPlayStop(mplay->info);
}

void m4aSongNumContinue(u16 n)
{
#if !ENABLE_AUDIO
    return;
#endif
    const struct MusicPlayer *mplayTable = gMPlayTable;
    const struct Song *songTable = gSongTable;
    const struct Song *song = &songTable[n];
    const struct MusicPlayer *mplay = &mplayTable[song->ms];

    if (mplay->info->songHeader == song->header)
        MPlayContinue(mplay->info);
}

void m4aMPlayAllStop(void)
{
    s32 i;
#if !ENABLE_AUDIO
    return;
#endif
    for (i = 0; i < NUM_MUSIC_PLAYERS; ++i)
        MPlayStop(gMPlayTable[i].info);
}

void m4aMPlayContinue(struct MusicPlayerInfo *mplayInfo)
{
#if !ENABLE_AUDIO
    return;
#endif
    MPlayContinue(mplayInfo);
}

void m4aMPlayAllContinue(void)
{
    s32 i;
#if !ENABLE_AUDIO
    return;
#endif
    for (i = 0; i < NUM_MUSIC_PLAYERS; ++i)
        MPlayContinue(gMPlayTable[i].info);
}

void m4aMPlayFadeOut(struct MusicPlayerInfo *mplayInfo, u16 speed)
{
#if !ENABLE_AUDIO
    return;
#endif
    MPlayFadeOut(mplayInfo, speed);
}

void m4aMPlayFadeOutTemporarily(struct MusicPlayerInfo *mplayInfo, u16 speed)
{
#if !ENABLE_AUDIO
    return;
#endif
    if (mplayInfo->ident == ID_NUMBER) {
        ++mplayInfo->ident;
        mplayInfo->fadeOC = speed;
        mplayInfo->fadeOI = speed;
        mplayInfo->fadeOV = (64 << FADE_VOL_SHIFT) | TEMPORARY_FADE;
        mplayInfo->ident = ID_NUMBER;
    }
}

void m4aMPlayFadeIn(struct MusicPlayerInfo *mplayInfo, u16 speed)
{
#if !ENABLE_AUDIO
    return;
#endif
    if (mplayInfo->ident == ID_NUMBER) {
        ++mplayInfo->ident;
        mplayInfo->fadeOC = speed;
        mplayInfo->fadeOI = speed;
        mplayInfo->fadeOV = (0 << FADE_VOL_SHIFT) | FADE_IN;
        mplayInfo->status &= ~MUSICPLAYER_STATUS_PAUSE;
        mplayInfo->ident = ID_NUMBER;
    }
}

void m4aMPlayImmInit(struct MusicPlayerInfo *mplayInfo)
{
#if !ENABLE_AUDIO
    return;
#endif
    s32 trackCount = mplayInfo->trackCount;
    struct MusicPlayerTrack *track = mplayInfo->tracks;

    while (trackCount > 0) {
        if (track->flags & MPT_FLG_EXIST) {
            if (track->flags & MPT_FLG_START) {
                Clear64byte(track);
                track->flags = MPT_FLG_EXIST;
                track->bendRange = 2;
                track->volX = 64;
                track->lfoSpeed = 22;
                track->tone.type = 1;
            }
        }

        --trackCount;
        ++track;
    }
}

void MPlayExtender(struct CgbChannel *cgbChans)
{
    struct SoundInfo *soundInfo;
    u32 ident;
#if !ENABLE_AUDIO
    return;
#endif
    REG_SOUNDCNT_X = SOUND_MASTER_ENABLE | SOUND_4_ON | SOUND_3_ON | SOUND_2_ON | SOUND_1_ON;
    REG_SOUNDCNT_L = 0; // set master volume to zero
    REG_NR12 = 0x8;
    REG_NR22 = 0x8;
    REG_NR42 = 0x8;
    REG_NR14 = 0x80;
    REG_NR24 = 0x80;
    REG_NR44 = 0x80;
    REG_NR30 = 0;
    REG_NR50 = 0x77;
    soundInfo = SOUND_INFO_PTR;
    ident = soundInfo->ident;
    if (ident != ID_NUMBER)
        return;
    ++soundInfo->ident;
    gMPlayJumpTable[8] = ply_memacc;
    gMPlayJumpTable[17] = ply_lfos;
    gMPlayJumpTable[19] = ply_mod;
    gMPlayJumpTable[28] = ply_xcmd;
    gMPlayJumpTable[29] = ply_endtie;
    gMPlayJumpTable[30] = SampleFreqSet;
    gMPlayJumpTable[31] = TrackStop;
    gMPlayJumpTable[32] = FadeOutBody;
    gMPlayJumpTable[33] = TrkVolPitSet;
    soundInfo->cgbChans = cgbChans;
    soundInfo->CgbSound = CgbSound;
    soundInfo->CgbOscOff = CgbOscOff;
    soundInfo->MidiKeyToCgbFreq = MidiKeyToCgbFreq;
    soundInfo->maxLines = MAX_LINES;
    CpuFill32(0, cgbChans, sizeof(struct CgbChannel) * 4);
    cgbChans[0].ty = 1;
    cgbChans[0].panMask = 0x11;
    cgbChans[1].ty = 2;
    cgbChans[1].panMask = 0x22;
    cgbChans[2].ty = 3;
    cgbChans[2].panMask = 0x44;
    cgbChans[3].ty = 4;
    cgbChans[3].panMask = 0x88;
    soundInfo->ident = ident;
}

#if PLATFORM_GBA
void MusicPlayerJumpTableCopy(void) { asm("swi 0x2A"); }
#else
// TODO: Implement
void MusicPlayerJumpTableCopy(void) { }
#endif

void ClearChain(void *x)
{
    void (*func)(void *) = *(&gMPlayJumpTable[34]);
    func(x);
}

void Clear64byte(void *x)
{
    void (*func)(void *) = *(&gMPlayJumpTable[35]);
#if PORTABLE
    if (func != NULL)
#endif
        func(x);
}

void SoundInit(struct SoundInfo *soundInfo)
{
    soundInfo->ident = 0;
#if !USE_NEW_DMA
    if (REG_DMA1CNT & (DMA_REPEAT << 16))
        REG_DMA1CNT = ((DMA_ENABLE | DMA_START_NOW | DMA_32BIT | DMA_SRC_INC | DMA_DEST_FIXED) << 16) | 4;
    if (REG_DMA2CNT & (DMA_REPEAT << 16))
        REG_DMA2CNT = ((DMA_ENABLE | DMA_START_NOW | DMA_32BIT | DMA_SRC_INC | DMA_DEST_FIXED) << 16) | 4;
    REG_DMA1CNT_H = DMA_32BIT;
    REG_DMA2CNT_H = DMA_32BIT;
    REG_SOUNDCNT_X = SOUND_MASTER_ENABLE | SOUND_4_ON | SOUND_3_ON | SOUND_2_ON | SOUND_1_ON;
    REG_SOUNDCNT_H = SOUND_B_FIFO_RESET | SOUND_B_TIMER_0 | SOUND_B_LEFT_OUTPUT | SOUND_A_FIFO_RESET | SOUND_A_TIMER_0
        | SOUND_A_RIGHT_OUTPUT | SOUND_ALL_MIX_FULL;
    REG_SOUNDBIAS_H = (REG_SOUNDBIAS_H & 0x3F) | 0x40;
    REG_DMA1SAD = (intptr_t)soundInfo->pcmBuffer;
    REG_DMA1DAD = (intptr_t)&REG_FIFO_A;
    REG_DMA2SAD = (intptr_t)soundInfo->pcmBuffer + PCM_DMA_BUF_SIZE;
    REG_DMA2DAD = (intptr_t)&REG_FIFO_B;
#endif
    SOUND_INFO_PTR = soundInfo;
    CpuFill32(0, soundInfo, sizeof(struct SoundInfo));
    soundInfo->maxChans = 8;
    soundInfo->masterVolume = 15;
    soundInfo->plynote = (uintptr_t)ply_note;
    soundInfo->CgbSound = DummyCallback;
    soundInfo->CgbOscOff = (void (*)(u8))DummyCallback;
    soundInfo->MidiKeyToCgbFreq = (u32(*)(u8, u8, u8))DummyCallback;
    soundInfo->ExtVolPit = (uintptr_t)DummyCallback;
    MPlayJumpTableCopy(gMPlayJumpTable);
    soundInfo->MPlayJumpTable = (uintptr_t)gMPlayJumpTable;
    SampleFreqSet(SOUND_MODE_FREQ_13379); // ???
    soundInfo->ident = ID_NUMBER;
}

void SampleFreqSet(u32 freq)
{
    struct SoundInfo *soundInfo = SOUND_INFO_PTR;

    freq = (freq & 0xF0000) >> 16;
    soundInfo->freq = freq;
    soundInfo->pcmSamplesPerVBlank = gPcmSamplesPerVBlankTable[freq - 1];
    soundInfo->pcmDmaPeriod = PCM_DMA_BUF_SIZE / soundInfo->pcmSamplesPerVBlank;
    // LCD refresh rate 59.7275Hz
    soundInfo->pcmFreq = (597275 * soundInfo->pcmSamplesPerVBlank + 5000) / 10000;
    // CPU frequency 16.78Mhz
    soundInfo->divFreq = (0x1000000 / soundInfo->pcmFreq + 1) >> 1;
    // Turn off timer 0.
    REG_TM0CNT_H = 0;
    // cycles per LCD fresh 280896
    REG_TM0CNT_L = -(280896 / soundInfo->pcmSamplesPerVBlank);
    m4aSoundVSyncOn();
#if !PORTABLE
    while (*(vu8 *)REG_ADDR_VCOUNT == 159)
        ;
    while (*(vu8 *)REG_ADDR_VCOUNT != 159)
        ;
#else
    REG_VCOUNT = DISPLAY_HEIGHT;
#endif
    REG_TM0CNT_H = TIMER_ENABLE | TIMER_1CLK;
}

void m4aSoundMode(u32 mode)
{
    struct SoundInfo *soundInfo = SOUND_INFO_PTR;
    u32 temp;
#if !ENABLE_AUDIO
    return;
#endif
    if (soundInfo->ident != ID_NUMBER)
        return;
    ++soundInfo->ident;
    temp = mode & (SOUND_MODE_REVERB_SET | SOUND_MODE_REVERB_VAL);
    if (temp)
        soundInfo->reverb = temp & SOUND_MODE_REVERB_VAL;
    temp = mode & SOUND_MODE_MAXCHN;
    if (temp) {
        struct SoundChannel *chan;

        soundInfo->maxChans = temp >> SOUND_MODE_MAXCHN_SHIFT;
        temp = MAX_DIRECTSOUND_CHANNELS;
        chan = &soundInfo->chans[0];
        while (temp != 0) {
            chan->status = 0;
            --temp;
            ++chan;
        }
    }
    temp = mode & SOUND_MODE_MASVOL;
    if (temp)
        soundInfo->masterVolume = temp >> SOUND_MODE_MASVOL_SHIFT;
    temp = mode & SOUND_MODE_DA_BIT;
    if (temp) {
        temp = (temp & 0x300000) >> 14;
        REG_SOUNDBIAS_H = (REG_SOUNDBIAS_H & 0x3F) | temp;
    }
    temp = mode & SOUND_MODE_FREQ;
    if (temp) {
        m4aSoundVSyncOff();
        SampleFreqSet(temp);
    }
    soundInfo->ident = ID_NUMBER;
}

void SoundClear(void)
{
    struct SoundInfo *soundInfo = SOUND_INFO_PTR;
    s32 i;
    void *chan;

    if (soundInfo->ident != ID_NUMBER)
        return;
    ++soundInfo->ident;
    i = MAX_DIRECTSOUND_CHANNELS;
    chan = &soundInfo->chans[0];
    while (i > 0) {
        ((struct SoundChannel *)chan)->status = 0;
        --i;
        chan = (void *)((uintptr_t)chan + sizeof(struct SoundChannel));
    }
    chan = soundInfo->cgbChans;
    if (chan) {
        i = 1;
        while (i <= 4) {
            soundInfo->CgbOscOff(i);
            ((struct CgbChannel *)chan)->sf = 0;
            ++i;
            chan = (void *)((uintptr_t)chan + sizeof(struct CgbChannel));
        }
    }
    soundInfo->ident = ID_NUMBER;
}

void m4aSoundVSyncOff(void)
{
#if !ENABLE_AUDIO
    return;
#endif
    struct SoundInfo *soundInfo = SOUND_INFO_PTR;

    if (soundInfo->ident >= ID_NUMBER && soundInfo->ident <= ID_NUMBER + 1) {
        soundInfo->ident += 10;
#if !USE_NEW_DMA
        if (REG_DMA1CNT & (DMA_REPEAT << 16))
            REG_DMA1CNT = ((DMA_ENABLE | DMA_START_NOW | DMA_32BIT | DMA_SRC_INC | DMA_DEST_FIXED) << 16) | 4;
        if (REG_DMA2CNT & (DMA_REPEAT << 16))
            REG_DMA2CNT = ((DMA_ENABLE | DMA_START_NOW | DMA_32BIT | DMA_SRC_INC | DMA_DEST_FIXED) << 16) | 4;
        REG_DMA1CNT_H = DMA_32BIT;
        REG_DMA2CNT_H = DMA_32BIT;
#endif // !USE_NEW_DMA
        CpuFill32(0, soundInfo->pcmBuffer, sizeof(soundInfo->pcmBuffer));
    }
}

void m4aSoundVSyncOn(void)
{
#if !ENABLE_AUDIO
    return;
#endif
    struct SoundInfo *soundInfo = SOUND_INFO_PTR;
    u32 ident = soundInfo->ident;

    if (ident == ID_NUMBER)
        return;
#if !USE_NEW_DMA
    REG_DMA1CNT_H = DMA_ENABLE | DMA_START_SPECIAL | DMA_32BIT | DMA_REPEAT;
    REG_DMA2CNT_H = DMA_ENABLE | DMA_START_SPECIAL | DMA_32BIT | DMA_REPEAT;
#endif
    soundInfo->pcmDmaCounter = 0;
    soundInfo->ident = ident - 10;
}

void MPlayOpen(struct MusicPlayerInfo *mplayInfo, struct MusicPlayerTrack *tracks, u8 trackCount)
{
    struct SoundInfo *soundInfo;
#if !ENABLE_AUDIO
    return;
#endif
    if (trackCount == 0)
        return;
    if (trackCount > MAX_MUSICPLAYER_TRACKS)
        trackCount = MAX_MUSICPLAYER_TRACKS;
    soundInfo = SOUND_INFO_PTR;
    if (soundInfo->ident != ID_NUMBER)
        return;
    ++soundInfo->ident;
    Clear64byte(mplayInfo);
    mplayInfo->tracks = tracks;
    mplayInfo->trackCount = trackCount;
    mplayInfo->status = MUSICPLAYER_STATUS_PAUSE;
    while (trackCount != 0) {
        tracks->flags = 0;
        --trackCount;
        ++tracks;
    }
    if (soundInfo->func != 0) {
        mplayInfo->func = soundInfo->func;
        mplayInfo->intp = soundInfo->intp;
        soundInfo->func = 0;
    }
    soundInfo->intp = (uintptr_t)mplayInfo;
    soundInfo->func = (uintptr_t)MPlayMain;
    soundInfo->ident = ID_NUMBER;
    mplayInfo->ident = ID_NUMBER;
}

void MPlayStart(struct MusicPlayerInfo *mplayInfo, struct SongHeader *songHeader)
{
    s32 i;
    u8 unk_B;
    struct MusicPlayerTrack *track;
#if !ENABLE_AUDIO
    return;
#endif
    if (mplayInfo->ident != ID_NUMBER)
        return;
    unk_B = mplayInfo->unk_B;
    if (!unk_B
        || ((!mplayInfo->songHeader || !(mplayInfo->tracks[0].flags & MPT_FLG_START))
            && ((mplayInfo->status & MUSICPLAYER_STATUS_TRACK) == 0 || (mplayInfo->status & MUSICPLAYER_STATUS_PAUSE)))
        || (mplayInfo->priority <= songHeader->priority)) {
        ++mplayInfo->ident;
        mplayInfo->status = 0;
        mplayInfo->songHeader = songHeader;
        mplayInfo->tone = songHeader->tone;
        mplayInfo->priority = songHeader->priority;
        mplayInfo->clock = 0;
        mplayInfo->tempoD = 150;
        mplayInfo->tempoI = 150;
        mplayInfo->tempoU = 0x100;
        mplayInfo->tempoC = 0;
        mplayInfo->fadeOI = 0;
        i = 0;
        track = mplayInfo->tracks;
        while (i < songHeader->trackCount && i < mplayInfo->trackCount) {
            TrackStop(mplayInfo, track);
            track->flags = MPT_FLG_EXIST | MPT_FLG_START;
            track->chan = 0;
            track->cmdPtr = songHeader->part[i];
            ++i;
            ++track;
        }
        while (i < mplayInfo->trackCount) {
            TrackStop(mplayInfo, track);
            track->flags = 0;
            ++i;
            ++track;
        }
        if (songHeader->reverb & 0x80)
            m4aSoundMode(songHeader->reverb);
        mplayInfo->ident = ID_NUMBER;
    }
}

void MPlayStop(struct MusicPlayerInfo *mplayInfo)
{
    s32 i;
    struct MusicPlayerTrack *track;
#if !ENABLE_AUDIO
    return;
#endif

    if (mplayInfo->ident != ID_NUMBER)
        return;

    ++mplayInfo->ident;
    mplayInfo->status |= MUSICPLAYER_STATUS_PAUSE;

    i = mplayInfo->trackCount;
    track = mplayInfo->tracks;

    while (i > 0) {
        TrackStop(mplayInfo, track);
        --i;
        ++track;
    }

    mplayInfo->ident = ID_NUMBER;
}

void FadeOutBody(struct MusicPlayerInfo *mplayInfo)
{
    s32 i;
    struct MusicPlayerTrack *track;
    u16 fadeOV;

    if (mplayInfo->fadeOI == 0)
        return;
    if (--mplayInfo->fadeOC != 0)
        return;

    mplayInfo->fadeOC = mplayInfo->fadeOI;

    if (mplayInfo->fadeOV & FADE_IN) {
        if ((u16)(mplayInfo->fadeOV += (4 << FADE_VOL_SHIFT)) >= (64 << FADE_VOL_SHIFT)) {
            mplayInfo->fadeOV = (64 << FADE_VOL_SHIFT);
            mplayInfo->fadeOI = 0;
        }
    } else {
        if ((s16)(mplayInfo->fadeOV -= (4 << FADE_VOL_SHIFT)) <= 0) {
            i = mplayInfo->trackCount;
            track = mplayInfo->tracks;

            while (i > 0) {
                u32 val;

                TrackStop(mplayInfo, track);

                val = TEMPORARY_FADE;
                fadeOV = mplayInfo->fadeOV;
                val &= fadeOV;

                if (!val)
                    track->flags = 0;

                i--;
                track++;
            }

            if (mplayInfo->fadeOV & TEMPORARY_FADE)
                mplayInfo->status |= MUSICPLAYER_STATUS_PAUSE;
            else
                mplayInfo->status = MUSICPLAYER_STATUS_PAUSE;

            mplayInfo->fadeOI = 0;
            return;
        }
    }

    i = mplayInfo->trackCount;
    track = mplayInfo->tracks;

    while (i > 0) {
        if (track->flags & MPT_FLG_EXIST) {
            fadeOV = mplayInfo->fadeOV;

            track->volX = (fadeOV >> FADE_VOL_SHIFT);
            track->flags |= MPT_FLG_VOLCHG;
        }

        i--;
        track++;
    }
}

void TrkVolPitSet(struct MusicPlayerInfo *mplayInfo, struct MusicPlayerTrack *track)
{
    if (track->flags & MPT_FLG_VOLSET) {
        s32 x, y;

        x = (u32)(track->vol * track->volX) >> 5;
        if (track->modT == 1)
            x = (u32)(x * (track->modM + 128)) >> 7;
        y = 2 * track->pan + track->panX;
        if (track->modT == 2)
            y += track->modM;
        if (y < -128)
            y = -128;
        else if (y > 127)
            y = 127;
        track->volMR = (u32)((y + 128) * x) >> 8;
        track->volML = (u32)((127 - y) * x) >> 8;
    }
    if (track->flags & MPT_FLG_PITSET) {
        s32 bend = track->bend * track->bendRange;
        s32 x = (track->tune + bend) * 4 + (track->keyShift << 8) + (track->keyShiftX << 8) + track->pitX;

        if (track->modT == 0)
            x += 16 * track->modM;
        track->keyM = x >> 8;
        track->pitM = x;
    }
    track->flags &= ~(MPT_FLG_PITSET | MPT_FLG_VOLSET);
}

u32 MidiKeyToCgbFreq(u8 chanNum, u8 key, u8 fineAdjust)
{
    if (chanNum == 4) {
        if (key <= 20) {
            key = 0;
        } else {
            key -= 21;
            if (key > 59)
                key = 59;
        }
        return gNoiseTable[key];
    } else {
        s32 val1;
        s32 val2;

        if (key <= 35) {
            fineAdjust = 0;
            key = 0;
        } else {
            key -= 36;
            if (key > 130) {
                key = 130;
                fineAdjust = 255;
            }
        }
        val1 = gCgbScaleTable[key];
        val1 = gCgbFreqTable[val1 & 0xF] >> (val1 >> 4);
        val2 = gCgbScaleTable[key + 1];
        val2 = gCgbFreqTable[val2 & 0xF] >> (val2 >> 4);
        return val1 + ((fineAdjust * (val2 - val1)) >> 8) + 2048;
    }
}

void CgbOscOff(u8 chanNum)
{
    switch (chanNum) {
        case 1:
            REG_NR12 = 8;
            REG_NR14 = 0x80;
            break;
        case 2:
            REG_NR22 = 8;
            REG_NR24 = 0x80;
            break;
        case 3:
            REG_NR30 = 0;
            break;
        default:
            REG_NR42 = 8;
            REG_NR44 = 0x80;
    }
}

static inline s32 CgbPan(struct CgbChannel *chan)
{
    u32 rightVolume = chan->rightVolume;
    u32 leftVolume = chan->leftVolume;

    if ((rightVolume = (u8)rightVolume) >= (leftVolume = (u8)leftVolume)) {
        if (rightVolume / 2 >= leftVolume) {
            chan->pan = 0x0F;
            return 1;
        }
    } else {
        if (leftVolume / 2 >= rightVolume) {
            chan->pan = 0xF0;
            return 1;
        }
    }
    return 0;
}

void CgbModVol(struct CgbChannel *chan)
{
    if (!CgbPan(chan)) {
        chan->pan = 0xFF;
        chan->eg = (u32)(chan->rightVolume + chan->leftVolume) / 16;
    } else {
        chan->eg = (u32)(chan->rightVolume + chan->leftVolume) / 16;
        if (chan->eg > 15)
            chan->eg = 15;
    }
    chan->sg = (chan->eg * chan->su + 15) >> 4;
    chan->pan &= chan->panMask;
}

void CgbSound(void)
{
    s32 ch;
    struct CgbChannel *channels;
    s32 evAdd;
    s32 prevC15;
    struct SoundInfo *soundInfo = SOUND_INFO_PTR;
    vu8 *nrx0ptr;
    vu8 *nrx1ptr;
    vu8 *nrx2ptr;
    vu8 *nrx3ptr;
    vu8 *nrx4ptr;
    // Most comparision operations that cast to s8 perform 'and' by 0xFF.
    s32 mask = 0xff;

    if (soundInfo->c15)
        --soundInfo->c15;
    else
        soundInfo->c15 = 14;
    for (ch = 1, channels = soundInfo->cgbChans; ch <= 4; ++ch, ++channels) {
        if (!(channels->sf & 0xc7))
            continue;
        switch (ch) {
            case 1:
                nrx0ptr = &REG_NR10;
                nrx1ptr = &REG_NR11;
                nrx2ptr = &REG_NR12;
                nrx3ptr = &REG_NR13;
                nrx4ptr = &REG_NR14;
                break;
            case 2:
                nrx0ptr = (vu8 *)(REG_ADDR_NR10 + 1);
                nrx1ptr = &REG_NR21;
                nrx2ptr = &REG_NR22;
                nrx3ptr = &REG_NR23;
                nrx4ptr = &REG_NR24;
                break;
            case 3:
                nrx0ptr = &REG_NR30;
                nrx1ptr = &REG_NR31;
                nrx2ptr = &REG_NR32;
                nrx3ptr = &REG_NR33;
                nrx4ptr = &REG_NR34;
                break;
            default:
                nrx0ptr = (vu8 *)(REG_ADDR_NR30 + 1);
                nrx1ptr = &REG_NR41;
                nrx2ptr = &REG_NR42;
                nrx3ptr = &REG_NR43;
                nrx4ptr = &REG_NR44;
                break;
        }
        prevC15 = soundInfo->c15;
        evAdd = *nrx2ptr;
        if (channels->sf & 0x80) {
            if (!(channels->sf & 0x40)) {
                channels->sf = 3;
                channels->mo = 3;
                CgbModVol(channels);
                switch (ch) {
                    case 1:
                        *nrx0ptr = channels->sw;
                        // fallthrough
                    case 2:
                        *nrx1ptr = ((uintptr_t)channels->wp << 6) + channels->le;
                        goto loc_82E0E30;
                    case 3:
                        if ((uintptr_t)channels->wp != channels->cp) {
                            *nrx0ptr = 0x40;
                            REG_WAVE_RAM0 = channels->wp[0];
                            REG_WAVE_RAM1 = channels->wp[1];
                            REG_WAVE_RAM2 = channels->wp[2];
                            REG_WAVE_RAM3 = channels->wp[3];
                            channels->cp = (uintptr_t)channels->wp;
                        }
                        *nrx0ptr = 0;
                        *nrx1ptr = channels->le;
                        if (channels->le)
                            channels->n4 = -64;
                        else
                            channels->n4 = -128;
                        break;
                    default:
                        *nrx1ptr = channels->le;
                        *nrx3ptr = (uintptr_t)channels->wp << 3;
                    loc_82E0E30:
                        evAdd = channels->at + 8;
                        if (channels->le)
                            channels->n4 = 64;
                        else
                            channels->n4 = 0;
                        break;
                }
                channels->ec = channels->at;
                if ((s8)(channels->at & mask)) {
                    channels->ev = 0;
                    goto EC_MINUS;
                } else {
                    goto loc_82E0F96;
                }
            } else {
                goto loc_82E0E82;
            }
        } else if (channels->sf & 0x04) {
            --channels->echoLength;
            if ((s8)(channels->echoLength & mask) <= 0) {
            loc_82E0E82:
                CgbOscOff(ch);
                channels->sf = 0;
                goto _0815107C;
            }
            goto loc_82E0FD6;
        } else if ((channels->sf & 0x40) && (channels->sf & 0x03)) {
            channels->sf &= 0xfc;
            channels->ec = channels->re;
            if ((s8)(channels->re & mask)) {
                channels->mo |= 1;
                if (ch != 3)
                    evAdd = channels->re;
                goto EC_MINUS;
            } else {
                goto loc_82E0F02;
            }
        } else {
        loc_82E0ED0:
            if (channels->ec == 0) {
                if (ch == 3)
                    channels->mo |= 1;
                CgbModVol(channels);
                if ((channels->sf & 0x3) == 0) {
                    --channels->ev;
                    if ((s8)(channels->ev & mask) <= 0) {
                    loc_82E0F02:
                        channels->ev = ((channels->eg * channels->echoVolume) + 0xFF) >> 8;
                        if (channels->ev) {
                            channels->sf |= 0x4;
                            channels->mo |= 1;
                            if (ch != 3)
                                evAdd = 8;
                            goto loc_82E0FD6;
                        } else {
                            goto loc_82E0E82;
                        }
                    } else {
                        channels->ec = channels->re;
                    }
                } else if ((channels->sf & 0x3) == 1) {
                loc_82E0F3A:
                    channels->ev = channels->sg;
                    channels->ec = 7;
                } else if ((channels->sf & 0x3) == 2) {
                    s32 ev, sg;

                    --channels->ev;
                    ev = (s8)(channels->ev & mask);
                    sg = (s8)(channels->sg);
                    if (ev <= sg) {
                    loc_82E0F5A:
                        if (channels->su == 0) {
                            channels->sf &= 0xfc;
                            goto loc_82E0F02;
                        } else {
                            --channels->sf;
                            channels->mo |= 1;
                            if (ch != 3)
                                evAdd = 8;
                            goto loc_82E0F3A;
                        }
                    } else {
                        channels->ec = channels->de;
                    }
                } else {
                    ++channels->ev;
                    if ((u8)(channels->ev & mask) >= channels->eg) {
                    loc_82E0F96:
                        --channels->sf;
                        channels->ec = channels->de;
                        if ((u8)(channels->ec & mask)) {
                            channels->mo |= 1;
                            channels->ev = channels->eg;
                            if (ch != 3) {
                                evAdd = channels->de;
                            }
                        } else {
                            goto loc_82E0F5A;
                        }
                    } else {
                        channels->ec = channels->at;
                    }
                }
            }
        }
    EC_MINUS:
        --channels->ec;
        if (prevC15 == 0) {
            --prevC15;
            goto loc_82E0ED0;
        }
    loc_82E0FD6:
        if (channels->mo & 0x2) {
            if (ch < 4 && (channels->ty & 0x08)) {
                s32 biasH = REG_SOUNDBIAS_H;

                if (biasH < 64)
                    channels->fr = (channels->fr + 2) & 0x7fc;
                else if (biasH < 128)
                    channels->fr = (channels->fr + 1) & 0x7fe;
            }
            if (ch != 4) {
                *nrx3ptr = channels->fr;
            } else {
                *nrx3ptr = (*nrx3ptr & 0x08) | channels->fr;
            }
            channels->n4 = (channels->n4 & 0xC0) + (*((u8 *)(&channels->fr) + 1));
            *nrx4ptr = (s8)(channels->n4 & mask);
        }
        if (channels->mo & 1) {
            REG_NR51 = (REG_NR51 & ~channels->panMask) | channels->pan;
            if (ch == 3) {
                *nrx2ptr = gCgb3Vol[channels->ev];
                if (channels->n4 & 0x80) {
                    *nrx0ptr = 0x80;
                    *nrx4ptr = channels->n4;
                    channels->n4 &= 0x7f;
                }
            } else {
                evAdd &= 0xf;
                *nrx2ptr = (channels->ev << 4) + evAdd;
                *nrx4ptr = channels->n4 | 0x80;
                if (ch == 1 && !(*nrx0ptr & 0x08)) {
                    *nrx4ptr = channels->n4 | 0x80;
                }
            }
        }
    _0815107C:
        channels->mo = 0;
    }
}

void m4aMPlayTempoControl(struct MusicPlayerInfo *mplayInfo, u16 tempo)
{
#if !ENABLE_AUDIO
    return;
#endif
    if (mplayInfo->ident == ID_NUMBER) {
        ++mplayInfo->ident;
        mplayInfo->tempoU = tempo;
        mplayInfo->tempoI = (mplayInfo->tempoD * mplayInfo->tempoU) >> 8;
        mplayInfo->ident = ID_NUMBER;
    }
}

void m4aMPlayVolumeControl(struct MusicPlayerInfo *mplayInfo, u16 trackBits, u16 volume)
{
    s32 i;
    u32 bit;
    struct MusicPlayerTrack *track;

#if !ENABLE_AUDIO
    return;
#endif

    if (mplayInfo->ident != ID_NUMBER)
        return;
    ++mplayInfo->ident;
    i = mplayInfo->trackCount;
    track = mplayInfo->tracks;
    bit = 1;
    while (i > 0) {
        if (trackBits & bit) {
            if (track->flags & MPT_FLG_EXIST) {
                track->volX = volume / 4;
                track->flags |= MPT_FLG_VOLCHG;
            }
        }
        --i;
        ++track;
        bit <<= 1;
    }
    mplayInfo->ident = ID_NUMBER;
}

void m4aMPlayPitchControl(struct MusicPlayerInfo *mplayInfo, u16 trackBits, s16 pitch)
{
    s32 i;
    u32 bit;
    struct MusicPlayerTrack *track;

#if !ENABLE_AUDIO
    return;
#endif

    if (mplayInfo->ident != ID_NUMBER)
        return;
    ++mplayInfo->ident;
    i = mplayInfo->trackCount;
    track = mplayInfo->tracks;
    bit = 1;
    while (i > 0) {
        if (trackBits & bit) {
            if (track->flags & MPT_FLG_EXIST) {
                track->keyShiftX = pitch >> 8;
                track->pitX = pitch;
                track->flags |= MPT_FLG_PITCHG;
            }
        }
        --i;
        ++track;
        bit <<= 1;
    }
    mplayInfo->ident = ID_NUMBER;
}

void m4aMPlayPanpotControl(struct MusicPlayerInfo *mplayInfo, u16 trackBits, s8 pan)
{
    s32 i;
    u32 bit;
    struct MusicPlayerTrack *track;

#if !ENABLE_AUDIO
    return;
#endif

    if (mplayInfo->ident != ID_NUMBER)
        return;
    ++mplayInfo->ident;
    i = mplayInfo->trackCount;
    track = mplayInfo->tracks;
    bit = 1;
    while (i > 0) {
        if (trackBits & bit) {
            if (track->flags & MPT_FLG_EXIST) {
                track->panX = pan;
                track->flags |= MPT_FLG_VOLCHG;
            }
        }
        --i;
        ++track;
        bit <<= 1;
    }
    mplayInfo->ident = ID_NUMBER;
}

void ClearModM(struct MusicPlayerTrack *track)
{
    track->lfoSpeedC = 0;
    track->modM = 0;
    if (track->modT == 0)
        track->flags |= MPT_FLG_PITCHG;
    else
        track->flags |= MPT_FLG_VOLCHG;
}

void m4aMPlayModDepthSet(struct MusicPlayerInfo *mplayInfo, u16 trackBits, u8 modDepth)
{
    s32 i;
    u32 bit;
    struct MusicPlayerTrack *track;

#if !ENABLE_AUDIO
    return;
#endif

    if (mplayInfo->ident != ID_NUMBER)
        return;
    ++mplayInfo->ident;
    i = mplayInfo->trackCount;
    track = mplayInfo->tracks;
    bit = 1;
    while (i > 0) {
        if (trackBits & bit) {
            if (track->flags & MPT_FLG_EXIST) {
                track->mod = modDepth;
                if (!track->mod)
                    ClearModM(track);
            }
        }
        --i;
        ++track;
        bit <<= 1;
    }
    mplayInfo->ident = ID_NUMBER;
}

void m4aMPlayLFOSpeedSet(struct MusicPlayerInfo *mplayInfo, u16 trackBits, u8 lfoSpeed)
{
    s32 i;
    u32 bit;
    struct MusicPlayerTrack *track;

#if !ENABLE_AUDIO
    return;
#endif

    if (mplayInfo->ident != ID_NUMBER)
        return;
    ++mplayInfo->ident;
    i = mplayInfo->trackCount;
    track = mplayInfo->tracks;
    bit = 1;
    while (i > 0) {
        if (trackBits & bit) {
            if (track->flags & MPT_FLG_EXIST) {
                track->lfoSpeed = lfoSpeed;

                if (!track->lfoSpeed)
                    ClearModM(track);
            }
        }
        --i;
        ++track;
        bit <<= 1;
    }

    mplayInfo->ident = ID_NUMBER;
}

#define MEMACC_COND_JUMP(cond)                                                                                                             \
    if (cond)                                                                                                                              \
        goto cond_true;                                                                                                                    \
    else                                                                                                                                   \
        goto cond_false;

void ply_memacc(struct MusicPlayerInfo *mplayInfo, struct MusicPlayerTrack *track)
{
    u32 op;
    u8 *addr;
    u8 data;

    op = *track->cmdPtr;
    ++track->cmdPtr;
    addr = mplayInfo->memAccArea + *track->cmdPtr;
    ++track->cmdPtr;
    data = *track->cmdPtr;
    ++track->cmdPtr;
    switch (op) {
        case 0:
            *addr = data;
            return;
        case 1:
            *addr += data;
            return;
        case 2:
            *addr -= data;
            return;
        case 3:
            *addr = mplayInfo->memAccArea[data];
            return;
        case 4:
            *addr += mplayInfo->memAccArea[data];
            return;
        case 5:
            *addr -= mplayInfo->memAccArea[data];
            return;
        case 6:
            MEMACC_COND_JUMP(*addr == data)
            return;
        case 7:
            MEMACC_COND_JUMP(*addr != data)
            return;
        case 8:
            MEMACC_COND_JUMP(*addr > data)
            return;
        case 9:
            MEMACC_COND_JUMP(*addr >= data)
            return;
        case 10:
            MEMACC_COND_JUMP(*addr <= data)
            return;
        case 11:
            MEMACC_COND_JUMP(*addr < data)
            return;
        case 12:
            MEMACC_COND_JUMP(*addr == mplayInfo->memAccArea[data])
            return;
        case 13:
            MEMACC_COND_JUMP(*addr != mplayInfo->memAccArea[data])
            return;
        case 14:
            MEMACC_COND_JUMP(*addr > mplayInfo->memAccArea[data])
            return;
        case 15:
            MEMACC_COND_JUMP(*addr >= mplayInfo->memAccArea[data])
            return;
        case 16:
            MEMACC_COND_JUMP(*addr <= mplayInfo->memAccArea[data])
            return;
        case 17:
            MEMACC_COND_JUMP(*addr < mplayInfo->memAccArea[data])
            return;
        default:
            return;
    }
cond_true : {
    void (*func)(struct MusicPlayerInfo *, struct MusicPlayerTrack *) = *(&gMPlayJumpTable[1]);
    func(mplayInfo, track);
    return;
}
cond_false:
    track->cmdPtr += 4;
}

void ply_xcmd(struct MusicPlayerInfo *mplayInfo, struct MusicPlayerTrack *track)
{
    u32 n = *track->cmdPtr;

    ++track->cmdPtr;
    gXcmdTable[n](mplayInfo, track);
}

void ply_xxx(struct MusicPlayerInfo *mplayInfo, struct MusicPlayerTrack *track)
{
    void (*func)(struct MusicPlayerInfo *, struct MusicPlayerTrack *) = *(&gMPlayJumpTable[0]);

    func(mplayInfo, track);
}

#define READ_XCMD_BYTE(var, n)                                                                                                             \
    {                                                                                                                                      \
        u32 byte = track->cmdPtr[(n)];                                                                                                     \
        byte <<= n * 8;                                                                                                                    \
        (var) &= ~(0xFF << (n * 8));                                                                                                       \
        (var) |= byte;                                                                                                                     \
    }

void ply_xwave(struct MusicPlayerInfo *mplayInfo, struct MusicPlayerTrack *track)
{
    uintptr_t wav;

    READ_XCMD_BYTE(wav, 0) // UB: uninitialized variable
    READ_XCMD_BYTE(wav, 1)
    READ_XCMD_BYTE(wav, 2)
    READ_XCMD_BYTE(wav, 3)
    track->tone.wav = (struct WaveData *)wav;
    track->cmdPtr += 4;
}

void ply_xtype(struct MusicPlayerInfo *mplayInfo, struct MusicPlayerTrack *track)
{
    track->tone.type = *track->cmdPtr;
    ++track->cmdPtr;
}

void ply_xatta(struct MusicPlayerInfo *mplayInfo, struct MusicPlayerTrack *track)
{
    track->tone.attack = *track->cmdPtr;
    ++track->cmdPtr;
}

void ply_xdeca(struct MusicPlayerInfo *mplayInfo, struct MusicPlayerTrack *track)
{
    track->tone.decay = *track->cmdPtr;
    ++track->cmdPtr;
}

void ply_xsust(struct MusicPlayerInfo *mplayInfo, struct MusicPlayerTrack *track)
{
    track->tone.sustain = *track->cmdPtr;
    ++track->cmdPtr;
}

void ply_xrele(struct MusicPlayerInfo *mplayInfo, struct MusicPlayerTrack *track)
{
    track->tone.release = *track->cmdPtr;
    ++track->cmdPtr;
}

void ply_xiecv(struct MusicPlayerInfo *mplayInfo, struct MusicPlayerTrack *track)
{
    track->echoVolume = *track->cmdPtr;
    ++track->cmdPtr;
}

void ply_xiecl(struct MusicPlayerInfo *mplayInfo, struct MusicPlayerTrack *track)
{
    track->echoLength = *track->cmdPtr;
    ++track->cmdPtr;
}

void ply_xleng(struct MusicPlayerInfo *mplayInfo, struct MusicPlayerTrack *track)
{
    track->tone.length = *track->cmdPtr;
    ++track->cmdPtr;
}

void ply_xswee(struct MusicPlayerInfo *mplayInfo, struct MusicPlayerTrack *track)
{
    track->tone.pan_sweep = *track->cmdPtr;
    ++track->cmdPtr;
}

static void DummyCallback(void) { }
