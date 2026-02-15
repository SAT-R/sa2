#include "global.h"

#include "lib/m4a/m4a_internal.h"

#include "platform/platform.h"
#include "platform/shared/audio/cgb_audio.h"

static inline void GenerateAudio(struct SoundMixerState *mixer, struct MixerSource *chan, struct WaveData *wav, float *pcmBuffer,
                                 u16 samplesPerFrame, float sampleRateReciprocal);
static void SampleMixer(struct SoundMixerState *mixer, u32 scanlineLimit, u16 samplesPerFrame, float *pcmBuffer, u8 dmaCounter,
                        u16 maxBufSize);
static inline bool32 TickEnvelope(struct MixerSource *chan, struct WaveData *wav);
static void ChnVolSetAsm(struct MixerSource *chan, struct MP2KTrack *track);

#define VCOUNT_VBLANK   160
#define TOTAL_SCANLINES 228

#ifndef __has_builtin
#define __has_builtin(x) defined(__GNUC__)
#endif

#if ((-1 >> 1) == -1) && __has_builtin(__builtin_ctz)
#define FLOOR_DIV_POW2(a, b) ((a) >> __builtin_ctz(b))
#else
#define FLOOR_DIV_POW2(a, b) ((a) > 0 ? (a) / (b) : (((a) + 1 - (b)) / (b)))
#endif

static float audioBuffer[PCM_DMA_BUF_SIZE];
static struct SoundMixerState sSoundInfo = { 0 };
struct SoundMixerState *SOUND_INFO_PTR = &sSoundInfo;

void SoundMain(void)
{
    struct SoundMixerState *mixer = SOUND_INFO_PTR;

    if (mixer->lockStatus != ID_NUMBER) {
        return;
    }
    mixer->lockStatus++;

    u32 maxScanlines = mixer->maxScanlines;
    if (mixer->maxScanlines != 0) {
        u32 vcount = REG_VCOUNT;
        maxScanlines += vcount;
        if (vcount < VCOUNT_VBLANK) {
            maxScanlines += TOTAL_SCANLINES;
        }
    }

    if (mixer->MPlayMainHead != NULL) {
        mixer->MPlayMainHead(mixer->musicPlayerHead);
    }

    mixer->CgbSound();

    s32 samplesPerFrame = mixer->samplesPerFrame;
    float *pcmBuffer = mixer->pcmBuffer;
    s32 dmaCounter = mixer->dmaCounter;

    if (dmaCounter > 1) {
        pcmBuffer += samplesPerFrame * (mixer->framesPerDmaCycle - (dmaCounter - 1)) * 2;
    }

    SampleMixer(mixer, maxScanlines, samplesPerFrame, pcmBuffer, dmaCounter, PCM_DMA_BUF_SIZE);
    cgb_audio_generate(samplesPerFrame);
}

static void SampleMixer(struct SoundMixerState *mixer, u32 scanlineLimit, u16 samplesPerFrame, float *pcmBuffer, u8 dmaCounter,
                        u16 maxBufSize)
{
    u32 reverb = mixer->reverb;
    if (reverb) {
        // The vanilla reverb effect outputs a mono sound from four sources:
        //  - L/R channels as they were mixer->framesPerDmaCycle frames ago
        //  - L/R channels as they were (mixer->framesPerDmaCycle - 1) frames ago
        float *tmp1 = pcmBuffer;
        float *tmp2;
        if (dmaCounter == 2) {
            tmp2 = mixer->pcmBuffer;
        } else {
            tmp2 = pcmBuffer + samplesPerFrame * 2;
        }
        u16 i = 0;
        do {
            float s = tmp1[0] + tmp1[1] + tmp2[0] + tmp2[1];
            s *= ((float)reverb / 512.0f);
            tmp1[0] = tmp1[1] = s;
            tmp1 += 2;
            tmp2 += 2;
        } while (++i < samplesPerFrame);
    } else {
        // memset(pcmBuffer, 0, samplesPerFrame);
        // memset(pcmBuffer + maxBufSize, 0, samplesPerFrame);
        for (int i = 0; i < samplesPerFrame; i++) {
            float *dst = &pcmBuffer[i * 2];
            dst[1] = dst[0] = 0.0f;
        }
    }

    float sampleRateReciprocal = mixer->sampleRateReciprocal;
    s8 numChans = mixer->numChans;
    struct MixerSource *chan = mixer->chans;

    for (int i = 0; i < numChans; i++, chan++) {
        struct WaveData *wav = chan->wav;

        if (scanlineLimit != 0) {
            u16 vcount = REG_VCOUNT;
            if (vcount < VCOUNT_VBLANK) {
                vcount += TOTAL_SCANLINES;
            }
            if (vcount >= scanlineLimit) {
                goto returnEarly;
            }
        }

        if (TickEnvelope(chan, wav)) {
            GenerateAudio(mixer, chan, wav, pcmBuffer, samplesPerFrame, sampleRateReciprocal);
        }
    }
returnEarly:
    mixer->lockStatus = ID_NUMBER;
}

