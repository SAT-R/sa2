#include "core.h"
#include "game/interactables_2/egg_utopia/093.h"
#include "lib/m4a.h"
#include "trig.h"
#include "game/math.h"

#include "constants/songs.h"

typedef struct {
    Sprite sprite1;
    Sprite sprite2;
    s32 x;
    s32 y;
    u16 unk68;
    u16 unk6A;
    u16 unk6C;
    u16 unk6E;
    MapEntity *me;
    u8 spriteX;
    u8 spriteY;
} Sprite_Cannon; /* 0x78 */

void Task_Interactable093(void);
void TaskDestructor_Interactable093(struct Task *);

void initSprite_Interactable093(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                                u8 spriteY)
{
    Sprite *sprite;
    struct Task *t = TaskCreate(Task_Interactable093, sizeof(Sprite_Cannon), 0x2010, 0,
                                TaskDestructor_Interactable093);
    Sprite_Cannon *cannon = TaskGetStructPtr(t);
    cannon->unk68 = me->d.sData[0];
    cannon->x = TO_WORLD_POS(me->x, spriteRegionX);
    cannon->y = TO_WORLD_POS(me->y, spriteRegionY);
    cannon->me = me;
    cannon->spriteX = me->x;
    cannon->spriteY = spriteY;

    if (cannon->unk68 == 0) {
        cannon->unk6A = 0x200;
    } else {
        cannon->unk6A = 0;
    }

    sprite = &cannon->sprite2;
    sprite->unk1A = 0x1C0;
    sprite->graphics.size = 0;
    sprite->unk14 = 0;
    sprite->unk1C = 0;
    sprite->unk21 = -1;
    sprite->unk22 = 0x10;
    sprite->focused = 0;
    sprite->unk28[0].unk0 = -1;
    sprite->unk10 = 0x2000;
    sprite->graphics.dest = (void *)OBJ_VRAM0 + 0x2C80;

    // TODO: anim cannon?
    sprite->graphics.anim = 0x268;
    sprite->variant = 1;
    sub_8004558(sprite);
    SET_MAP_ENTITY_INITIALIZED(me);
}

void sub_807E56C(Sprite_Cannon *);
void sub_807E5F0(Sprite_Cannon *);
void sub_807E408(Sprite_Cannon *);

void sub_807E314(void)
{
    Sprite_Cannon *cannon = TaskGetStructPtr(gCurTask);
    if (!PLAYER_IS_ALIVE || --cannon->unk6C == 0xFFFF
        || gPlayer.unk5E & (gPlayerControls.jump | gPlayerControls.attack)) {
        sub_807E408(cannon);
    } else {
        sub_807E56C(cannon);
    }

    sub_807E5F0(cannon);
}

void sub_807E7B0(void);

void sub_807E384(Sprite_Cannon *cannon)
{
    Player_SetMovestate_IsInScriptedSequence();
    gPlayer.moveState |= MOVESTATE_400000;
    gPlayer.unk64 = 4;
    m4aSongNumStart(SE_SPIN_ATTACK);

    if (cannon->unk68 == 0) {
        gPlayer.x = Q_24_8(cannon->x + 0x28);
        gPlayer.y = Q_24_8(cannon->y);
        gPlayer.moveState |= MOVESTATE_FACING_LEFT;
    } else {
        gPlayer.x = Q_24_8(cannon->x - 0x28);
        gPlayer.y = Q_24_8(cannon->y);
        gPlayer.moveState &= ~MOVESTATE_FACING_LEFT;
    }

    gPlayer.speedGroundX = 0;
    gPlayer.speedAirX = 0;
    gPlayer.speedAirY = 0;
    gCurTask->main = sub_807E7B0;
}

void sub_807E7F8(void);

