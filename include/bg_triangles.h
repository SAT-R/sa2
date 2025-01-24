#ifndef GUARD_SPRITE_4_H
#define GUARD_SPRITE_4_H

typedef struct {
    u8 unk0;
    u8 unk1;
    u8 unk2;
    u8 unk3;
    u8 unk4;
    u8 unk5;
    u8 unk6;
    u8 unk7;
} TriParam1;

extern void sub_800724C(u8 bg, TriParam1 *param1);
extern void sub_80075D0(u8 bg, u8 param1, u8 param2, s16 param3, s16 param4, u16 param5);
extern void sub_8007858(u8 param0, int_vcount minY, int_vcount maxY, u16 param3, u16 param4);
extern void sub_80078D4(u8 bg, int_vcount minY, int_vcount maxY, u16 offsetEven, u16 offsetOdd);

#endif