// Returns TRUE if channel is still active after moving envelope forward a frame
//__attribute__((target("thumb")))
static inline bool32 TickEnvelope(struct MixerSource *chan, struct WaveData *wav)
{
    // MP2K envelope shape
    //                                                                 |
    // (linear)^                                                       |
    // Attack / \Decay (exponential)                                   |
    //       /   \_                                                    |
    //      /      '.,        Sustain                                  |
    //     /          '.______________                                 |
    //    /                           '-.       Echo (linear)          |
    //   /                 Release (exp) ''--..|\                      |
    //  /                                        \                     |

    u8 status = chan->status;
    if ((status & 0xC7) == 0) {
        return FALSE;
    }

    u8 env = 0;
    if ((status & 0x80) == 0) {
        env = chan->data.sound.envelopeVol;

        if (status & 4) {
            // Note-wise echo
            --chan->data.sound.echoVol;
            if (chan->data.sound.echoVol <= 0) {
                chan->status = 0;
                return FALSE;
            } else {
                return TRUE;
            }
        } else if (status & 0x40) {
            // Release
            chan->data.sound.envelopeVol = env * chan->data.sound.release / 256U;
            u8 echoVol = chan->data.sound.echoVol;
            if (chan->data.sound.envelopeVol > echoVol) {
                return TRUE;
            } else if (echoVol == 0) {
                chan->status = 0;
                return FALSE;
            } else {
                chan->status |= 4;
                return TRUE;
            }
        }

        switch (status & 3) {
            u16 newEnv;
            case 2:
                // Decay
                chan->data.sound.envelopeVol = env * chan->data.sound.decay / 256U;

                u8 sustain = chan->data.sound.sustain;
                if (chan->data.sound.envelopeVol <= sustain && sustain == 0) {
                    // Duplicated echo check from Release section above
                    if (chan->data.sound.echoVol == 0) {
                        chan->status = 0;
                        return FALSE;
                    } else {
                        chan->status |= 4;
                        return TRUE;
                    }
                } else if (chan->data.sound.envelopeVol <= sustain) {
                    chan->data.sound.envelopeVol = sustain;
                    --chan->status;
                }
                break;
            case 3:
            attack:
                newEnv = env + chan->data.sound.attack;
                if (newEnv > 0xFF) {
                    chan->data.sound.envelopeVol = 0xFF;
                    --chan->status;
                } else {
                    chan->data.sound.envelopeVol = newEnv;
                }
                break;
            case 1: // Sustain
            default:
                break;
        }

        return TRUE;
    } else if (status & 0x40) {
        // Init and stop cancel each other out
        chan->status = 0;
        return FALSE;
    } else {
        // Init channel
        chan->status = 3;
        chan->current = wav->data;
        chan->data.sound.ct = wav->size;
        chan->data.sound.fw = 0;
        chan->data.sound.envelopeVol = 0;
        if ((wav->status >> 8) & 0xC0) {
            chan->status |= 0x10;
        }
        goto attack;
    }
}