void sub_807E408(Sprite_Cannon *cannon)
{
    Player_ClearMovestate_IsInScriptedSequence();

    if (PLAYER_IS_ALIVE) {
        gPlayer.moveState &= ~MOVESTATE_400000;
        gPlayer.unk6D = 5;

        gPlayer.x += COS_24_8(cannon->unk6A) * 0x20;
        gPlayer.y += SIN_24_8(cannon->unk6A) * 0x20;
        gPlayer.speedAirX = COS_24_8(cannon->unk6A) * 0xF;
        gPlayer.speedAirY = SIN_24_8(cannon->unk6A) * 0xF;

        if (GRAVITY_IS_INVERTED) {
            gPlayer.speedAirY = -gPlayer.speedAirY;
        }

        gPlayer.rotation = cannon->unk6A >> 2;
        gPlayer.unk2C = 4;
        m4aSongNumStart(SE_289);
    }

    cannon->unk6E = 0;
    gCurTask->main = sub_807E7F8;
}

u32 sub_807E4E4(Sprite_Cannon *cannon)
{
    u8 temp = 0;
    s32 val = Q_24_8(cannon->x);

    if (gPlayer.x > val) {
        gPlayer.x -= Q_24_8(1);

        if (gPlayer.x < val) {
            gPlayer.x = val;
        }
    } else if (gPlayer.x < val) {
        gPlayer.x += Q_24_8(1);

        if (gPlayer.x > val) {
            gPlayer.x = val;
        }

    } else {
        temp++;
    }

    val = Q_24_8(cannon->y);

    if (gPlayer.y > val) {
        gPlayer.y -= Q_24_8(1);

        if (gPlayer.y < val) {
            gPlayer.y = val;
        }
    } else if (gPlayer.y < val) {
        gPlayer.y += Q_24_8(1);

        if (gPlayer.y > val) {
            gPlayer.y = val;
        }

    } else {
        temp++;
    }

    return temp == 2 ? 1 : 0;
}

void sub_807E56C(Sprite_Cannon *cannon)
{
    u16 r3;
    s16 temp2;
    s16 temp3;
    s32 mask;
    register s16 r0 asm("r0");
    s32 r1;

    r3 = cannon->unk68 == 0  ? cannon->unk6E == 0 ? 0x280 : 0x180
        : cannon->unk6E == 0 ? 0x80
                             : 0x380;
    temp2 = sub_808558C(cannon->unk6A, r3, 10);
    temp3 = temp2;

    if (abs(temp2) >= 5) {
        temp3 = -4;
        if (temp2 > 0) {
            temp3 = 4;
        }

    } else {
        cannon->unk6E ^= 1;
    }

    r0 = cannon->unk6A + temp3;
    mask = ONE_CYCLE;

#ifndef NON_MATCHING
    asm("add %0, %1, #0" : "=r"(r1) : "r"(mask) : "cc");
    r0 &= r1;
#else
    r0 &= mask;
#endif

    cannon->unk6A = r0;
}

void sub_807E5F0(Sprite_Cannon *cannon)
{
    struct UNK_808D124_UNK180 transform;
    Sprite *sprite = &cannon->sprite2;
    sprite->x = cannon->x - gCamera.x;
    sprite->y = cannon->y - gCamera.y;

    transform.unk0 = cannon->unk6A;
    transform.unk2 = 0x100;
    transform.unk4 = 0x100;
    transform.unk6[0] = sprite->x;
    transform.unk6[1] = sprite->y;

    sprite->unk10 = 0x2060 | gUnknown_030054B8++;
    if (cannon->unk68 == 0) {
        sprite->unk10 |= 0x400;
    }

    sub_8004860(sprite, &transform);
    sub_80051E8(sprite);
}

// void sub_807E66C(Sprite_Cannon *cannon)
// {
//     if (PLAYER_IS_ALIVE) {
//         s16 x = cannon->x - gCamera.x;
//         s16 playerX = Q_24_8(gPlayer.x) - gCamera.x;
//         if (x + cannon->sprite2.unk28[0].unk4 > playerX + gUnknown_03005AF0.unk1C) {
//             if (playerX + gUnknown_03005AF0.unk1C)
//         }
//     }
// }
