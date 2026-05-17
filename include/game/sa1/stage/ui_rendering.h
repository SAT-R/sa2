#ifndef GUARD_gTask_03006240
#define GUARD_gTask_03006240

#include "task.h"
#include "game/sa1/ui/game_over.h"

// TODO: Seems like this task is Game Over-related?

// UI, OAM-related?
typedef struct Strc0 {
    /* 0x000 */ s32 unk0; // tilenum (OAM)
    /* 0x004 */ s32 unk4;
    /* 0x008 */ u8 unk8;
    /* 0x009 */ u8 unk9;
    /* 0x00A */ u8 unkA;
    /* 0x00B */ u8 unkB;
} Strc0;

typedef struct Strc_80528AC {
    /* 0x00 */ struct Strc0 unk0;
    /* 0x0C */ u8 *vramC;
    /* 0x10 */ const u8 *layout;
    /* 0x14 */ const u8 *tiles;
    /* 0x18 */ s32 tilesSize; // in bytes
    /* 0x1C */ s32 layoutSize;
    /* 0x20 */ const u16 *palette;
    /* 0x24 */ u32 paletteSize;
    /* 0x28 */ u8 unk28; // destination palID ?
    /* 0x29 */ u8 unk29; // backgroundID?
    /* 0x2A */ u8 unk2A; // flags - 0x1: freed?, 0x4: copy palette, 0x8: active?
    /* 0x2B */ u8 unk2B;
    /* 0x2C */ u8 uiGfxID;
} Strc_80528AC; /* size: 0x30 */

typedef struct Strc_8055C50 {
    /* 0x00 */ void *vram0;
    /* 0x04 */ void *vram4;
    /* 0x08 */ void *vram8;
} Strc_8055C50;

typedef struct Strc_8052C84 {
    /* 0x00 */ u16 unk0; // TODO: qX?
    /* 0x02 */ u16 unk2; // TODO: qY?
    /* 0x04 */ s16 unk4; // TODO: angle
    /* 0x06 */ u16 unk6; // TODO: affineIndex
    /* 0x08 */ u16 unk8;
    /* 0x0A */ u16 unkA;
    /* 0x0C */ u16 unkC;
    /* 0x0E */ s16 byteCount;
    /* 0x10 */ u16 unk10;
    /* 0x12 */ u16 unk12;
    /* 0x14 */ u8 filler14[2];
    /* 0x16 */ u8 unk16;
} Strc_8052C84; /* size: 0x18 */ // <- GameOverB struct?

extern Task *gTask_03006240;

struct GfxSubstruct {
    struct GfxSubstruct *next;

    GraphicsData graphics;
    // void *rom;
    // void *vram;
    // u8 fillerC[4];
};

struct Strc_30063F0 {
    struct Strc_30063F0 *next;
    u8 unk4[10];
    s32 unk10;
    s32 unk14;
    u32 unk18; // bgID?
    u32 unk1C;
    u8 unk20;
}; /* 0x30 ?? */

typedef struct {
    /* 0x000 */ struct Strc0 unk0[10]; // TODO: might be more in this array?
    /* 0x078 */ u8 filler78[0xF0];
    /* 0x168 */ struct GfxSubstruct *first;
    /* 0x16C */ struct GfxSubstruct gfxList[16]; // last entry empty?
    /* 0x26C */ u8 filler26C[0xE0];
} Task_3006240; /* 0x34C */

struct Strc_3006250 {
    struct Strc_3006250 *next;
    u8 unk4[0x20];
}; /* 0x24 */

void sub_80535C8(struct Strc0 *inTask, u8 param1);

void sub_80535FC(void);
IwramData UiGfxStackInit(void);
GraphicsData *UiGfxStackPop(void);
void sub_80528AC(Strc_80528AC *strc);
// TODO: Is this the correct module?
void sub_8052C84(const char *param0, Strc_8052C84 *param1);
void sub_8052F78(const char *param0, struct GameOverB *strc);
void sub_80530CC(const char *param0, struct GameOverB *param1);
void sub_8055C50(Strc_8055C50 *param0);

#endif // GUARD_gTask_03006240