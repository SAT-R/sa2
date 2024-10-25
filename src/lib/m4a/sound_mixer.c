#if PORTABLE
#include "global.h"
#include "lib/m4a/music_player.h"
#include "lib/m4a/sound_mixer.h"
#include "lib/m4a/mp2k_common.h"
#include "lib/m4a/cgb_audio.h"

#define VCOUNT_VBLANK   160
#define TOTAL_SCANLINES 228

#define VOID_CAST (void *)

static inline void GenerateAudio(struct SoundMixerState *mixer, struct MixerSource *chan, struct WaveData2 *wav, float *outBuffer,
                                 u16 samplesPerFrame, float sampleRateReciprocal);
void SampleMixer(struct SoundMixerState *mixer, u32 scanlineLimit, u16 samplesPerFrame, float *outBuffer, u8 dmaCounter, u16 maxBufSize);
static inline bool32 TickEnvelope(struct MixerSource *chan, struct WaveData2 *wav);
static s8 sub_82DF758(struct MixerSource *chan, u32 current);

void RunMixerFrame(void)
{
    struct SoundMixerState *mixer = SOUND_INFO_PTR;

    if (mixer->lockStatus != MIXER_UNLOCKED) {
        return;
    }
    mixer->lockStatus = MIXER_LOCKED;

    u32 maxScanlines = mixer->maxScanlines;
    if (mixer->maxScanlines != 0) {
        u32 vcount = REG_VCOUNT;
        maxScanlines += vcount;
        if (vcount < VCOUNT_VBLANK) {
            maxScanlines += TOTAL_SCANLINES;
        }
    }

    if (mixer->firstPlayerFunc != NULL) {
        mixer->firstPlayerFunc(mixer->firstPlayer);
    }

    mixer->cgbMixerFunc();

    s32 samplesPerFrame = mixer->samplesPerFrame;
    float *outBuffer = mixer->outBuffer;
    s32 dmaCounter = mixer->dmaCounter;

    if (dmaCounter > 1) {
        outBuffer += samplesPerFrame * (mixer->framesPerDmaCycle - (dmaCounter - 1)) * 2;
    }

    // MixerRamFunc mixerRamFunc = ((MixerRamFunc)MixerCodeBuffer);
    SampleMixer(mixer, maxScanlines, samplesPerFrame, outBuffer, dmaCounter, MIXED_AUDIO_BUFFER_SIZE);
#if PORTABLE
    cgb_audio_generate(samplesPerFrame);
#endif
}

void SampleMixer(struct SoundMixerState *mixer, u32 scanlineLimit, u16 samplesPerFrame, float *outBuffer, u8 dmaCounter, u16 maxBufSize)
{
    u32 reverb = mixer->reverb;
    if (reverb) {
        // The vanilla reverb effect outputs a mono sound from four sources:
        //  - L/R channels as they were mixer->framesPerDmaCycle frames ago
        //  - L/R channels as they were (mixer->framesPerDmaCycle - 1) frames ago
        float *tmp1 = outBuffer;
        float *tmp2;
        if (dmaCounter == 2) {
            tmp2 = mixer->outBuffer;
        } else {
            tmp2 = outBuffer + samplesPerFrame * 2;
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
        // memset(outBuffer, 0, samplesPerFrame);
        // memset(outBuffer + maxBufSize, 0, samplesPerFrame);
        for (int i = 0; i < samplesPerFrame; i++) {
            float *dst = &outBuffer[i * 2];
            dst[1] = dst[0] = 0.0f;
        }
    }

    float sampleRateReciprocal = mixer->sampleRateReciprocal;
    s8 numChans = mixer->numChans;
    struct MixerSource *chan = mixer->chans;

    for (int i = 0; i < numChans; i++, chan++) {
        struct WaveData2 *wav = VOID_CAST chan->wav;

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
            GenerateAudio(mixer, chan, wav, outBuffer, samplesPerFrame, sampleRateReciprocal);
        }
    }
returnEarly:
    mixer->lockStatus = MIXER_UNLOCKED;
}

// Returns TRUE if channel is still active after moving envelope forward a frame
//__attribute__((target("thumb")))
static inline bool32 TickEnvelope(struct MixerSource *chan, struct WaveData2 *wav)
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
        env = chan->envelopeVol;

        if (status & 4) {
            // Note-wise echo
            --chan->echoVol;
            if (chan->echoVol <= 0) {
                chan->status = 0;
                return FALSE;
            } else {
                return TRUE;
            }
        } else if (status & 0x40) {
            // Release
            chan->envelopeVol = env * chan->release / 256U;
            u8 echoVol = chan->echoVol;
            if (chan->envelopeVol > echoVol) {
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
                chan->envelopeVol = env * chan->decay / 256U;

                u8 sustain = chan->sustain;
                if (chan->envelopeVol <= sustain && sustain == 0) {
                    // Duplicated echo check from Release section above
                    if (chan->echoVol == 0) {
                        chan->status = 0;
                        return FALSE;
                    } else {
                        chan->status |= 4;
                        return TRUE;
                    }
                } else if (chan->envelopeVol <= sustain) {
                    chan->envelopeVol = sustain;
                    --chan->status;
                }
                break;
            case 3:
            attack:
                newEnv = env + chan->attack;
                if (newEnv > 0xFF) {
                    chan->envelopeVol = 0xFF;
                    --chan->status;
                } else {
                    chan->envelopeVol = newEnv;
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
        chan->ct = wav->size;
        chan->fw = 0;
        chan->envelopeVol = 0;
        if (wav->loopFlags & 0xC0) {
            chan->status |= 0x10;
        }
        goto attack;
    }
}

static inline void GenerateAudio(struct SoundMixerState *mixer, struct MixerSource *chan, struct WaveData2 *wav, float *outBuffer,
                                 u16 samplesPerFrame, float sampleRateReciprocal)
{ /*, [[[]]]) {*/
    u8 v = chan->envelopeVol * (mixer->masterVol + 1) / 16U;
    chan->envelopeVolR = chan->rightVol * v / 256U;
    chan->envelopeVolL = chan->leftVol * v / 256U;

    s32 loopLen = 0;
    s8 *loopStart;
    if (chan->status & 0x10) {
        loopStart = wav->data + wav->loopStart;
        loopLen = wav->size - wav->loopStart;
    }
    s32 samplesLeftInWav = chan->ct;
    s8 *current = chan->current;
    signed envR = chan->envelopeVolR;
    signed envL = chan->envelopeVolL;

    if (chan->type & 8) {
        for (u16 i = 0; i < samplesPerFrame; i++, outBuffer += 2) {
            s8 c = *(current++);

            outBuffer[1] += (c * envR) / 32768.0f;
            outBuffer[0] += (c * envL) / 32768.0f;
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

        chan->ct = samplesLeftInWav;
        chan->current = current;
    } else {
        float finePos = chan->fw;
        float romSamplesPerOutputSample = chan->freq * sampleRateReciprocal;

        s16 b = current[0];
        s16 m = current[1] - b;
        current += 1;

        for (u16 i = 0; i < samplesPerFrame; i++, outBuffer += 2) {
            // Use linear interpolation to calculate a value between the current sample in the wav
            // and the next sample. Also cancel out the 9.23 stuff
            float sample = (finePos * m) + b;

            outBuffer[1] += (sample * envR) / 32768.0f;
            outBuffer[0] += (sample * envL) / 32768.0f;

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

        chan->fw = finePos;
        chan->ct = samplesLeftInWav;
        chan->current = current - 1;
    }
}
#endif // PORTABLE
