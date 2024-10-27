#ifndef GUARD_GBA_M4A_INTERNAL_H
#define GUARD_GBA_M4A_INTERNAL_H

#include "gba/gba.h"
#if PORTABLE
#include "music_player.h"
#endif

// ASCII encoding of 'Smsh' in reverse
// This is presumably short for SMASH, the developer of MKS4AGB.
#define ID_NUMBER 0x68736D53

#define C_V 0x40 // center value for PAN, BEND, and TUNE

#define SOUND_MODE_REVERB_VAL   0x0000007F
#define SOUND_MODE_REVERB_SET   0x00000080
#define SOUND_MODE_MAXCHN       0x00000F00
#define SOUND_MODE_MAXCHN_SHIFT 8
#define SOUND_MODE_MASVOL       0x0000F000
#define SOUND_MODE_MASVOL_SHIFT 12
#define SOUND_MODE_FREQ_05734   0x00010000
#define SOUND_MODE_FREQ_07884   0x00020000
#define SOUND_MODE_FREQ_10512   0x00030000
#define SOUND_MODE_FREQ_13379   0x00040000
#define SOUND_MODE_FREQ_15768   0x00050000
#define SOUND_MODE_FREQ_18157   0x00060000
#define SOUND_MODE_FREQ_21024   0x00070000
#define SOUND_MODE_FREQ_26758   0x00080000
#define SOUND_MODE_FREQ_31536   0x00090000
#define SOUND_MODE_FREQ_36314   0x000A0000
#define SOUND_MODE_FREQ_40137   0x000B0000
#define SOUND_MODE_FREQ_42048   0x000C0000
#define SOUND_MODE_FREQ         0x000F0000
#define SOUND_MODE_FREQ_SHIFT   16
#define SOUND_MODE_DA_BIT_9     0x00800000
#define SOUND_MODE_DA_BIT_8     0x00900000
#define SOUND_MODE_DA_BIT_7     0x00A00000
#define SOUND_MODE_DA_BIT_6     0x00B00000
#define SOUND_MODE_DA_BIT       0x00B00000
#define SOUND_MODE_DA_BIT_SHIFT 20

#define DEFAULT_SOUND_MODE (SOUND_MODE_DA_BIT_8 | SOUND_MODE_FREQ_10512 | (15 << SOUND_MODE_MASVOL_SHIFT) | (5 << SOUND_MODE_MAXCHN_SHIFT))

struct WaveData {
    u16 type;
    u16 status;
    u32 freq;
    u32 loopStart;
    u32 size; // number of samples
    s8 data[1]; // samples
};

#define TONEDATA_TYPE_CGB 0x07
#define TONEDATA_TYPE_FIX 0x08
#define TONEDATA_TYPE_SPL 0x40 // key split
#define TONEDATA_TYPE_RHY 0x80 // rhythm

#define TONEDATA_P_S_PAN 0xc0
#define TONEDATA_P_S_PAM TONEDATA_P_S_PAN

struct ToneData {
    u8 type;
    u8 key;
    u8 length; // sound length (compatible sound)
    u8 pan_sweep; // pan or sweep (compatible sound ch. 1)
    struct WaveData *wav;
    u8 attack;
    u8 decay;
    u8 sustain;
    u8 release;
};

#define SOUND_CHANNEL_SF_START       0x80
#define SOUND_CHANNEL_SF_STOP        0x40
#define SOUND_CHANNEL_SF_LOOP        0x10
#define SOUND_CHANNEL_SF_IEC         0x04
#define SOUND_CHANNEL_SF_ENV         0x03
#define SOUND_CHANNEL_SF_ENV_ATTACK  0x03
#define SOUND_CHANNEL_SF_ENV_DECAY   0x02
#define SOUND_CHANNEL_SF_ENV_SUSTAIN 0x01
#define SOUND_CHANNEL_SF_ENV_RELEASE 0x00
#define SOUND_CHANNEL_SF_ON          (SOUND_CHANNEL_SF_START | SOUND_CHANNEL_SF_STOP | SOUND_CHANNEL_SF_IEC | SOUND_CHANNEL_SF_ENV)

#define CGB_CHANNEL_MO_PIT 0x02
#define CGB_CHANNEL_MO_VOL 0x01

#define CGB_NRx2_ENV_DIR_DEC 0x00
#define CGB_NRx2_ENV_DIR_INC 0x08