static inline void GenerateAudio(struct SoundMixerState *mixer, struct MixerSource *chan, struct WaveData *wav, float *pcmBuffer,
                                 u16 samplesPerFrame, float sampleRateReciprocal)
{ /*, [[[]]]) {*/
    u8 v = chan->data.sound.envelopeVol * (mixer->masterVol + 1) / 16U;
    chan->data.sound.envelopeVolR = chan->rightVol * v / 256U;
    chan->data.sound.envelopeVolL = chan->leftVol * v / 256U;

    s32 loopLen = 0;
    s8 *loopStart;
    if (chan->status & 0x10) {
        loopStart = wav->data + wav->loopStart;
        loopLen = wav->size - wav->loopStart;
    }
    s32 samplesLeftInWav = chan->data.sound.ct;
    s8 *current = chan->current;
    signed envR = chan->data.sound.envelopeVolR;
    signed envL = chan->data.sound.envelopeVolL;

    if (chan->type & TONEDATA_TYPE_CGB) {
        for (u16 i = 0; i < samplesPerFrame; i++, pcmBuffer += 2) {
            s8 c = *(current++);

            pcmBuffer[1] += (c * envR) / 32768.0f;
            pcmBuffer[0] += (c * envL) / 32768.0f;
            if (--samplesLeftInWav == 0) {
                samplesLeftInWav = loopLen;
                if (loopLen != 0) {
                    current = loopStart;
                } else {
                    chan->status = 0;
                    return;
                }
            }
        }

        chan->data.sound.ct = samplesLeftInWav;
        chan->current = current;
    } else {
        float finePos = chan->data.sound.fw;
        float romSamplesPerOutputSample = chan->data.sound.freq * sampleRateReciprocal;

        s16 b = current[0];
        s16 m = current[1] - b;
        current += 1;

        for (u16 i = 0; i < samplesPerFrame; i++, pcmBuffer += 2) {
            // Use linear interpolation to calculate a value between the current sample in the wav
            // and the next sample. Also cancel out the 9.23 stuff
            float sample = (finePos * m) + b;

            pcmBuffer[1] += (sample * envR) / 32768.0f;
            pcmBuffer[0] += (sample * envL) / 32768.0f;

            finePos += romSamplesPerOutputSample;
            u32 newCoarsePos = finePos;
            if (newCoarsePos != 0) {
                finePos -= (int)finePos;
                samplesLeftInWav -= newCoarsePos;
                if (samplesLeftInWav <= 0) {
                    if (loopLen != 0) {
                        current = loopStart;
                        newCoarsePos = -samplesLeftInWav;
                        samplesLeftInWav += loopLen;
                        while (samplesLeftInWav <= 0) {
                            newCoarsePos -= loopLen;
                            samplesLeftInWav += loopLen;
                        }
                        b = current[newCoarsePos];
                        m = current[newCoarsePos + 1] - b;
                        current += newCoarsePos + 1;
                    } else {
                        chan->status = 0;
                        return;
                    }
                } else {
                    b = current[newCoarsePos - 1];
                    m = current[newCoarsePos] - b;
                    current += newCoarsePos;
                }
            }
        }

        chan->data.sound.fw = finePos;
        chan->data.sound.ct = samplesLeftInWav;
        chan->current = current - 1;
    }
}

u32 umul3232H32(u32 a, u32 b)
{
    u64 result = a;
    result *= b;
    return result >> 32;
}

void SoundMainBTM(void *ptr) { CpuFill32(0, ptr, offsetof(struct MP2KTrack, cmdPtr)); }

// Removes chan from the doubly-linked list of channels associated with chan->track.
// Gonna rename this to like "FreeChannel" or something, similar to VGMS
void MP2KClearChain(struct MixerSource *chan)
{
    struct MP2KTrack *track = chan->track;
    if (chan->track == NULL) {
        return;
    }
    struct MixerSource *next = chan->next;
    struct MixerSource *prev = chan->prev;

    if (prev != NULL) {
        prev->next = next;
    } else {
        track->chan = next;
    }

    if (next != NULL) {
        next->prev = prev;
    }

    chan->track = NULL;
}

static u8 ConsumeTrackByte(struct MP2KTrack *track) { return *track->cmdPtr++; }

void MPlayJumpTableCopy(void **mplayJumpTable)
{
    for (u8 i = 0; i < 36; i++) {
        mplayJumpTable[i] = gMPlayJumpTableTemplate[i];
    }
}

// Ends the current track. (Fine as in the Italian musical word, not English)
void MP2K_event_fine(struct MP2KPlayerState *unused, struct MP2KTrack *track)
{
    struct MP2KTrack *r5 = track;
    for (struct MixerSource *chan = track->chan; chan != NULL; chan = chan->next) {
        if (chan->status & 0xC7) {
            chan->status |= 0x40;
        }
        ClearChain(chan);
    }
    track->status = 0;
}

