#ifndef GUARD_INTERACTABLE_PIPE_HORN_H
#define GUARD_INTERACTABLE_PIPE_HORN_H

#include "global.h"
#include "game/entity.h"

typedef struct {
    /* 0x00 */ s32 x0;
    /* 0x04 */ s32 y0;
    /* 0x08 */ s32 x1;
    /* 0x0C */ s32 y1;
    /* 0x10 */ s32 x2;
    /* 0x14 */ s32 y2;
    /* 0x18 */ u16 unk18;
    /* 0x1A */ s16 unk1A;
    /* 0x1C */ s32 posX;
    /* 0x20 */ s32 posY;
    /* 0x24 */ u16 kind;
    /* 0x26 */ u16 unk26;
    /* 0x28 */ MapEntity *me;
    /* 0x2C */ u8 spriteX;
    /* 0x2D */ u8 spriteY;
} Sprite_PipeHorn;

#define NUM_PIPE_HANDLERS 16

// VERY unsure about this union...
typedef union {
    s16 _16[2];
    s32 _32; // Q_24_8?
} PipeData_Weirdness;

typedef struct Pipe_Data {
    u16 unk0;
    u16 unk2;

    PipeData_Weirdness unk4;

} Pipe_Data;

void CreateEntity_PipeInstrument_Entry(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY);
bool32 sub_8077788(Sprite_PipeHorn *pipe, const Pipe_Data *data);
void sub_8077774(Sprite_PipeHorn *pipe, s32 x, s32 y);

extern const Pipe_Data gUnknown_080DFCF0[];
extern const Pipe_Data gUnknown_080DFD40[];
extern const Pipe_Data gUnknown_080DFD98[];
extern const Pipe_Data gUnknown_080DFDD8[];
extern const Pipe_Data gUnknown_080DFE30[];

#endif // GUARD_INTERACTABLE_PIPE_HORN_H