struct CgbChannel {
    u8 statusFlags;
    u8 type;
    u8 rightVolume;
    u8 leftVolume;
    u8 attack;
    u8 decay;
    u8 sustain;
    u8 release;
    u8 key;
    u8 envelopeVolume;
    u8 envelopeGoal;
    u8 envelopeCounter;
    u8 pseudoEchoVolume;
    u8 pseudoEchoLength;
    u8 dummy1;
    u8 dummy2;
    u8 gateTime;
    u8 midiKey;
    u8 velocity;
    u8 priority;
    u8 rhythmPan;
    u8 dummy3[3];
    u8 dummy5;
    u8 sustainGoal;
    u8 n4; // NR[1-4]4 register (initial, length bit)
    u8 pan;
    u8 panMask;
    u8 modify;
    u8 length;
    u8 sweep;
    u32 frequency;
    u32 *wavePointer; // instructs CgbMain to load targeted wave
    u32 *currentPointer; // stores the currently loaded wave
    struct MP2KTrack *track;
    void *prevChannelPointer;
    void *nextChannelPointer;
    u8 dummy4[8];
};

struct MP2KTrack;

struct SoundChannel {
    u8 statusFlags;
    u8 type;
    u8 rightVolume;
    u8 leftVolume;
    u8 attack;
    u8 decay;
    u8 sustain;
    u8 release;
    u8 key; // midi key as it was translated into final pitch
    u8 envelopeVolume;
    u8 envelopeVolumeRight;
    u8 envelopeVolumeLeft;
    u8 pseudoEchoVolume;
    u8 pseudoEchoLength;
    u8 dummy1;
    u8 dummy2;
    u8 gateTime;
    u8 midiKey; // midi key as it was used in the track data
    u8 velocity;
    u8 priority;
    u8 rhythmPan;
    u8 dummy3[3];
    u32 count;
    float fw;
    u32 frequency;
    struct WaveData *wav;
    s8 *currentPointer;
    struct MP2KTrack *track;
    void *prevChannelPointer;
    void *nextChannelPointer;
    u32 dummy4;
    u32 blockCount;
};

#define MAX_DIRECTSOUND_CHANNELS 12
#if !PORTABLE
#define PCM_DMA_BUF_SIZE 1584 // size of Direct Sound buffer
#else
#define PCM_DMA_BUF_SIZE 4907 // size of Direct Sound buffer
#endif

struct MP2KPlayerState;

typedef void (*MPlayFunc)();
typedef void (*PlyNoteFunc)(u32, struct MP2KPlayerState *, struct MP2KTrack *);
typedef void (*CgbSoundFunc)(void);
typedef void (*CgbOscOffFunc)(u8);
typedef u32 (*MidiKeyToCgbFreqFunc)(u8, u8, u8);
typedef void (*ExtVolPitFunc)(void);
typedef void (*MPlayMainFunc)(struct MP2KPlayerState *);

struct SoundInfo {
    // This field is normally equal to ID_NUMBER but it is set to other
    // values during sensitive operations for locking purposes.
    // This field should be volatile but isn't. This could potentially cause
    // race conditions.
    u32 ident;

    vu8 pcmDmaCounter;

    // Direct Sound
    u8 reverb;
    u8 maxChans;
    u8 masterVolume;
    u8 freq;

    u8 mode;
    u8 c15; // periodically counts from 14 down to 0 (15 states)
    u8 pcmDmaPeriod; // number of V-blanks per PCM DMA
    u8 maxLines;
    u8 gap[3];
    s32 pcmSamplesPerVBlank;
    s32 pcmFreq;
#if !PORTABLE
    s32 divFreq;
#else
    float divFreq;
#endif
    struct CgbChannel *cgbChans;
    MPlayMainFunc MPlayMainHead;
    struct MP2KPlayerState *musicPlayerHead;
    CgbSoundFunc CgbSound;
    CgbOscOffFunc CgbOscOff;
    MidiKeyToCgbFreqFunc MidiKeyToCgbFreq;
    MPlayFunc *MPlayJumpTable;
    PlyNoteFunc plynote;
    ExtVolPitFunc ExtVolPit;
    u8 gap2[16];
    struct SoundChannel chans[MAX_DIRECTSOUND_CHANNELS];
#if !PORTABLE
    s8 pcmBuffer[PCM_DMA_BUF_SIZE * 2];
#else
    float pcmBuffer[PCM_DMA_BUF_SIZE * 2];
#endif
};

struct SongHeader {
    u8 trackCount;
    u8 blockCount;
    u8 priority;
    u8 reverb;
    struct ToneData *tone;
    u8 *part[1];
};

