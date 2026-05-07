#ifndef GUARD_SA1_GAME_STAGE_UI_H
#define GUARD_SA1_GAME_STAGE_UI_H

#include "gba/types.h" // for bool32
#include "game/sa1/ui/game_over.h"
#include "game/sa1/stage/ui_rendering.h" // Strc_8052C84 *

/* NOTE: This header is much more complicated than it needs to be.
         It originated from splitting a "UI" module,
         which wasn't one module after all, but the parts called functions that have shared
         struct pointers as parameters.
*/

bool8 sub_805423C(StrcUi_805423C *param0);
void sub_80543A4(StrcUi_805423C *param0);

#define UI_OAM_ORDER_INDEX 1

#define UI_DIGIT(_digit)      ((_digit) + 32)
#define FROM_UI_DIGIT(_digit) ((_digit)-32)

typedef struct {
    u8 unk0[3];
    u8 unk3;
    u8 filler4[4];
    u8 unk9;
    u8 unkA;
    u8 unkB;
} StageUI_10;

typedef struct {
    u8 unk0;
    u8 unk1;
    u8 unk2;
    u8 unk3;
    u8 unk4;
    u8 unk5;
    u8 unk6;
    u8 unk7;
} StageUI_20;

typedef struct {
    /* 0x00 */ u8 digitsRings[8];
    /* 0x08 */ s16 unk8;
    /* 0x0A */ s16 unkA;
    /* 0x0C */ s16 unkC;
    /* 0x0E */ s16 unkE;
    /* 0x10 */ StageUI_10 unk10;
    /* 0x1C */ u8 filler1C[0x4];
    /* 0x20 */ StageUI_20 unk20;
    /* 0x28 */ u8 filler28[0x8];
    /* 0x30 */ u8 digitLives;
    /* 0x31 */ u8 filler31[0xF];
    /* 0x40 */ u16 unk40;
    /* 0x31 */ u8 filler42[0x2];
    /* 0x44 */ u16 ringCount;
    /* 0x46 */ u8 filler46[0x2];
    /* 0x48 */ u16 unk48;
    /* 0x4A */ u8 filler4A[0x2];
    /* 0x4C */ s16 unk4C;
    /* 0x4E */ u8 filler4E[0x2];
} StageUI; /* 0x50 */

typedef struct {
    // TODO: Seems like this (until incl. unk16?) is GameOverB?
    GameOverB unk0;

    s16 unk18;
    u16 unk1A;
    void *unk1C;
    bool8 unk20;
    u8 unk21;
} Strc_Ui_24;

typedef struct {
    /* 0x00 */ StrcUi_805423C unk0;
    /* 0x0C */ struct Task *taskC; // -> Strc_Ui_24
    /* 0x10 */ struct Task *task10; // -> Strc_Ui_24
    /* 0x14 */ struct Task *task14; // -> Strc_Ui_24
    /* 0x18 */ struct Task *task18; // -> Strc_Ui_24
    /* 0x1C */ struct Task *task1C; // -> Strc_Ui_24
    /* 0x20 */ struct Task *task20; // -> Strc_Ui_24
    /* 0x24 */ s16 unk24;
    /* 0x26 */ bool8 unk26;
    /* 0x27 */ u8 unk27;
} Strc_Ui_28;

typedef struct {
    void *vram0;
    void *vram4;
    void *vram8;
    void *vramC;
    void *vram10;
    struct Task *task14;
    struct Task *task18;
    struct Task *task1C;
    struct Task *task20;
    struct Task *task24;
} StrcStack;

void LoadStageIntroGraphics(StrcStack *param0);
void sub_804A5D8(s32 x, s32 y);

void CreateStageUI(void);
void CreateSpecialStageUI(void);

// TODO: Maybe param1 is actually (GameOverB *) ?
void sub_8052E40(u8 *param0, Strc_8052C84 *param1);
void sub_80538BC(void);
bool32 sub_80549FC(void);

#endif // GUARD_SA1_GAME_STAGE_UI_H