#ifndef GUARD_SPRITE_4_H
#define GUARD_SPRITE_4_H

typedef struct {
#if !WIDESCREEN_HACK
    u8 unk0;
    u8 unk1;
    u8 unk2;
    u8 unk3;
    u8 unk4;
    u8 unk5;
    u8 unk6;
    u8 unk7;
#else
    u16 unk0;
    u16 unk1;
    u16 unk2;
    u16 unk3;
    u16 unk4;
    u16 unk5;
    u16 unk6;
    u16 unk7;
#endif
} TriParam1;

extern void SA2_LABEL(sub_8006DB4)(u8 bg, TriParam1 *arg1, s32 unused, s32 arg3);
extern void SA2_LABEL(sub_800724C)(u8 bg, TriParam1 *param1);
extern void SA2_LABEL(sub_80075D0)(u8 bg, int_vcount param1, int_vcount param2, s16 param3, s16 param4, u16 param5);
extern void SA2_LABEL(sub_8007738)(u8 bg, int_vcount minY, int_vcount maxY, u16 param3, u8 param4, u8 param5, u16 param6, u8 param7,
                                   u8 param8, s16 param9, s16 param10);
extern void SA2_LABEL(sub_8007858)(u8 param0, int_vcount minY, int_vcount maxY, u16 param3, u16 param4);
extern void SA2_LABEL(sub_80078D4)(u8 bg, int_vcount minY, int_vcount maxY, u16 offsetEven, u16 offsetOdd);
void SA2_LABEL(sub_8007958)(u8 bg, int_vcount minY, int_vcount maxY, s16 param3, s8 param4, u16 param5, u16 param6);
void SA2_LABEL(sub_80064A8)(u8 p0, u8 p1, u8 p2, u8 p3, u8 p4, u8 p5);
void SA2_LABEL(sub_8006228)(u8 p0, u8 p1, u8 p2, u8 p3, u8 p4, u8 p5);
#endif