struct PokemonCrySong {
    u8 trackCount;
    u8 blockCount;
    u8 priority;
    u8 reverb;
    struct ToneData *tone;
    u8 *part[2];
    u8 gap;
    u8 part0; // 0x11
    u8 tuneValue; // 0x12
    u8 gotoCmd; // 0x13
    u32 gotoTarget; // 0x14
    u8 part1; // 0x18
    u8 tuneValue2; // 0x19
    u8 cont[2]; // 0x1A
    u8 volCmd; // 0x1C
    u8 volumeValue; // 0x1D
    u8 unkCmd0D[2]; // 0x1E
    u32 unkCmd0DParam; // 0x20
    u8 xreleCmd[2]; // 0x24
    u8 releaseValue; // 0x26
    u8 panCmd;
    u8 panValue; // 0x28
    u8 tieCmd; // 0x29
    u8 tieKeyValue; // 0x2A
    u8 tieVelocityValue; // 0x2B
    u8 unkCmd0C[2]; // 0x2C
    u16 unkCmd0CParam; // 0x2E
    u8 end[2]; // 0x30
};

#define MPT_FLG_VOLSET 0x01
#define MPT_FLG_VOLCHG 0x03
#define MPT_FLG_PITSET 0x04
#define MPT_FLG_PITCHG 0x0C
#define MPT_FLG_START  0x40
#define MPT_FLG_EXIST  0x80

struct MP2KTrack {
    u8 flags;
    u8 wait;
    u8 patternLevel;
    u8 repN;
    u8 gateTime;
    u8 key;
    u8 velocity;
    u8 runningStatus;
    u8 keyM;
    u8 pitM;
    s8 keyShift;
    s8 keyShiftX;
    s8 tune;
    u8 pitX;
    s8 bend;
    u8 bendRange;
    u8 volMR;
    u8 volML;
    u8 vol;
    u8 volX;
    s8 pan;
    s8 panX;
    s8 modM;
    u8 mod;
    u8 modT;
    u8 lfoSpeed;
    u8 lfoSpeedC;
    u8 lfoDelay;
    u8 lfoDelayC;
    u8 priority;
    u8 pseudoEchoVolume;
    u8 pseudoEchoLength;
    struct SoundChannel *chan;
    struct ToneData tone;
    u8 gap[10];
    u16 unk_3A;
    u32 unk_3C;
    u8 *cmdPtr;
    u8 *patternStack[3];
};

#define MUSICPLAYER_STATUS_TRACK 0x0000ffff
#define MUSICPLAYER_STATUS_PAUSE 0x80000000

#define MAX_MUSICPLAYER_TRACKS 16

#define TRACKS_ALL 0xFFFF

#define TEMPORARY_FADE 0x0001
#define FADE_IN        0x0002
#define FADE_VOL_MAX   64
#define FADE_VOL_SHIFT 2

struct MP2KPlayerState {
    struct SongHeader *songHeader;
    u32 status;
    u8 trackCount;
    u8 priority;
    u8 cmd;
    u8 unk_B;
    u32 clock;
    u8 gap[8];
    u8 *memAccArea;
    u16 tempoD;
    u16 tempoU;
    u16 tempoI;
    u16 tempoC;
    u16 fadeOI;
    u16 fadeOC;
    u16 fadeOV;
    struct MP2KTrack *tracks;
    struct ToneData *tone;
    u32 ident;
    MPlayMainFunc MPlayMainNext;
    struct MP2KPlayerState *musicPlayerNext;
};

struct MusicPlayer {
    struct MP2KPlayerState *info;
    struct MP2KTrack *track;
    u8 numTracks;
    u16 unk_A;
};

struct Song {
    struct SongHeader *header;
    u16 ms;
    u16 me;
};

extern const struct MusicPlayer gMPlayTable[];
extern const struct Song gSongTable[];

extern u8 gMPlayMemAccArea[];

extern char SoundMainRAM[];

extern MPlayFunc gMPlayJumpTable[];

typedef void (*XcmdFunc)(struct MP2KPlayerState *, struct MP2KTrack *);
extern const XcmdFunc gXcmdTable[];

extern struct CgbChannel gCgbChans[];

extern const u8 gScaleTable[];
extern const u32 gFreqTable[];
extern const u16 gPcmSamplesPerVBlankTable[];

extern const u8 gCgbScaleTable[];
extern const s16 gCgbFreqTable[];
extern const u8 gNoiseTable[];

extern const struct ToneData voicegroup000;

