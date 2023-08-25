#include "global.h"
#include "core.h"
#include "malloc_vram.h"
#include "task.h"
#include "trig.h"
#include "lib/m4a.h"
#include "game/game.h"
#include "game/entity.h"
#include "game/interactables_2/ice_paradise/big_snowball.h"
#include "constants/animations.h"
#include "constants/player_transitions.h"
#include "constants/songs.h"

struct Test {
    s16 unk0;
    s16 unk2;
};

struct Test2 {
    s16 unk0;
    s16 unk2;
    s16 unk4;
    s16 unk6;
};

typedef struct {
    Sprite unk0;
    Sprite unk30;
    Sprite unk60;
    Sprite unk90;
    Sprite unkC0;
    struct Test2 unkF0[13];
    u32 unk158;
    u32 unk15C;
    u16 unk160;
    s32 unk164;
    s32 unk168;
    s32 unk16C;
    u16 unk170;
    s32 unk174;
    struct Test unk178[13];
    s16 unk1AC;
    s16 unk1AE;
    s16 unk1B0;
    s16 unk1B2;
    void *vram; /* 0x1B4 */
    MapEntity *me; /* 0x1B8 */
    u8 unk1BC;
    u8 unk1BD;
} Sprite_IA69 /*size: 0x1C0 */;

void Task_Interactable069(void);
void TaskDestructor_Interactable069(struct Task *);

void CreateEntity_BigSnowball(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                              u8 spriteY)
{
    struct Task *t = TaskCreate(Task_Interactable069, 0x1C0, 0x2010, 0,
                                TaskDestructor_Interactable069);
    Sprite *sprite;
    Sprite_IA69 *ia69 = TaskGetStructPtr(t);
    void *vramBase;
    void *vram;
    u32 temp;
    ia69->unk1AC = me->d.sData[0] * TILE_WIDTH;
    ia69->unk1AE = me->d.sData[1] * TILE_WIDTH;
    ia69->unk1B0 = me->d.uData[2] * TILE_WIDTH + ia69->unk1AC;
    ia69->unk1B2 = me->d.uData[3] * TILE_WIDTH + ia69->unk1AE;
    ia69->me = me;
    ia69->unk1BC = me->x;
    ia69->unk1BD = spriteY;

    ia69->unk158 = TO_WORLD_POS(me->x, spriteRegionX);
    ia69->unk15C = TO_WORLD_POS(me->y, spriteRegionY);

    temp = Q_24_8(ia69->unk1B2 - ia69->unk1AE);
    ia69->unk160 = (temp / Q_24_8(6)) + 0x78;
    ia69->unk164 = 0;
    ia69->unk168 = 0;
    ia69->unk16C = -1;
    ia69->unk170 = 0;

    sprite = &ia69->unk0;
    vramBase = VramMalloc(0x1F);
    ia69->vram = vramBase;

    sprite->unk1A = 0x480;
    sprite->graphics.size = 0;
    sprite->animCursor = 0;
    sprite->unk1C = 0;
    sprite->unk21 = -1;
    sprite->unk22 = 0x10;
    sprite->palId = 0;
    sprite->hitboxes[0].index = -1;
    sprite->unk10 = 0x2000;
    sprite->graphics.dest = vramBase;
    sprite->graphics.anim = SA2_ANIM_BIG_SNOWBALL;
    sprite->variant = 0;
    sub_8004558(sprite);

    vram = vramBase + 0x200;
    sprite = &ia69->unk30;
    sprite->unk1A = 0x480;
    sprite->graphics.size = 0;
    sprite->animCursor = 0;
    sprite->unk1C = 0;
    sprite->unk21 = -1;
    sprite->unk22 = 0x10;
    sprite->palId = 0;
    sprite->hitboxes[0].index = -1;
    sprite->unk10 = 0x2000;
    sprite->graphics.dest = vram;
    sprite->graphics.anim = SA2_ANIM_BIG_SNOWBALL;
    sprite->variant = 1;
    sub_8004558(sprite);

    vram = vramBase + 800;
    sprite = &ia69->unk60;
    sprite->unk1A = 0x480;
    sprite->graphics.size = 0;
    sprite->animCursor = 0;
    sprite->unk1C = 0;
    sprite->unk21 = -1;
    sprite->unk22 = 0x10;
    sprite->palId = 0;
    sprite->hitboxes[0].index = -1;
    sprite->unk10 = 0x2000;
    sprite->graphics.dest = vram;
    sprite->graphics.anim = SA2_ANIM_BIG_SNOWBALL;
    sprite->variant = 2;
    sub_8004558(sprite);

    vram = vramBase + 928;
    sprite = &ia69->unk90;
    sprite->unk1A = 0x480;
    sprite->graphics.size = 0;
    sprite->animCursor = 0;
    sprite->unk1C = 0;
    sprite->unk21 = -1;
    sprite->unk22 = 0x10;
    sprite->palId = 0;
    sprite->hitboxes[0].index = -1;
    sprite->unk10 = 0x2000;
    sprite->graphics.dest = vram;
    sprite->graphics.anim = SA2_ANIM_BIG_SNOWBALL;
    sprite->variant = 3;
    sub_8004558(sprite);

    vram = vramBase + 960;
    sprite = &ia69->unkC0;
    sprite->unk1A = 0x480;
    sprite->graphics.size = 0;
    sprite->animCursor = 0;
    sprite->unk1C = 0;
    sprite->unk21 = -1;
    sprite->unk22 = 0x10;
    sprite->palId = 0;
    sprite->hitboxes[0].index = -1;
    sprite->unk10 = 0x2000;
    sprite->graphics.dest = vram;
    sprite->graphics.anim = SA2_ANIM_BIG_SNOWBALL;
    sprite->variant = 4;
    sub_8004558(sprite);
    SET_MAP_ENTITY_INITIALIZED(me);
}