// mPtr aligns to 4 bytes on MIPS; match that here before reading pointer data
#ifdef __mips__
static inline u8 *alignCmdPtr4(u8 *p) { return (u8 *)(((uintptr_t)p + 3) & ~(uintptr_t)3); }
#else
#define alignCmdPtr4(p) (p)
#endif

// Sets the track's cmdPtr to the specified address.
void MP2K_event_goto(struct MP2KPlayerState *unused, struct MP2KTrack *track)
{
    u8 *cmdPtr = alignCmdPtr4(track->cmdPtr);
    uintptr_t addr = 0;
    for (size_t i = sizeof(uintptr_t) - 1; i > 0; i--) {
        addr |= cmdPtr[i];
        addr <<= 8;
    }
    addr |= *cmdPtr;
    track->cmdPtr = (u8 *)addr;
}

// Sets the track's cmdPtr to the specified address after backing up its current position.
void MP2K_event_patt(struct MP2KPlayerState *unused, struct MP2KTrack *track)
{
    u8 level = track->patternLevel;
    if (level < 3) {
        // Return address is past the aligned pointer data
        u8 *ptrStart = alignCmdPtr4(track->cmdPtr);
        track->patternStack[level] = ptrStart + sizeof(u8 *);
        track->patternLevel++;
        MP2K_event_goto(unused, track);
    } else {
        // Stop playing this track, as an indication to the music programmer that they need to quit
        // nesting patterns so darn much.
        MP2K_event_fine(unused, track);
    }
}

// Marks the end of the current pattern, if there is one, by resetting the pattern to the
// most recently saved value.
void MP2K_event_pend(struct MP2KPlayerState *unused, struct MP2KTrack *track)
{
    if (track->patternLevel != 0) {
        u8 index = --track->patternLevel;
        track->cmdPtr = track->patternStack[index];
    }
}

// Loops back until a REPT event has been reached the specified number of times
void MP2K_event_rept(struct MP2KPlayerState *unused, struct MP2KTrack *track)
{
    if (*track->cmdPtr == 0) {
        // "Repeat 0 times" == loop forever
        track->cmdPtr++;
        MP2K_event_goto(unused, track);
    } else {
        u8 repeatCount = ++track->repeatCount;
        if (repeatCount < ConsumeTrackByte(track)) {
            MP2K_event_goto(unused, track);
        } else {
            track->repeatCount = 0;
            // Skip past the aligned pointer data
            u8 *ptrStart = alignCmdPtr4(track->cmdPtr);
            track->cmdPtr = ptrStart + sizeof(u8 *);
        }
    }
}

// Sets the note priority for new notes in this track.
void MP2K_event_prio(struct MP2KPlayerState *unused, struct MP2KTrack *track) { track->priority = ConsumeTrackByte(track); }

// Sets the BPM of all tracks to the specified tempo (in beats per half-minute, because 255 as a max tempo
// kinda sucks but 510 is plenty).
void MP2K_event_tempo(struct MP2KPlayerState *player, struct MP2KTrack *track)
{
    u16 bpm = ConsumeTrackByte(track);
    bpm *= 2;
    player->tempoRawBPM = bpm;
    player->tempoInterval = (bpm * player->tempoScale) / 256;
}

void MP2K_event_keysh(struct MP2KPlayerState *unused, struct MP2KTrack *track)
{
    track->keyShift = ConsumeTrackByte(track);
    track->status |= 0xC;
}

void MP2K_event_voice(struct MP2KPlayerState *player, struct MP2KTrack *track)
{
    u8 voice = *(track->cmdPtr++);
    struct MP2KVoiceGroup *voicegroup = &player->voicegroup[voice];
    track->voicegroup = *voicegroup;
}

void MP2K_event_vol(struct MP2KPlayerState *unused, struct MP2KTrack *track)
{
    track->vol = ConsumeTrackByte(track);
    track->status |= 0x3;
}

void MP2K_event_pan(struct MP2KPlayerState *unused, struct MP2KTrack *track)
{
    track->pan = ConsumeTrackByte(track) - 0x40;
    track->status |= 0x3;
}