#if !PORTABLE
extern char gNumMusicPlayers[];
extern char gMaxLines[];
#define NUM_MUSIC_PLAYERS ((u16)gNumMusicPlayers)
#define MAX_LINES         ((u32)gMaxLines)
#else
#define NUM_MUSIC_PLAYERS 4
#define MAX_LINES         0
#endif

u32 umul3232H32(u32 multiplier, u32 multiplicand);
void SoundMain(void);
void SoundMainBTM(void *ptr);
void TrackStop(struct MP2KPlayerState *player, struct MP2KTrack *track);
void MPlayMain(struct MP2KPlayerState *);
void RealClearChain(void *x);

void MPlayContinue(struct MP2KPlayerState *mplayInfo);
void MPlayStart(struct MP2KPlayerState *mplayInfo, struct SongHeader *songHeader);
void MPlayStop(struct MP2KPlayerState *mplayInfo);
void FadeOutBody(struct MP2KPlayerState *mplayInfo);
void TrkVolPitSet(struct MP2KPlayerState *mplayInfo, struct MP2KTrack *track);
void MPlayFadeOut(struct MP2KPlayerState *mplayInfo, u16 speed);
void Clear64byte(void *addr);
void SoundInit(struct SoundInfo *soundInfo);
void MPlayExtender(struct CgbChannel *cgbChans);
void m4aSoundMode(u32 mode);
void MPlayOpen(struct MP2KPlayerState *mplayInfo, struct MP2KTrack *tracks, u8 trackCount);
void CgbSound(void);
void CgbOscOff(u8);
void CgbModVol(struct CgbChannel *chan);
u32 MidiKeyToCgbFreq(u8, u8, u8);
void MPlayJumpTableCopy(void **mplayJumpTable);
void SampleFreqSet(u32 freq);
void m4aSoundVSyncOn(void);
void m4aSoundVSyncOff(void);

void m4aMPlayTempoControl(struct MP2KPlayerState *mplayInfo, u16 tempo);
void m4aMPlayVolumeControl(struct MP2KPlayerState *mplayInfo, u16 trackBits, u16 volume);
void m4aMPlayPitchControl(struct MP2KPlayerState *mplayInfo, u16 trackBits, s16 pitch);
void m4aMPlayPanpotControl(struct MP2KPlayerState *mplayInfo, u16 trackBits, s8 pan);
void ClearModM(struct MP2KTrack *track);
void m4aMPlayModDepthSet(struct MP2KPlayerState *mplayInfo, u16 trackBits, u8 modDepth);
void m4aMPlayLFOSpeedSet(struct MP2KPlayerState *mplayInfo, u16 trackBits, u8 lfoSpeed);

#if !PORTABLE
void ClearChain(void *x);

// sound command handler functions
void ply_fine(struct MP2KPlayerState *, struct MP2KTrack *);
void ply_goto(struct MP2KPlayerState *, struct MP2KTrack *);
void ply_patt(struct MP2KPlayerState *, struct MP2KTrack *);
void ply_pend(struct MP2KPlayerState *, struct MP2KTrack *);
void ply_rept(struct MP2KPlayerState *, struct MP2KTrack *);
void ply_memacc(struct MP2KPlayerState *, struct MP2KTrack *);
void ply_prio(struct MP2KPlayerState *, struct MP2KTrack *);
void ply_tempo(struct MP2KPlayerState *, struct MP2KTrack *);
void ply_keysh(struct MP2KPlayerState *, struct MP2KTrack *);
void ply_voice(struct MP2KPlayerState *, struct MP2KTrack *);
void ply_vol(struct MP2KPlayerState *, struct MP2KTrack *);
void ply_pan(struct MP2KPlayerState *, struct MP2KTrack *);
void ply_bend(struct MP2KPlayerState *, struct MP2KTrack *);
void ply_bendr(struct MP2KPlayerState *, struct MP2KTrack *);
void ply_lfos(struct MP2KPlayerState *, struct MP2KTrack *);
void ply_lfodl(struct MP2KPlayerState *, struct MP2KTrack *);
void ply_mod(struct MP2KPlayerState *, struct MP2KTrack *);
void ply_modt(struct MP2KPlayerState *, struct MP2KTrack *);
void ply_tune(struct MP2KPlayerState *, struct MP2KTrack *);
void ply_port(struct MP2KPlayerState *, struct MP2KTrack *);
void ply_xcmd(struct MP2KPlayerState *, struct MP2KTrack *);
void ply_endtie(struct MP2KPlayerState *, struct MP2KTrack *);
void ply_note(struct MP2KPlayerState *, struct MP2KTrack *);

