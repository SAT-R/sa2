#ifndef GUARD_ANIMATION_COMMANDS_H
#define GUARD_ANIMATION_COMMANDS_H

#define AnimCommandSizeInWords(_structType) ((sizeof(_structType)) / sizeof(s32))

typedef struct {
    /* 0x00 */ s32 cmdId; // -2

    /* 0x04 */ u32 tileIndex;
    /* 0x08 */ u32 numTilesToCopy;
} ACmd_GetTiles;

typedef struct {
    /* 0x00 */ s32 cmdId; // -2

    /* 0x04 */ s32 palId;
    /* 0x06 */ u16 numColors;
    /* 0x08 */ u16 insertOffset;
} ACmd_GetPalette;

typedef struct {
    /* 0x00 */ s32 cmdId; // -3

    /* 0x04 */ s32 offset;
} ACmd_JumpBack;

typedef struct {
    /* 0x00 */ s32 cmdId; // -4
} ACmd_4;

typedef struct {
    /* 0x00 */ s32 cmdId; // -5

    /* 0x04 */ u16 songId;
} ACmd_PlaySoundEffect;

// TODO: param types unknown
typedef struct {
    /* 0x00 */ s32 cmdId; // -6

    /* 0x04 */ s32 unk4;
    /* 0x08 */ s32 unk8;
} ACmd_6;

typedef struct {
    /* 0x00 */ s32 cmdId; // -7

    /* 0x04 */ u16 x;
    /* 0x06 */ u16 y;
} ACmd_TranslateSprite;

typedef struct {
    /* 0x00 */ s32 cmdId; // -8

    /* 0x04 */ s32 unk4;
    /* 0x08 */ s32 unk8;
} ACmd_8;

typedef struct {
    /* 0x00 */ s32 cmdId; // -9

    /* 0x04 */ AnimId animId;
    /* 0x08 */ u16 variant;
} ACmd_SetIdAndVariant;

typedef struct {
    /* 0x00 */ s32 cmdId; // -10

    /* 0x04 */ s32 unk4;
    /* 0x08 */ s32 unk8;
    /* 0x0C */ s32 unkC;
} ACmd_10;

typedef struct {
    /* 0x00 */ s32 cmdId; // -11

    /* 0x04 */ s32 unk4; // the logic of animCmd_11 suggests that only values of 0-3 make
                         // sense here.
} ACmd_11;

typedef struct {
    /* 0x00 */ s32 cmdId; // -12

    /* 0x04 */ s32 unk4;
} ACmd_12;

#endif // GUARD_ANIMATION_COMMANDS_H