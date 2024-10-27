#if PORTABLE
#include "gba/types.h"
#include "platform/platform.h" // Platform_QueueAudio
#include "lib/m4a/m4a_internal.h"
#include "lib/m4a/cgb_audio.h"
#include "lib/m4a/music_player.h"

#ifndef __has_builtin
#define __has_builtin(x) defined(__GNUC__)
#endif

#if ((-1 >> 1) == -1) && __has_builtin(__builtin_ctz)
#define FLOOR_DIV_POW2(a, b) ((a) >> __builtin_ctz(b))
#else
#define FLOOR_DIV_POW2(a, b) ((a) > 0 ? (a) / (b) : (((a) + 1 - (b)) / (b)))
#endif

static float audioBuffer[MIXED_AUDIO_BUFFER_SIZE];

static void ChnVolSetAsm(struct MixerSource *chan, struct MP2KTrack *track);

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

// Sets the track's cmdPtr to the specified address.
void MP2K_event_goto(struct MP2KPlayerState *unused, struct MP2KTrack *track)
{
    u8 *cmdPtr = track->cmdPtr;
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
        track->patternStack[level] = track->cmdPtr + sizeof(u8 *);
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
            track->cmdPtr += sizeof(u8) + sizeof(u8 *);
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
    struct MP2KVoiceGroup *instrument = &player->voicegroup[voice];
    track->instrument = *instrument;
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

    if (player->lockStatus != PLAYER_UNLOCKED) {
        return;
    }
    player->lockStatus = PLAYER_LOCKED;

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
                currentTrack->instrument.type = 1;
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
            u8 cgbType = chan->type & 0x7;
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
    player->lockStatus = PLAYER_UNLOCKED;
}

void TrackStop(struct MP2KPlayerState *player, struct MP2KTrack *track)
{
    if (track->status & 0x80) {
        for (struct MixerSource *chan = track->chan; chan != NULL; chan = chan->next) {
            if (chan->status != 0) {
                u8 cgbType = chan->type & 0x7;
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
{ // MP2K_event_nxx
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
    struct MP2KVoiceGroup *instrument = &track->instrument;
    // sp8
    u8 key = track->key;
    u8 type = instrument->type;

    if (type & (TONEDATA_TYPE_RHY | TONEDATA_TYPE_SPL)) {
        u8 instrumentIndex;
        if (instrument->type & TONEDATA_TYPE_SPL) {
            instrumentIndex = instrument->data.keySplit.keySplitTable[track->key];
        } else {
            instrumentIndex = track->key;
        }

        instrument = instrument->data.keySplit.group + instrumentIndex;
        if (instrument->type & (TONEDATA_TYPE_RHY | TONEDATA_TYPE_SPL)) {
            return;
        }
        if (type & TONEDATA_TYPE_RHY) {
            if (instrument->pan_sweep & 0x80) {
                forcedPan = ((s8)(instrument->pan_sweep & 0x7F) - 0x40) * 2;
            }
            key = instrument->drumKey;
        }
    }

    // sp10
    u16 priority = player->priority + track->priority;
    if (priority > 0xFF) {
        priority = 0xFF;
    }

    u8 cgbType = instrument->type & TONEDATA_TYPE_CGB;
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
    chan->type = instrument->type;
    chan->wav = instrument->data.sound.wav;
    chan->data.sound.attack = instrument->data.sound.attack;
    chan->data.sound.decay = instrument->data.sound.decay;
    chan->data.sound.sustain = instrument->data.sound.sustain;
    chan->data.sound.release = instrument->data.sound.release;
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
        chan->data.cgb.length = instrument->cgbLength;
        if (instrument->pan_sweep & 0x80 || (instrument->pan_sweep & 0x70) == 0) {
            chan->data.cgb.sweep = 8;
        } else {
            chan->data.cgb.sweep = instrument->pan_sweep;
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
    if (mixer->lockStatus - PLAYER_UNLOCKED <= 1) {
        s32 samplesPerFrame = mixer->samplesPerFrame * 2;
        float *m4aBuffer = mixer->pcmBuffer;
        float *cgbBuffer = cgb_get_buffer();
        s32 dmaCounter = mixer->dmaCounter;

        if (dmaCounter > 1) {
            m4aBuffer += samplesPerFrame * (mixer->framesPerDmaCycle - (dmaCounter - 1));
        }

        for (u32 i = 0; i < samplesPerFrame; i++)
            audioBuffer[i] = m4aBuffer[i] + cgbBuffer[i];

        Platform_QueueAudio(audioBuffer, samplesPerFrame * 4);
        if ((s8)(--mixer->dmaCounter) <= 0)
            mixer->dmaCounter = mixer->framesPerDmaCycle;
    }
}

#endif // PORTABLE
