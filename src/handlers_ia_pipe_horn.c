#include "global.h"
#include "trig.h"

#include "interactable_music_plant_pipe_horn.h"

void Handler_MusicPlant_Pipe_0(Sprite_Pipe_Horn *, const Pipe_Data[]);
void Handler_MusicPlant_Pipe_1(Sprite_Pipe_Horn *, const Pipe_Data[]);
void Handler_MusicPlant_Pipe_2(Sprite_Pipe_Horn *, const Pipe_Data[]);
void Handler_MusicPlant_Pipe_3(Sprite_Pipe_Horn *, const Pipe_Data[]);
void Handler_MusicPlant_Pipe_4(Sprite_Pipe_Horn *, const Pipe_Data[]);
void Handler_MusicPlant_Pipe_5(Sprite_Pipe_Horn *, const Pipe_Data[]);
void Handler_MusicPlant_Pipe_6(Sprite_Pipe_Horn *, const Pipe_Data[]);
void Handler_MusicPlant_Pipe_7(Sprite_Pipe_Horn *, const Pipe_Data[]);
void Handler_MusicPlant_Pipe_8(Sprite_Pipe_Horn *, const Pipe_Data[]);
void Handler_MusicPlant_Pipe_9(Sprite_Pipe_Horn *, const Pipe_Data[]);
void Handler_MusicPlant_Pipe_10(Sprite_Pipe_Horn *, const Pipe_Data[]);

// These functions control the character when they enter
// one of the horns or pipes in Music Plant.
const PipeHandler sPipeHandlers[NUM_PIPE_HANDLERS] = { Handler_MusicPlant_Pipe_0,
                                                       Handler_MusicPlant_Pipe_1,
                                                       Handler_MusicPlant_Pipe_2,
                                                       Handler_MusicPlant_Pipe_3,
                                                       Handler_MusicPlant_Pipe_4,
                                                       Handler_MusicPlant_Pipe_5,
                                                       Handler_MusicPlant_Pipe_6,
                                                       Handler_MusicPlant_Pipe_7,
                                                       Handler_MusicPlant_Pipe_8,
                                                       Handler_MusicPlant_Pipe_9,
                                                       Handler_MusicPlant_Pipe_10,
                                                       NULL,
                                                       NULL,
                                                       NULL,
                                                       NULL,
                                                       NULL };

