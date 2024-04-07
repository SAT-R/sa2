#ifndef GUARD_ANIMATION_COMMANDS_H
#define GUARD_ANIMATION_COMMANDS_H

#include "global.h"
#include "sprite.h"

#define AnimCommandSizeInWords(_structType) ((sizeof(_structType)) / sizeof(s32))

typedef AnimCmdResult (*AnimationCommandFunc)(void *cursor, Sprite *sprite);

typedef struct {
    /* 0x00 */ s32 cmdId; // -2

    // Note(Jace): This needs to be signed, since a
    //             negative value infers that it's using 8bit-colors
    /* 0x04 */ s32 tileIndex;

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

    /* 0x04 */ Hitbox hitbox;
} ACmd_Hitbox;

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

    /* 0x04 */ s32 priority;
} ACmd_SetSpritePriority;

typedef struct {
    /* 0x00 */ s32 cmdId; // -12

    /* 0x04 */ s32 orderIndex;
} ACmd_SetOamOrder;

typedef struct {
    // number of frames this will be displayed
    s32 delay;

    // frameId of this animation that should be displayed
    s32 index;
} ACmd_ShowFrame;

typedef union {
    s32 id;

    ACmd_GetTiles tiles;
    ACmd_GetPalette pal;
    ACmd_JumpBack jump;
    ACmd_4 end;
    ACmd_PlaySoundEffect sfx;
    ACmd_Hitbox _6;
    ACmd_TranslateSprite translate;
    ACmd_8 _8;
    ACmd_SetIdAndVariant setAnimId;
    ACmd_10 _10;
    ACmd_SetSpritePriority _11;
    ACmd_SetOamOrder setOamOrder;

    ACmd_ShowFrame show;
} ACmd;

u32 sub_8004518(u16 num);

#endif // GUARD_ANIMATION_COMMANDS_H