void sub_8078E48(Sprite_IA69 *ia69)
{
    u8 i;
    struct Test *unk178 = ia69->unk178;
    struct Test2 *unkF0;

    for (i = 0; i < 1; i++, unk178++) {
        unk178->unk0 = 0;
        unk178->unk2 = 0;
    }

    for (i = 0; i < 2; i++, unk178++) {
        if (i & 1) {
            u32 temp = ((u32)PseudoRandom32() >> 0x14);
            temp += 0x1000;
            unk178->unk0 = temp;
            unk178->unk2 = -((u32)PseudoRandom32() >> 0x14);
        } else {
            u32 temp = -((u32)PseudoRandom32() >> 0x14);
            temp -= 0x1000;
            unk178->unk0 = temp;
            unk178->unk2 = -((u32)PseudoRandom32() >> 0x14);
        }
    }

    for (i = 0; i < 2; i++, unk178++) {
        if (i & 1) {
            u32 temp;
            temp = ((u32)PseudoRandom32() >> 0x14);
            temp += 0x800;
            unk178->unk0 = temp;
            unk178->unk2 = -((u32)PseudoRandom32() >> 0x13) - 0x1000;
        } else {
            u32 temp;
            temp = -((u32)PseudoRandom32() >> 0x14);
            temp -= 0x800;
            unk178->unk0 = temp;
            unk178->unk2 = -((u32)PseudoRandom32() >> 0x13) - 0x1000;
        }
    }

    for (i = 0; i < 4; i++, unk178++) {
        u32 temp = ((u32)PseudoRandom32() >> 0x12);
        temp -= 0x2000;
        unk178->unk0 = temp;
        unk178->unk2 = -((u32)PseudoRandom32() >> 0x12);
    }

    for (i = 0; i < 4; i++, unk178++) {
        u32 temp = ((u32)PseudoRandom32() >> 0x12);
        temp -= 0x2000;
        unk178->unk0 = temp;
        unk178->unk2 = -((u32)PseudoRandom32() >> 0x12);
    }

    unkF0 = ia69->unkF0;
    for (i = 0; i < 1; i++, unkF0++) {
        unkF0->unk0 = 0;
        unkF0->unk2 = 0;
        unkF0->unk4 = 0;
        unkF0->unk6 = -0x300;
    }

    for (i = 0; i < 2; i++, unkF0++) {
        if (i & 1) {
            u32 temp = ((u32)PseudoRandom32() & 0x7FF);
            temp -= 0x400;
            unkF0->unk0 = temp;
            unkF0->unk2 = 0;
            unkF0->unk4 = (PseudoRandom32() & 0x1F) + 0x20;
            unkF0->unk6 = -0x2C0;
        } else {
            u32 temp = ((u32)PseudoRandom32() & 0x7FF);
            u32 temp2 = 0x400;
            temp2 -= temp;
            unkF0->unk0 = temp2;
            unkF0->unk2 = 0;
            unkF0->unk4 = -(((u32)PseudoRandom32() & 0x1F) + 0x20);
            unkF0->unk6 = -0x2C0;
        }
    }

    for (i = 0; i < 2; i++, unkF0++) {
        if (i & 1) {
            u32 temp = ((u32)PseudoRandom32() & 0x1FFF);
            temp -= 0x1000;
            unkF0->unk0 = temp;
            unkF0->unk2 = 0;
            unkF0->unk4 = (PseudoRandom32() & 0x3F) + 0x30;
            unkF0->unk6 = -0x280;

        } else {
            u32 temp = ((u32)PseudoRandom32() & 0x1FFF);
            u32 temp2 = 0x1000;
            temp2 -= temp;
            unkF0->unk0 = temp2;
            unkF0->unk2 = 0;
            unkF0->unk4 = -((PseudoRandom32() & 0x3F) + 0x30);
            unkF0->unk6 = -0x280;
        }
    }

    for (i = 0; i < 8; i++, unkF0++) {
        u32 temp2, temp;

        temp = ((u32)PseudoRandom32() & 0x3FFF) - 0x2000;
        unkF0->unk0 = temp;
        temp2 = ((u32)PseudoRandom32() & 0xFFF);
        unkF0->unk2 = temp2;

        if (unkF0->unk0 > 0) {
            unkF0->unk4 = ((u32)PseudoRandom32() & 0x3F) + 0x40;
            unkF0->unk6 = -0x240;
        } else {
            unkF0->unk4 = -(((u32)PseudoRandom32() & 0x3F) + 0x40);
            unkF0->unk6 = -0x240;
        }
    }
}