// TODO: Find out, why data doesn't work (is it the union?)
#if TRUE
extern const Pipe_Data gUnknown_080DFCF0[];
#else
const Pipe_Data gUnknown_080DFCF0[]
    = { { 0, 0x22, { 0x0000, 0x0800 } }, { 0, 0xCC, { 0, 0x5000 } },
        { 2, 0x140, { 0, 0x1400 } }, { 0, 0x100, { 0x4000, 0x0000 } },
        { 4, 0x140, { 0x0000, 0x1400 } }, { 1, 0x140, { 0x0000, 0x1400 } },
        { 0, 0xAA, { 0xA000, 0x0000 } }, { 0, 0xAA, { 0xA000, 0x0000 } },
        { 0, 0x200, { 0xE000, 0x0000 } },
        {
            -1,
            -1,
            { -1, -1 },
        };
#endif
extern const Pipe_Data gUnknown_080DFD40[];
extern const Pipe_Data gUnknown_080DFD98[];
extern const Pipe_Data gUnknown_080DFDD8[];
extern const Pipe_Data gUnknown_080DFE30[];

extern s16 gUnknown_080DFE90[9][2];
extern s16 gUnknown_080DFEB4[14];
extern s16 gUnknown_080DFED0[10];
extern const Pipe_Data gUnknown_080DFEE4[];
extern const Pipe_Data gUnknown_080DFF3C[];
extern const Pipe_Data gUnknown_080DFF9C[];

// NOTE: Gets stored in .data section
//       (I assume that is because it's a pointer array)
const Pipe_Data (*gUnknown_08C8793C[9])[] = {
    &gUnknown_080DFCF0, &gUnknown_080DFCF0, &gUnknown_080DFD40,
    &gUnknown_080DFD40, &gUnknown_080DFD98, &gUnknown_080DFDD8,
    &gUnknown_080DFDD8, &gUnknown_080DFE30, &gUnknown_080DFE30,
};

// NOTE: Gets stored in .data section
const Pipe_Data (*gUnknown_08C87960[3])[] = {
    &gUnknown_080DFEE4,
    &gUnknown_080DFF3C,
    &gUnknown_080DFF9C,
};

void Handler_MusicPlant_Pipe_0(Sprite_Pipe_Horn *pipe, const Pipe_Data data[])
{
    s32 r1 = (u16)(Q_24_8_TO_INT(data[pipe->unk18].unk4._32) >> 8);
    s32 r0, r3, r6, r7;

    r0 = data[pipe->unk18].unk4._16[0];
    r3 = pipe->x1;
    r7 = -r0;
    pipe->x2 = r3 - (((s16)pipe->unk1A * r7) >> 10);

    r1 <<= 16;
    r1 >>= 16;

    r6 = pipe->y1;
    pipe->y2 = r6 - ((-r1 * (s16)pipe->unk1A) >> 10);

    pipe->unk1A += data[pipe->unk18].unk2;

    if (pipe->unk1A > ONE_CYCLE) {
        u32 value;
        pipe->unk1A -= 1024;

        pipe->x1 = pipe->x1 - r7;
        pipe->y1 = pipe->y1 - -r1;

        value = data[++pipe->unk18].unk0;
        if (value == (u16)-1) {
            pipe->unk18 |= value;
        }
    }
}

void Handler_MusicPlant_Pipe_1(Sprite_Pipe_Horn *pipe, const Pipe_Data data[])
{
    s16 sin, cos;
    s32 r5 = data[pipe->unk18].unk4._32;
    u32 index = (pipe->unk1A >> 2);
    u16 sinIndex = (DEG_TO_SIN(90) - index) & ONE_CYCLE;

    cos = COS_24_8(sinIndex);
    pipe->x2 = Q_24_8_TO_INT(cos * r5) + pipe->x1;

    sin = SIN_24_8(sinIndex);
    pipe->y2 = Q_24_8_TO_INT(sin * r5) + pipe->y1 - r5;

    pipe->unk1A += data[pipe->unk18].unk2;

    if (pipe->unk1A > ONE_CYCLE) {
        u32 value;
        pipe->unk1A -= 1024;

        cos = COS_DEG(0);
        pipe->x1 = Q_24_8_TO_INT(cos * r5) + pipe->x1;

        sin = SIN_DEG(0);
        pipe->y1 = Q_24_8_TO_INT(sin * r5) + pipe->y1 - r5;

        value = data[++pipe->unk18].unk0;
        if (value == (u16)-1) {
            pipe->unk18 |= value;
        }
    }
}

void Handler_MusicPlant_Pipe_2(Sprite_Pipe_Horn *pipe, const Pipe_Data data[])
{
    s16 sin, cos;
    s32 r5 = data[pipe->unk18].unk4._32;
    u32 index = (pipe->unk1A >> 2);
    u16 sinIndex = (DEG_TO_SIN(270) + index) & ONE_CYCLE;

    cos = COS_24_8(sinIndex);
    pipe->x2 = Q_24_8_TO_INT(cos * r5) + pipe->x1;

    sin = SIN_24_8(sinIndex);
    pipe->y2 = Q_24_8_TO_INT(sin * r5) + pipe->y1 + r5;

    pipe->unk1A += data[pipe->unk18].unk2;

    if (pipe->unk1A > ONE_CYCLE) {
        u32 value;
        pipe->unk1A -= 1024;

        cos = COS_DEG(0);
        pipe->x1 = Q_24_8_TO_INT(cos * r5) + pipe->x1;

        sin = SIN_DEG(0);
        pipe->y1 = Q_24_8_TO_INT(sin * r5) + pipe->y1 + r5;

        value = data[++pipe->unk18].unk0;
        if (value == (u16)-1) {
            pipe->unk18 |= value;
        }
    }
}

void Handler_MusicPlant_Pipe_3(Sprite_Pipe_Horn *pipe, const Pipe_Data data[])
{
    s16 sin, cos;
    s32 r5 = data[pipe->unk18].unk4._32;
    u32 index = (pipe->unk1A >> 2);
    u16 sinIndex = (index)&ONE_CYCLE;

    cos = COS_24_8(sinIndex);
    pipe->x2 = Q_24_8_TO_INT(cos * r5) + pipe->x1 - r5;

    sin = SIN_24_8(sinIndex);
    pipe->y2 = Q_24_8_TO_INT(sin * r5) + pipe->y1;

    pipe->unk1A += data[pipe->unk18].unk2;

    if (pipe->unk1A > ONE_CYCLE) {
        u32 value;
        pipe->unk1A -= 1024;

        cos = COS_DEG(90);
        pipe->x1 = Q_24_8_TO_INT(cos * r5) + pipe->x1 - r5;

        sin = SIN_DEG(90);
        pipe->y1 = Q_24_8_TO_INT(sin * r5) + pipe->y1;

        value = data[++pipe->unk18].unk0;
        if (value == (u16)-1) {
            pipe->unk18 |= value;
        }
    }
}

void Handler_MusicPlant_Pipe_4(Sprite_Pipe_Horn *pipe, const Pipe_Data data[])
{
    s16 sin, cos;
    s32 r5 = data[pipe->unk18].unk4._32;
    u32 index = (pipe->unk1A >> 2);
    u16 sinIndex = (DEG_TO_SIN(180) - index) & ONE_CYCLE;

    cos = COS_24_8(sinIndex);
    pipe->x2 = Q_24_8_TO_INT(cos * r5) + pipe->x1 + r5;

    sin = SIN_24_8(sinIndex);
    pipe->y2 = Q_24_8_TO_INT(sin * r5) + pipe->y1;

    pipe->unk1A += data[pipe->unk18].unk2;

    if (pipe->unk1A > ONE_CYCLE) {
        u32 value;
        pipe->unk1A -= 1024;

        cos = COS_DEG(90);
        pipe->x1 = Q_24_8_TO_INT(cos * r5) + pipe->x1 + r5;

        sin = SIN_DEG(90);
        pipe->y1 = Q_24_8_TO_INT(sin * r5) + pipe->y1;

        value = data[++pipe->unk18].unk0;
        if (value == (u16)-1) {
            pipe->unk18 |= value;
        }
    }
}

void Handler_MusicPlant_Pipe_5(Sprite_Pipe_Horn *pipe, const Pipe_Data data[])
{
    s16 sin, cos;
    s32 r5 = data[pipe->unk18].unk4._32;
    u32 index = (pipe->unk1A >> 2);
    u16 sinIndex = (index + DEG_TO_SIN(90)) & ONE_CYCLE;

    cos = COS_24_8(sinIndex);
    pipe->x2 = Q_24_8_TO_INT(cos * r5) + pipe->x1;

    sin = SIN_24_8(sinIndex);
    pipe->y2 = Q_24_8_TO_INT(sin * r5) + pipe->y1 - r5;

    pipe->unk1A += data[pipe->unk18].unk2;

    if (pipe->unk1A > ONE_CYCLE) {
        u32 value;
        pipe->unk1A -= 1024;

        cos = COS_DEG(180);
        pipe->x1 = Q_24_8_TO_INT(cos * r5) + pipe->x1;

        sin = SIN_DEG(180);
        pipe->y1 = Q_24_8_TO_INT(sin * r5) + pipe->y1 - r5;

        value = data[++pipe->unk18].unk0;
        if (value == (u16)-1) {
            pipe->unk18 |= value;
        }
    }
}

void Handler_MusicPlant_Pipe_6(Sprite_Pipe_Horn *pipe, const Pipe_Data data[])
{
    s16 sin, cos;
    s32 r5 = data[pipe->unk18].unk4._32;
    u32 index = (pipe->unk1A >> 2);
    u16 sinIndex = (DEG_TO_SIN(270) - index) & ONE_CYCLE;

    cos = COS_24_8(sinIndex);
    pipe->x2 = Q_24_8_TO_INT(cos * r5) + pipe->x1;

    sin = SIN_24_8(sinIndex);
    pipe->y2 = Q_24_8_TO_INT(sin * r5) + pipe->y1 + r5;

    pipe->unk1A += data[pipe->unk18].unk2;

    if (pipe->unk1A > ONE_CYCLE) {
        u32 value;
        pipe->unk1A -= 1024;

        cos = COS_DEG(180);
        pipe->x1 = Q_24_8_TO_INT(cos * r5) + pipe->x1;

        sin = SIN_DEG(180);
        pipe->y1 = Q_24_8_TO_INT(sin * r5) + pipe->y1 + r5;

        value = data[++pipe->unk18].unk0;
        if (value == (u16)-1) {
            pipe->unk18 |= value;
        }
    }
}

void Handler_MusicPlant_Pipe_7(Sprite_Pipe_Horn *pipe, const Pipe_Data data[])
{
    s16 sin, cos;
    s32 r5 = data[pipe->unk18].unk4._32;
    u32 index = (pipe->unk1A >> 2);
    u16 sinIndex = (DEG_TO_SIN(360) - index) & ONE_CYCLE;

    cos = COS_24_8(sinIndex);
    pipe->x2 = Q_24_8_TO_INT(cos * r5) + pipe->x1 - r5;

    sin = SIN_24_8(sinIndex);
    pipe->y2 = Q_24_8_TO_INT(sin * r5) + pipe->y1;

    pipe->unk1A += data[pipe->unk18].unk2;

    if (pipe->unk1A > ONE_CYCLE) {
        u32 value;
        pipe->unk1A -= 1024;

        cos = COS_DEG(270);
        pipe->x1 = Q_24_8_TO_INT(cos * r5) + pipe->x1;
        pipe->x1 -= r5;

        sin = SIN_DEG(270);
        pipe->y1 = Q_24_8_TO_INT(sin * r5) + pipe->y1;

        value = data[++pipe->unk18].unk0;
        if (value == (u16)-1) {
            pipe->unk18 |= value;
        }
    }
}

void Handler_MusicPlant_Pipe_8(Sprite_Pipe_Horn *pipe, const Pipe_Data data[])
{
    s16 sin, cos;
    s32 r5 = data[pipe->unk18].unk4._32;
    u16 sinIndex = ((pipe->unk1A >> 2) + 512) & ONE_CYCLE;

    cos = COS_24_8(sinIndex);
    pipe->x2 = Q_24_8_TO_INT(cos * r5) + pipe->x1 + r5;

    sin = SIN_24_8(sinIndex);
    pipe->y2 = Q_24_8_TO_INT(sin * r5) + pipe->y1;

    pipe->unk1A += data[pipe->unk18].unk2;

    if (pipe->unk1A > ONE_CYCLE) {
        u32 value;
        pipe->unk1A -= 1024;

        cos = COS_DEG(270);
        pipe->x1 = Q_24_8_TO_INT(cos * r5) + pipe->x1;
        pipe->x1 += r5;

        sin = SIN_DEG(270);
        pipe->y1 = Q_24_8_TO_INT(sin * r5) + pipe->y1;

        value = data[++pipe->unk18].unk0;
        if (value == (u16)-1) {
            pipe->unk18 |= value;
        }
    }
}

void Handler_MusicPlant_Pipe_9(Sprite_Pipe_Horn *pipe, const Pipe_Data data[])
{
    s32 sin, cos;
    s32 sin2;
    s32 r8, r9;
    s32 r7 = data[pipe->unk18].unk4._32;
    u16 sinIndex = ((pipe->unk1A >> 3) + DEG_TO_SIN(315)) & ONE_CYCLE;

    cos = COS_24_8(sinIndex);
    r8 = r7 * cos;

    sin = SIN_DEG(135);
    r9 = r7 * sin;
    pipe->x2 = Q_24_8_TO_INT(r8 - r9) + pipe->x1;

    sin2 = (SIN_24_8(sinIndex) + SIN_DEG(45));
    pipe->y2 = Q_24_8_TO_INT(sin2 * r7) + pipe->y1;

    pipe->unk1A += data[pipe->unk18].unk2;

    if (pipe->unk1A > ONE_CYCLE) {
        u32 value;
        pipe->unk1A -= 1024;

        cos = SIN_DEG(90) * r7;
        pipe->x1 = Q_24_8_TO_INT(cos - r9) + pipe->x1;

        pipe->y1 = Q_24_8_TO_INT((SIN_DEG(0) + SIN_DEG(45)) * r7) + pipe->y1;

        value = data[++pipe->unk18].unk0;
        if (value == (u16)-1) {
            pipe->unk18 |= value;
        }
    }
}

void Handler_MusicPlant_Pipe_10(Sprite_Pipe_Horn *pipe, const Pipe_Data data[])
{
    s16 sin, cos;
    s32 r5 = data[pipe->unk18].unk4._32;
    u16 sinIndex = ((pipe->unk1A >> 3) + 512) & ONE_CYCLE;

    cos = COS_24_8(sinIndex);
    pipe->x2 = Q_24_8_TO_INT(cos * r5) + pipe->x1 + r5;

    sin = SIN_24_8(sinIndex);
    pipe->y2 = Q_24_8_TO_INT(sin * r5) + pipe->y1;

    pipe->unk1A += data[pipe->unk18].unk2;

    if (pipe->unk1A > ONE_CYCLE) {
        u32 value;
        pipe->unk1A -= 1024;

        cos = COS_DEG(225);
        pipe->x1 = Q_24_8_TO_INT(cos * r5) + pipe->x1;
        pipe->x1 += r5;

        sin = SIN_DEG(225);
        pipe->y1 = Q_24_8_TO_INT(sin * r5) + pipe->y1;

        value = data[++pipe->unk18].unk0;
        if (value == (u16)-1) {
            pipe->unk18 |= value;
        }
    }
}