// extended sound command handler functions
void ply_xxx(struct MP2KPlayerState *, struct MP2KTrack *);
void ply_xwave(struct MP2KPlayerState *, struct MP2KTrack *);
void ply_xtype(struct MP2KPlayerState *, struct MP2KTrack *);
void ply_xatta(struct MP2KPlayerState *, struct MP2KTrack *);
void ply_xdeca(struct MP2KPlayerState *, struct MP2KTrack *);
void ply_xsust(struct MP2KPlayerState *, struct MP2KTrack *);
void ply_xrele(struct MP2KPlayerState *, struct MP2KTrack *);
void ply_xiecv(struct MP2KPlayerState *, struct MP2KTrack *);
void ply_xiecl(struct MP2KPlayerState *, struct MP2KTrack *);
void ply_xleng(struct MP2KPlayerState *, struct MP2KTrack *);
void ply_xswee(struct MP2KPlayerState *, struct MP2KTrack *);
void ply_xcmd_0C(struct MP2KPlayerState *, struct MP2KTrack *);
void ply_xcmd_0D(struct MP2KPlayerState *, struct MP2KTrack *);
#else
void MP2KClearChain(struct MixerSource *chan);

// sound command handler functions
void MP2K_event_fine(struct MP2KPlayerState *, struct MP2KTrack *);
void MP2K_event_goto(struct MP2KPlayerState *, struct MP2KTrack *);
void MP2K_event_patt(struct MP2KPlayerState *, struct MP2KTrack *);
void MP2K_event_pend(struct MP2KPlayerState *, struct MP2KTrack *);
void MP2K_event_rept(struct MP2KPlayerState *, struct MP2KTrack *);
void ply_memacc(struct MP2KPlayerState *, struct MP2KTrack *);
void MP2K_event_prio(struct MP2KPlayerState *, struct MP2KTrack *);
void MP2K_event_tempo(struct MP2KPlayerState *, struct MP2KTrack *);
void MP2K_event_keysh(struct MP2KPlayerState *, struct MP2KTrack *);
void MP2K_event_voice(struct MP2KPlayerState *, struct MP2KTrack *);
void MP2K_event_vol(struct MP2KPlayerState *, struct MP2KTrack *);
void MP2K_event_pan(struct MP2KPlayerState *, struct MP2KTrack *);
void MP2K_event_bend(struct MP2KPlayerState *, struct MP2KTrack *);
void MP2K_event_bendr(struct MP2KPlayerState *, struct MP2KTrack *);
void MP2K_event_lfos(struct MP2KPlayerState *, struct MP2KTrack *);
void MP2K_event_lfodl(struct MP2KPlayerState *, struct MP2KTrack *);
void MP2K_event_mod(struct MP2KPlayerState *, struct MP2KTrack *);
void MP2K_event_modt(struct MP2KPlayerState *, struct MP2KTrack *);
void MP2K_event_tune(struct MP2KPlayerState *, struct MP2KTrack *);
void MP2K_event_port(struct MP2KPlayerState *, struct MP2KTrack *);
void ply_xcmd(struct MP2KPlayerState *, struct MP2KTrack *);
void MP2K_event_endtie(struct MP2KPlayerState *, struct MP2KTrack *);
void ply_note(struct MP2KPlayerState *, struct MP2KTrack *);

// extended sound command handler functions
void ply_xxx(struct MP2KPlayerState *, struct MP2KTrack *);
void ply_xwave(struct MP2KPlayerState *, struct MP2KTrack *);
void ply_xtype(struct MP2KPlayerState *, struct MP2KTrack *);
void ply_xatta(struct MP2KPlayerState *, struct MP2KTrack *);
void ply_xdeca(struct MP2KPlayerState *, struct MP2KTrack *);
void ply_xsust(struct MP2KPlayerState *, struct MP2KTrack *);
void ply_xrele(struct MP2KPlayerState *, struct MP2KTrack *);
void ply_xiecv(struct MP2KPlayerState *, struct MP2KTrack *);
void ply_xiecl(struct MP2KPlayerState *, struct MP2KTrack *);
void ply_xleng(struct MP2KPlayerState *, struct MP2KTrack *);
void ply_xswee(struct MP2KPlayerState *, struct MP2KTrack *);
void ply_xcmd_0C(struct MP2KPlayerState *, struct MP2KTrack *);
void ply_xcmd_0D(struct MP2KPlayerState *, struct MP2KTrack *);
#endif

#endif // GUARD_GBA_M4A_INTERNAL_H