void MP2K_event_bend(struct MP2KPlayerState *unused, struct MP2KTrack *track)
{
    track->bend = ConsumeTrackByte(track) - 0x40;
    track->status |= 0xC;
}

void MP2K_event_bendr(struct MP2KPlayerState *unused, struct MP2KTrack *track)
{
    track->bendRange = ConsumeTrackByte(track);
    track->status |= 0xC;
}

void MP2K_event_lfodl(struct MP2KPlayerState *unused, struct MP2KTrack *track) { track->lfoDelay = ConsumeTrackByte(track); }

void MP2K_event_modt(struct MP2KPlayerState *unused, struct MP2KTrack *track)
{
    u8 type = ConsumeTrackByte(track);
    if (type != track->modType) {
        track->modType = type;
        track->status |= 0xF;
    }
}

void MP2K_event_tune(struct MP2KPlayerState *unused, struct MP2KTrack *track)
{
    track->tune = ConsumeTrackByte(track) - 0x40;
    track->status |= 0xC;
}

void MP2K_event_port(struct MP2KPlayerState *unused, struct MP2KTrack *track)
{

    vu8 *offset = (vu8 *)(REG_ADDR_NR10 + *(track->cmdPtr++));
    *offset = ConsumeTrackByte(track);
}

void MP2KPlayerMain(struct MP2KPlayerState *player)
{
    struct SoundMixerState *mixer = SOUND_INFO_PTR;

    if (player->lockStatus != ID_NUMBER) {
        return;
    }
    player->lockStatus++;

    if (player->nextPlayerFunc != NULL) {
        player->nextPlayerFunc(player->nextPlayer);
    }

    if (player->status & MUSICPLAYER_STATUS_PAUSE) {
        goto returnEarly;
    }
    FadeOutBody(player);
    if (player->status & MUSICPLAYER_STATUS_PAUSE) {
        goto returnEarly;
    }

    player->tempoCounter += player->tempoInterval;
    while (player->tempoCounter >= 150) {
        u16 trackBits = 0;

        for (u32 i = 0; i < player->trackCount; i++) {
            struct MP2KTrack *currentTrack = player->tracks + i;
            struct MixerSource *chan;
            if ((currentTrack->status & MPT_FLG_EXIST) == 0) {
                continue;
            }
            trackBits |= (1 << i);

            chan = currentTrack->chan;
            while (chan != NULL) {
                if ((chan->status & SOUND_CHANNEL_SF_ON) == 0) {
                    ClearChain(chan);
                } else if (chan->data.sound.gateTime != 0 && --chan->data.sound.gateTime == 0) {
                    chan->status |= SOUND_CHANNEL_SF_STOP;
                }
                chan = chan->next;
            }

            if (currentTrack->status & MPT_FLG_START) {
                CpuFill32(0, currentTrack, offsetof(struct MP2KTrack, cmdPtr));
                currentTrack->status = MPT_FLG_EXIST;
                currentTrack->bendRange = 2;
                currentTrack->volPublic = 64;
                currentTrack->lfoSpeed = 22;
                currentTrack->voicegroup.type = 1;
            }

            while (currentTrack->wait == 0) {
                u8 event = *currentTrack->cmdPtr;
                if (event < 0x80) {
                    event = currentTrack->runningStatus;
                } else {
                    currentTrack->cmdPtr++;
                    if (event >= 0xBD) {
                        currentTrack->runningStatus = event;
                    }
                }

                if (event >= 0xCF) {
                    mixer->plynote(event - 0xCF, player, currentTrack);
                } else if (event >= 0xB1) {
                    player->cmd = event - 0xB1;
                    MP2KEventFunc eventFunc = mixer->MPlayJumpTable[player->cmd];
                    eventFunc(player, currentTrack);

                    if (currentTrack->status == 0) {
                        goto nextTrack;
                    }
                } else {
                    currentTrack->wait = gClockTable[event - 0x80];
                }
            }

            currentTrack->wait--;

            if (currentTrack->lfoSpeed != 0 && currentTrack->modDepth != 0) {
                if (currentTrack->lfoDelayCounter != 0U) {
                    currentTrack->lfoDelayCounter--;
                    goto nextTrack;
                }

                currentTrack->lfoSpeedCounter += currentTrack->lfoSpeed;

                s8 r;
                if (currentTrack->lfoSpeedCounter >= 0x40U && currentTrack->lfoSpeedCounter < 0xC0U) {
                    r = 128 - currentTrack->lfoSpeedCounter;
                } else if (currentTrack->lfoSpeedCounter >= 0xC0U) {
                    // Unsigned -> signed casts where the value is out of range are implementation defined.
                    // Why not add a few extra lines to make behavior the same for literally everyone?
                    r = currentTrack->lfoSpeedCounter - 256;
                } else {
                    r = currentTrack->lfoSpeedCounter;
                }
                r = FLOOR_DIV_POW2(currentTrack->modDepth * r, 64);

                if (r != currentTrack->modCalculated) {
                    currentTrack->modCalculated = r;
                    if (currentTrack->modType == 0) {
                        currentTrack->status |= MPT_FLG_PITCHG;
                    } else {
                        currentTrack->status |= MPT_FLG_VOLCHG;
                    }
                }
            }

        nextTrack:;
        }

        player->clock++;
        if (trackBits == 0) {
            player->status = MUSICPLAYER_STATUS_PAUSE;
            goto returnEarly;
        }
        player->status = trackBits;
        player->tempoCounter -= 150;
    }

    u32 i = 0;

    do {
        struct MP2KTrack *track = player->tracks + i;

        if ((track->status & MPT_FLG_EXIST) == 0 || (track->status & 0xF) == 0) {
            continue;
        }
        TrkVolPitSet(player, track);
        for (struct MixerSource *chan = track->chan; chan != NULL; chan = chan->next) {
            if ((chan->status & 0xC7) == 0) {
                ClearChain(chan);
                continue;
            }
            u8 cgbType = chan->type & TONEDATA_TYPE_CGB;
            if (track->status & MPT_FLG_VOLCHG) {
                ChnVolSetAsm(chan, track);
                if (cgbType != 0) {
                    chan->data.cgb.cgbStatus |= 1;
                }
            }
            if (track->status & MPT_FLG_PITCHG) {
                s32 key = chan->data.sound.key + track->keyShiftCalculated;
                if (key < 0) {
                    key = 0;
                }
                if (cgbType != 0) {
                    chan->data.cgb.freq = mixer->MidiKeyToCgbFreq(cgbType, key, track->pitchCalculated);
                    chan->data.cgb.cgbStatus |= 0x2;
                } else {
                    chan->data.sound.freq = MidiKeyToFreq(chan->wav, key, track->pitchCalculated);
                }
            }
        }
        track->status &= ~0xF;
    } while (++i < player->trackCount);
returnEarly:;
    player->lockStatus = ID_NUMBER;
}

