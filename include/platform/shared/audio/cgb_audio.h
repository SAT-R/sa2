#ifndef CGB_AUDIO_H
#define CGB_AUDIO_H

#include "lib/m4a/m4a_internal.h"

typedef s32 fixed16_16;
typedef s32 fixed8_24;

#define float_to_fp16_16(value) (fixed16_16)((value)*65536.0)

#define fp16_16_to_float(value) (float)((value) / 65536.0)

#define u32_to_fp16_16(value) ((value) << 16)

#define fp16_16_to_u32(value) ((value) >> 16)

#define fp16_16_fractional_part(value) ((value)&0xFFFF)

#define float_to_fp8_24(value) (fixed8_24)((value)*16777216.0)

#define fp8_24_to_float(value) (float)((value) / 16777216.0)

#define fp8_24_fractional_part(value) ((value)&0xFFFFFF)

#define fixed_div(numerator, denominator, bits) (((numerator * (1 << bits)) + (denominator / 2)) / denominator)

#define address8(base, offset) *((u8 *)((u8 *)base + (offset)))

#define address16(base, offset) *((u16 *)((u8 *)base + (offset)))

#define address32(base, offset) *((u32 *)((u8 *)base + (offset)))

struct AudioCGB {
    u16 ch1Freq;
    u8 ch1SweepCounter;
    u8 ch1SweepCounterI;
    bool8 ch1SweepDir;
    u8 ch1SweepShift;
    u8 Vol[4];
    u8 VolI[4];
    u8 Len[4];
    u8 LenI[4];
    bool8 LenOn[4];
    u8 EnvCounter[4];
    u8 EnvCounterI[4];
    bool8 EnvDir[4];
    bool8 DAC[4];
    float WAVRAM[32];
    u16 ch4LFSR[2];
    float outBuffer[PCM_DMA_BUF_SIZE * 2];
};

void cgb_audio_init(u32 rate);
void cgb_set_sweep(u8 sweep);
void cgb_set_wavram();
void cgb_toggle_length(u8 channel, bool8 state);
void cgb_set_length(u8 channel, u8 length);
void cgb_set_envelope(u8 channel, u8 envelope);
void cgb_trigger_note(u8 channel);
void cgb_audio_generate(u16 samplesPerFrame);
float *cgb_get_buffer();

#endif
