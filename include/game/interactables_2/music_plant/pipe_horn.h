#ifndef GUARD_INTERACTABLE_PIPE_HORN_H
#define GUARD_INTERACTABLE_PIPE_HORN_H

#include "game/interactable.h"

void sub_8080AFC(s32 p0, s32 p1, u16 p2, u16 p3, s16 p4, u8 p5, u8 p6);
void sub_8080C78(s32 p0, s32 p1, u16 p2, u16 p3, s16 accelX, s16 accelY, u8 kind);

typedef struct {
    /* 0x00 */ s32 x0;
    /* 0x04 */ s32 y0;
    /* 0x08 */ s32 x1;
    /* 0x0C */ s32 y1;
    /* 0x10 */ s32 x2;
    /* 0x14 */ s32 y2;
    /* 0x18 */ u16 unk18;
    /* 0x1A */ u16 unk1A;
    /* 0x1C */ s32 posX;
    /* 0x20 */ s32 posY;
    /* 0x24 */ u16 kind;
    /* 0x26 */ u16 unk26;
    /* 0x28 */ Interactable *ia;
    /* 0x2C */ u8 spriteX;
    /* 0x2D */ u8 spriteY;
} Sprite_Pipe_Horn;

// VERY unsure about this union...
typedef union {
    s16 _16[2];
    s32 _32; // Q_24_8?
} PipeData_Weirdness;

typedef struct {
    u16 unk0;
    u16 unk2;

    PipeData_Weirdness unk4;

} Pipe_Data;

#define NUM_PIPE_HANDLERS 16
typedef void (*PipeHandler)(Sprite_Pipe_Horn *, const Pipe_Data[]);

// NOTE: Stored at end of rom, probably because it's configured data (like levels and
// assets?) it's made up of pointers defined in handlers_ia_pipe_horn.c
// see data/handlers_ia_pipe_horn_sequences.s
extern const Pipe_Data (*gUnknown_08C8793C[9])[];
extern const Pipe_Data (*gUnknown_08C87960[3])[];

#endif // GUARD_INTERACTABLE_PIPE_HORN_H