void TrackStop(struct MP2KPlayerState *player, struct MP2KTrack *track)
{
    if (track->status & 0x80) {
        for (struct MixerSource *chan = track->chan; chan != NULL; chan = chan->next) {
            if (chan->status != 0) {
                u8 cgbType = chan->type & TONEDATA_TYPE_CGB;
                if (cgbType != 0) {
                    struct SoundMixerState *mixer = SOUND_INFO_PTR;
                    mixer->CgbOscOff(cgbType);
                }
                chan->status = 0;
            }
            chan->track = NULL;
        }
        track->chan = NULL;
    }
}

static void ChnVolSetAsm(struct MixerSource *chan, struct MP2KTrack *track)
{
    s8 forcedPan = chan->data.sound.rhythmPan;
    u32 rightVolume = (u8)(forcedPan + 128) * chan->data.sound.velocity * track->volRightCalculated / 128 / 128;
    if (rightVolume > 0xFF) {
        rightVolume = 0xFF;
    }
    chan->rightVol = rightVolume;

    u32 leftVolume = (u8)(127 - forcedPan) * chan->data.sound.velocity * track->volLeftCalculated / 128 / 128;
    if (leftVolume > 0xFF) {
        leftVolume = 0xFF;
    }
    chan->leftVol = leftVolume;
}