void sub_8079510(Sprite_IA69 *ia69);

void sub_80791B4(Sprite_IA69 *ia69)
{
    u32 temp = gUnknown_03005590 / ia69->unk160;
    u32 temp2 = gUnknown_03005590 % ia69->unk160;

    if (ia69->unk16C != temp) {
        sub_8078E48(ia69);
        ia69->unk16C = temp;
    }

    ia69->unk168 = temp2 * 0x600;
    temp2 = ia69->unk168 - ia69->unk1B2 * 0x100;
    if (ia69->unk168 > ia69->unk1B2 * 0x100) {
        ia69->unk174 = 1;
        if (ia69->unk168 - ia69->unk1B2 * 0x100 > 0x3C00) {
            sub_8079510(ia69);
        }
    } else {
        u8 i;
        struct Test *unk178;
        ia69->unk174 = 0;

        unk178 = &ia69->unk178[5];

        for (i = 0; i < 8; i++, unk178++) {
            unk178->unk2 -= 0x200;
            if (unk178->unk2 < -0x6000) {
                u32 temp = ((u32)PseudoRandom32() >> 0x12);
                temp -= 0x2000;
                unk178->unk0 = temp;
                unk178->unk2 = -((u32)PseudoRandom32() >> 0x12);
            }
        }
    }
}

void sub_8079560(Sprite_IA69 *ia69);

