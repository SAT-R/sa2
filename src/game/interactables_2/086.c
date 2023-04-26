#include "global.h"
#include "game/game.h"
#include "game/entity.h"
#include "game/math.h"
#include "core.h"
#include "task.h"
#include "lib/m4a.h"
#include "game/interactables_2/080.h"
#include "malloc_vram.h"
#include "trig.h"
#include "constants/animations.h"
#include "constants/move_states.h"
#include "constants/songs.h"

typedef struct {
    u8 filler0[0x18];
    s32 someY;
    u8 filler1C[0x8];

    // TODO: unk24 might point to a struct type?
    u8 *unk24;
    u8 unk28;
    u8 filler29[0x3];
    u8 *vramMem;
} StrcUnkIA086;

typedef struct {
    /* 0x00 */ Sprite *s;
    /* 0x04 */ s8 unk4;
    /* 0x05 */ u8 filler5[3];
    /* 0x08 */ s32 unk8;
    /* 0x0C */ s32 unkC;
    /* 0x10 */ s32 unk10;
    /* 0x14 */ s32 unk14;
} Unk_IA86;

typedef struct {
    /* 0x00 */ Unk_IA86 unk0[4];
    /* 0x60 */ u8 filler60[0x128];

    /* 0x188 */ s32 unk188;
    /* 0x18C */ s32 unk18C;
    /* 0x190 */ u8 filler190[0x8];
    /* 0x198 */ Sprite sprites[3];
    /* 0x228 */ StrcUnkIA086 unk228;
} Sprite_IA86; /* size: 0x258 (600) */

void sub_807C9C0(Sprite_IA86 *);
bool32 sub_807CB78(Sprite_IA86 *);
bool32 sub_807CA64(Sprite_IA86 *);
bool32 sub_807CF2C(Sprite_IA86 *);
bool32 sub_807CFB4(Sprite_IA86 *);
void sub_807CCBC(Sprite_IA86 *);
void sub_807CE94(Sprite_IA86 *);
void sub_807D100(Sprite_IA86 *);
void sub_807D130(Sprite_IA86 *);
void sub_807D188(Sprite_IA86 *);
void sub_807D16C(Sprite_IA86 *);
void Task_807D268(void);
void sub_807D2BC(Sprite_IA86 *);

void initSprite_Interactable086(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                                u8 spriteY, u32 kind);

// static
void Task_807D06C(void);

extern u8 gUnknown_080E0136[8];

void Task_807D06C(void)
{
    Sprite_IA86 *ia086 = TaskGetStructPtr(gCurTask);

    if (sub_807CFB4(ia086)) {
        m4aSongNumStart(SE_285);
        sub_807C9C0(ia086);
    }

    if (sub_807CF2C(ia086)) {
        sub_807D188(ia086);
    } else {
        sub_807CCBC(ia086);
        sub_807CE94(ia086);
        sub_807D16C(ia086);
    }
}

void Task_807D0C4(void)
{
    Sprite_IA86 *ia086 = TaskGetStructPtr(gCurTask);

    if (!PLAYER_IS_ALIVE) {
        gCurTask->main = Task_807D06C;
    } else if (sub_807CA64(ia086)) {
        sub_807D130(ia086);
    }

    sub_807CCBC(ia086);
    sub_807CE94(ia086);
    sub_807D16C(ia086);
}

void TaskDestructor_Interactable086(struct Task *t)
{
    Sprite_IA86 *ia086 = TaskGetStructPtr(t);
    VramFree(ia086->unk228.vramMem);
}

void sub_807D130(Sprite_IA86 *ia086)
{
    ia086->unk188 = 0;
    ia086->unk18C = gPlayer.y - Q_24_8(ia086->unk228.someY);

    gCurTask->main = Task_807D268;
}

void sub_807D16C(Sprite_IA86 *unused)
{
    if ((gUnknown_03005590 & 0xFF) == 0) {
        m4aSongNumStartOrContinue(SE_285);
    }
}

void sub_807D188(Sprite_IA86 *ia086)
{
    m4aSongNumStop(SE_285);

    *ia086->unk228.unk24 = ia086->unk228.unk28;

    TaskDestroy(gCurTask);
}

void sub_807D1BC(Sprite_IA86 *ia086)
{
    u8 i;
    for (i = 0; i < 4; i++) {
        Unk_IA86 *unk = &ia086->unk0[i];

        s32 spriteIndex = gUnknown_080E0136[Random() & 0x7];
        unk->s = &ia086->sprites[spriteIndex];
        unk->unk4 = Random();
        unk->unk8 = 0;
        unk->unkC = -Q_24_8(Random() & 0x3F);
        unk->unk10 = 0;
        unk->unk14 = 0;
    }

    sub_807CCBC(ia086);
}

void initSprite_Interactable086_0(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                                  u8 spriteY)
{
    initSprite_Interactable086(me, spriteRegionX, spriteRegionY, spriteY, 0);
}

void initSprite_Interactable086_1(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                                  u8 spriteY)
{
    initSprite_Interactable086(me, spriteRegionX, spriteRegionY, spriteY, 1);
}

void Task_807D268(void)
{
    Sprite_IA86 *sprite = TaskGetStructPtr(gCurTask);

    if (!PLAYER_IS_ALIVE) {
        gCurTask->main = Task_807D06C;
    } else if (sub_807CB78(sprite)) {
        sub_807D2BC(sprite);
    }
    sub_807CCBC(sprite);
    sub_807CE94(sprite);
    sub_807D16C(sprite);
}

void sub_807D2BC(Sprite_IA86 *unused)
{
    gPlayer.moveState &= ~MOVESTATE_400000;
    gPlayer.unk6D = 7;
    gPlayer.speedAirX = 0;
    gPlayer.speedAirY = -Q_24_8(8.0);

    gCurTask->main = Task_807D06C;
}