void MP2K_event_nxx(u8 clock, struct MP2KPlayerState *player, struct MP2KTrack *track)
{
    struct SoundMixerState *mixer = SOUND_INFO_PTR;

    // A note can be anywhere from 1 to 4 bytes long. First is always the note length...
    track->gateTime = gClockTable[clock];
    if (*track->cmdPtr < 0x80) {
        // Then the note name...
        track->key = *(track->cmdPtr++);
        if (*track->cmdPtr < 0x80) {
            // Then the velocity...
            track->velocity = *(track->cmdPtr++);
            if (*track->cmdPtr < 0x80) {
                // Then a number to add ticks to get exotic or more precise note lengths without TIE.
                track->gateTime += *(track->cmdPtr++);
            }
        }
    }

    // sp14
    s8 forcedPan = 0;
    // First r4, then r9
    struct MP2KVoiceGroup *voicegroup = &track->voicegroup;
    // sp8
    u8 key = track->key;
    u8 type = voicegroup->type;

    if (type & (TONEDATA_TYPE_RHY | TONEDATA_TYPE_SPL)) {
        u8 voicegroupIndex;
        if (voicegroup->type & TONEDATA_TYPE_SPL) {
            voicegroupIndex = voicegroup->data.keySplit.keySplitTable[track->key];
        } else {
            voicegroupIndex = track->key;
        }

        voicegroup = voicegroup->data.keySplit.group + voicegroupIndex;
        if (voicegroup->type & (TONEDATA_TYPE_RHY | TONEDATA_TYPE_SPL)) {
            return;
        }
        if (type & TONEDATA_TYPE_RHY) {
            if (voicegroup->pan_sweep & 0x80) {
                forcedPan = ((s8)(voicegroup->pan_sweep & 0x7F) - 0x40) * 2;
            }
            key = voicegroup->drumKey;
        }
    }

    // sp10
    u16 priority = player->priority + track->priority;
    if (priority > 0xFF) {
        priority = 0xFF;
    }

    u8 cgbType = voicegroup->type & TONEDATA_TYPE_CGB;
    struct MixerSource *chan;

    if (cgbType != 0) {
        if (mixer->cgbChans == NULL) {
            return;
        }
        // There's only one CgbChannel of a given type, so we don't need to loop to find it.
        chan = mixer->cgbChans + cgbType - 1;

        // If this channel is running and not stopped,
        if ((chan->status & SOUND_CHANNEL_SF_ON) && (chan->status & SOUND_CHANNEL_SF_STOP) == 0) {
            // then make sure this note is higher priority (or same priority but from a later track).
            if (chan->data.sound.priority > priority || (chan->data.sound.priority == priority && chan->track < track)) {
                return;
            }
        }
    } else {
        u16 p = priority;
        struct MP2KTrack *t = track;
        bool32 foundStoppingChannel = FALSE;
        chan = NULL;
        u8 numChans = mixer->numChans;
        struct MixerSource *currChan = mixer->chans;

        for (u8 i = 0; i < numChans; i++, currChan++) {
            if ((currChan->status & SOUND_CHANNEL_SF_ON) == 0) {
                // Hey, we found a completely inactive channel! Let's use that.
                chan = currChan;
                break;
            }

            if (currChan->status & SOUND_CHANNEL_SF_STOP && !foundStoppingChannel) {
                // In the absence of a completely finalized channel, we can take over one that's about to
                // finalize. That's a tier above any channel that's currently playing a note.
                foundStoppingChannel = TRUE;
                p = currChan->data.sound.priority;
                t = currChan->track;
                chan = currChan;
            } else if ((currChan->status & SOUND_CHANNEL_SF_STOP && foundStoppingChannel)
                       || ((currChan->status & SOUND_CHANNEL_SF_STOP) == 0 && !foundStoppingChannel)) {
                // The channel we're checking is on the same tier, so check the priority and track order
                if (currChan->data.sound.priority < p) {
                    p = currChan->data.sound.priority;
                    t = currChan->track;
                    chan = currChan;
                } else if (currChan->data.sound.priority == p && currChan->track > t) {
                    t = currChan->track;
                    chan = currChan;
                } else if (currChan->data.sound.priority == p && currChan->track == t) {
                    chan = currChan;
                }
            }
        }
    }

    if (chan == NULL) {
        return;
    }

    ClearChain(chan);

    chan->prev = NULL;
    chan->next = track->chan;
    if (track->chan != NULL) {
        track->chan->prev = chan;
    }
    track->chan = chan;
    chan->track = track;

    track->lfoDelayCounter = track->lfoDelay;
    if (track->lfoDelay != 0) {
        ClearModM(track);
    }
    TrkVolPitSet(player, track);

    chan->data.sound.gateTime = track->gateTime;
    chan->data.sound.untransposedKey = track->key;
    chan->data.sound.velocity = track->velocity;
    chan->data.sound.priority = priority;
    chan->data.sound.key = key;
    chan->data.sound.rhythmPan = forcedPan;
    chan->type = voicegroup->type;
    chan->wav = voicegroup->data.sound.wav;
    chan->data.sound.attack = voicegroup->data.sound.attack;
    chan->data.sound.decay = voicegroup->data.sound.decay;
    chan->data.sound.sustain = voicegroup->data.sound.sustain;
    chan->data.sound.release = voicegroup->data.sound.release;
    chan->data.sound.echoVol = track->echoVolume;
    chan->data.sound.echoLen = track->echoLength;
    ChnVolSetAsm(chan, track);

    // Avoid promoting keyShiftCalculated to u8 by splitting the addition into a separate statement
    s16 transposedKey = chan->data.sound.key;
    transposedKey += track->keyShiftCalculated;
    if (transposedKey < 0) {
        transposedKey = 0;
    }

    if (cgbType != 0) {
        // struct CgbChannel *cgbChan = (struct CgbChannel *)chan;
        chan->data.cgb.length = voicegroup->cgbLength;
        if (voicegroup->pan_sweep & 0x80 || (voicegroup->pan_sweep & 0x70) == 0) {
            chan->data.cgb.sweep = 8;
        } else {
            chan->data.cgb.sweep = voicegroup->pan_sweep;
        }

        chan->data.cgb.freq = mixer->MidiKeyToCgbFreq(cgbType, transposedKey, track->pitchCalculated);
    } else {
        chan->data.sound.freq = MidiKeyToFreq(chan->wav, transposedKey, track->pitchCalculated);
    }

    chan->status = SOUND_CHANNEL_SF_START;
    track->status &= ~0xF;
}