void sub_80792AC(Sprite_IA69 *ia69)
{
    struct Test *unk178;
    u8 i;
    s16 temp;
    if ((ia69->unk168 - ia69->unk1B2 * 0x100) <= 0x3C00) {
        unk178 = ia69->unk178;
        temp = ia69->unk1B2 - ia69->unk1AE;

        for (i = 0; i < 1; i++, unk178++) {
            s32 temp2 = Q_24_8_TO_INT(ia69->unk168 + unk178->unk2);
            if (temp2 < temp) {
                ia69->unk0.x = ia69->unk158 - gCamera.x
                    + Q_24_8_TO_INT(ia69->unk164 + unk178->unk0);
                ia69->unk0.y = ia69->unk15C - gCamera.y + temp2;
                sub_80051E8(&ia69->unk0);
            }
        }

        for (i = 0; i < 2; i++, unk178++) {
            s32 temp2 = Q_24_8_TO_INT(ia69->unk168 + unk178->unk2);
            if (temp2 < temp) {
                ia69->unk30.x = ia69->unk158 - gCamera.x
                    + Q_24_8_TO_INT(ia69->unk164 + unk178->unk0);
                ia69->unk30.y = ia69->unk15C - gCamera.y + temp2;
                sub_80051E8(&ia69->unk30);
            }
        }

        for (i = 0; i < 2; i++, unk178++) {
            s32 temp2 = Q_24_8_TO_INT(ia69->unk168 + unk178->unk2);
            if (temp2 < temp) {
                ia69->unk60.x = ia69->unk158 - gCamera.x
                    + Q_24_8_TO_INT(ia69->unk164 + unk178->unk0);
                ia69->unk60.y = ia69->unk15C - gCamera.y + temp2;
                sub_80051E8(&ia69->unk60);
            }
        }

        for (i = 0; i < 4; i++, unk178++) {
            s32 temp2 = Q_24_8_TO_INT(ia69->unk168 + unk178->unk2);
            if (temp2 < temp) {
                ia69->unk90.x = ia69->unk158 - gCamera.x
                    + Q_24_8_TO_INT(ia69->unk164 + unk178->unk0);
                ia69->unk90.y = ia69->unk15C - gCamera.y + temp2;
                sub_80051E8(&ia69->unk90);
            }
        }

        for (i = 0; i < 4; i++, unk178++) {
            s32 temp2 = Q_24_8_TO_INT(ia69->unk168 + unk178->unk2);
            if (temp2 < temp) {
                ia69->unkC0.x = ia69->unk158 - gCamera.x
                    + Q_24_8_TO_INT(ia69->unk164 + unk178->unk0);
                ia69->unkC0.y = ia69->unk15C - gCamera.y + temp2;
                sub_80051E8(&ia69->unkC0);
            }
        }
    } else {
        sub_8079560(ia69);
    }
}

void sub_8079510(Sprite_IA69 *ia69)
{
    struct Test2 *unkF0 = ia69->unkF0;

    u8 i;

    for (i = 0; i < 13; i++, unkF0++) {
        if (unkF0->unk6 < 1 || unkF0->unk2 < 1) {
            unkF0->unk0 += unkF0->unk4;
            unkF0->unk2 += unkF0->unk6;
            unkF0->unk6 += 0x2A;

            if (unkF0->unk6 > 0x600) {
                unkF0->unk6 = 0x600;
            }
        }
    }
}

void sub_8079560(Sprite_IA69 *ia69)
{
    s32 unk158 = ia69->unk158;
    s32 temp = ia69->unk15C + ia69->unk1B2;
    struct Test2 *unkF0 = ia69->unkF0;
    u8 i;

    for (i = 0; i < 13; i++, unkF0++) {
        if (unkF0->unk6 < 1 || unkF0->unk2 < 1) {
            if (i & 1) {
                ia69->unk90.x = (unk158 - gCamera.x) + Q_24_8_TO_INT(unkF0->unk0);
                ia69->unk90.y = (temp - gCamera.y) + Q_24_8_TO_INT(unkF0->unk2);
                sub_80051E8(&ia69->unk90);
            } else {
                ia69->unkC0.x = (unk158 - gCamera.x) + Q_24_8_TO_INT(unkF0->unk0);
                ia69->unkC0.y = (temp - gCamera.y) + Q_24_8_TO_INT(unkF0->unk2);
                sub_80051E8(&ia69->unkC0);
            }
        }
    }
}