void MP2K_event_endtie(struct MP2KPlayerState *unused, struct MP2KTrack *track)
{
    u8 key = *track->cmdPtr;
    if (key < 0x80) {
        track->key = key;
        track->cmdPtr++;
    } else {
        key = track->key;
    }

    struct MixerSource *chan = track->chan;
    while (chan != NULL) {
        if (chan->status & 0x83 && (chan->status & 0x40) == 0 && chan->data.sound.untransposedKey == key) {
            chan->status |= 0x40;
            return;
        }
        chan = chan->next;
    }
}

void MP2K_event_lfos(struct MP2KPlayerState *unused, struct MP2KTrack *track)
{
    track->lfoSpeed = *(track->cmdPtr++);
    if (track->lfoSpeed == 0) {
        ClearModM(track);
    }
}

void MP2K_event_mod(struct MP2KPlayerState *unused, struct MP2KTrack *track)
{
    track->modDepth = *(track->cmdPtr++);
    if (track->modDepth == 0) {
        ClearModM(track);
    }
}

void m4aSoundVSync(void)
{
    struct SoundMixerState *mixer = SOUND_INFO_PTR;
    if (mixer->lockStatus - ID_NUMBER <= 1) {
        s32 samplesPerFrame = mixer->samplesPerFrame * 2;
        float *m4aBuffer = mixer->pcmBuffer;
        float *cgbBuffer = cgb_get_buffer();
        s32 dmaCounter = mixer->dmaCounter;
        bool8 shouldQueue = FALSE;

        if (dmaCounter > 1) {
            m4aBuffer += samplesPerFrame * (mixer->framesPerDmaCycle - (dmaCounter - 1));
        }

        for (u32 i = 0; i < samplesPerFrame; i++) {
            audioBuffer[i] = m4aBuffer[i] + cgbBuffer[i];
            if (audioBuffer[i] != 0) {
                shouldQueue = TRUE;
            }
        }

        if (shouldQueue) {
            Platform_QueueAudio(audioBuffer, samplesPerFrame * 4);
        }
        if ((s8)(--mixer->dmaCounter) <= 0)
            mixer->dmaCounter = mixer->framesPerDmaCycle;
    }
}