bool32 sub_8079624(Sprite_IA69 *ia69)
{
    s32 temp1, temp;
    s16 temp2, temp3;
    temp1 = ia69->unk158;
    temp1 -= gCamera.x;
    temp = ia69->unk15C;
    temp -= gCamera.y;

    temp2 = temp1;
    temp3 = temp;
    if ((temp2 + ia69->unk1B0) < -128 || (temp2 + ia69->unk1AC) > 368
        || (temp3 + ia69->unk1B2) < -128 || (temp3 + ia69->unk1AE) >= 289) {
        return TRUE;
    }

    return FALSE;
}

bool32 sub_80796A8(Sprite_IA69 *ia69)
{

    if (!PLAYER_IS_ALIVE || ia69->unk1B2 - Q_24_8_TO_INT(ia69->unk168) <= 0x3F) {
        return FALSE;
    } else {
        s16 posX = ia69->unk158 + Q_24_8_TO_INT(ia69->unk164) - gCamera.x;
        s16 posY = ia69->unk15C + Q_24_8_TO_INT(ia69->unk168) - gCamera.y;
        s16 playerX = Q_24_8_TO_INT(gPlayer.x) - gCamera.x;
        s16 playerY = Q_24_8_TO_INT(gPlayer.y) - gCamera.y;

        if ((posX - 0x20) <= playerX && (posX + 0x20) >= playerX) {
            if ((posY - 0x20) <= playerY && posY >= playerY) {
                return TRUE;
            }
        }

        return FALSE;
    }
}

void sub_80797AC(Sprite_IA69 *);
void sub_80797E8(Sprite_IA69 *);

void Task_Interactable069(void)
{
    Sprite_IA69 *ia69 = TaskGetStructPtr(gCurTask);
    sub_80791B4(ia69);

    if (sub_80796A8(ia69)) {
        sub_80797AC(ia69);
    }

    if (sub_8079624(ia69)) {
        sub_80797E8(ia69);
    } else {
        sub_80792AC(ia69);
    }
}

void TaskDestructor_Interactable069(struct Task *t)
{
    Sprite_IA69 *ia69 = TaskGetStructPtr(t);
    VramFree(ia69->vram);
}

void sub_8079810(void);

void sub_80797AC(Sprite_IA69 *ia69)
{
    Player_SetMovestate_IsInScriptedSequence();
    gPlayer.moveState |= MOVESTATE_400000;
    gPlayer.unk64 = 0x14;
    gPlayer.speedAirX = 0;
    gPlayer.speedAirY = 0;
    gPlayer.speedGroundX = 0;
    gCurTask->main = sub_8079810;
}

void sub_80797E8(Sprite_IA69 *ia69)
{
    SET_MAP_ENTITY_NOT_INITIALIZED(ia69->me, ia69->unk1BC);
    TaskDestroy(gCurTask);
}

void sub_8079888(Sprite_IA69 *);

void sub_8079810(void)
{
    Sprite_IA69 *ia69 = TaskGetStructPtr(gCurTask);
    sub_80791B4(ia69);

    if (!PLAYER_IS_ALIVE) {
        Player_ClearMovestate_IsInScriptedSequence();
        gCurTask->main = Task_Interactable069;
    } else {
        gPlayer.y = ia69->unk15C * 0x100 + ia69->unk168 - 0x1000;

        if (ia69->unk174) {
            sub_8079888(ia69);
        }
    }
    sub_80792AC(ia69);
}

void sub_8079888(Sprite_IA69 *ia69)
{
    Player_ClearMovestate_IsInScriptedSequence();

    if (PLAYER_IS_ALIVE) {
        gPlayer.moveState &= ~MOVESTATE_400000;
        gPlayer.transition = PLTRANS_PT9;
    }

    gCurTask->main = Task_Interactable069;
}
