#include "core.h"
#include "sprite.h"
#include "malloc_vram.h"
#include "trig.h"
#include "game/game.h"
#include "game/entity.h"
#include "game/interactables_2/sky_canyon/small_windmill.h"
#include "lib/m4a.h"

#include "constants/move_states.h"
#include "constants/animations.h"
#include "constants/songs.h"

typedef struct {
    SpriteBase base;
    Sprite sprite;
    u8 unk3C;
    u8 unk3D;
    u8 unk3E;
    u8 unk3F;
    s32 x;
    s32 y;
} Sprite_SmallWindmill;

void Task_Interactable_SkyCanyon_SmallSpinnyWindmill(void);
void TaskDestructor_Interactable_SkyCanyon_SmallSpinnyWindmill(struct Task *);
void initSprite_Interactable_SkyCanyon_SmallSpinnyWindmill(MapEntity *me,
                                                           u16 spriteRegionX,
                                                           u16 spriteRegionY, u8 spriteY)
{
    struct Task *t
        = TaskCreate(Task_Interactable_SkyCanyon_SmallSpinnyWindmill, 0x48, 0x2010, 0,
                     TaskDestructor_Interactable_SkyCanyon_SmallSpinnyWindmill);
    Sprite_SmallWindmill *windmill = TaskGetStructPtr(t);
    Sprite *sprite;
    windmill->unk3C = me->d.uData[0];

    windmill->x = SpriteGetScreenPos(me->x, spriteRegionX);
    windmill->y = SpriteGetScreenPos(me->y, spriteRegionY);

    windmill->base.regionX = spriteRegionX;
    windmill->base.regionY = spriteRegionY;
    windmill->base.me = me;
    windmill->base.spriteX = me->x;
    windmill->base.spriteY = spriteY;

    sprite = &windmill->sprite;
    sprite->unk1A = 0x480;
    sprite->graphics.size = 0;
    sprite->unk14 = 0;
    sprite->unk1C = 0;
    sprite->unk21 = 0xFF;
    sprite->unk22 = 0x10;
    sprite->focused = 0;
    sprite->unk28[0].unk0 = -1;
    sprite->unk10 = 0x2000;
    sprite->graphics.dest = VramMalloc(0x20);
    sprite->graphics.anim = SA2_ANIM_CROSS_SKY_CAN;
    sprite->variant = 2;
    sub_8004558(sprite);

    SET_MAP_ENTITY_INITIALIZED(me);
}

void sub_807C0B4(void);

void sub_807BC1C(Sprite_SmallWindmill *windmill)
{
    Sprite *sprite = &windmill->sprite;
    s8 spriteX;
    Player_SetMovestate_IsInScriptedSequence();
    gPlayer.moveState |= MOVESTATE_400000;
    gPlayer.unk64 = 4;
    m4aSongNumStart(SE_SPIN_ATTACK);
    switch (windmill->unk3D) {
        case 1:
        case 2:
            windmill->unk3E = 0xA0;
            break;
        case 3:
        case 4:
            windmill->unk3E = 0xE0;
            break;
        case 5:
        case 6:
            windmill->unk3E = 0x60;
            break;
        case 7:
        case 8:
            windmill->unk3E = 0x20;
            break;
    }

    windmill->unk3F = windmill->unk3E;
    gPlayer.x = COS_24_8(windmill->unk3E * 4) * 0x18 + Q_24_8(windmill->x);
    gPlayer.y = SIN_24_8(windmill->unk3E * 4) * 0x18 + Q_24_8(windmill->y);

    switch (windmill->unk3D) {
        case 1:
        case 3:
        case 5:
        case 7:
            sprite->graphics.anim = 585;
            sprite->variant = 0;
            break;
        case 2:
        case 4:
        case 6:
        case 8:
            sprite->graphics.anim = 585;
            sprite->variant = 1;
            break;
    }
    sprite->unk22 = 0x20;

    sub_8004558(&windmill->sprite);
    gCurTask->main = sub_807C0B4;
}

void sub_807C110(void);

void sub_807BD7C(Sprite_SmallWindmill *windmill)
{
    Player_ClearMovestate_IsInScriptedSequence();

    if (PlayerIsAlive) {
        gPlayer.moveState &= ~MOVESTATE_400000;
        gPlayer.unk6D = 5;

        switch (windmill->unk3D) {
            case 2:
                gPlayer.moveState |= 1;
                gPlayer.speedAirX = -0x800;
                gPlayer.speedAirY = 0;
                break;
            case 1:
            case 4:
                gPlayer.speedAirX = 0;
                gPlayer.speedAirY = -0x800;
                break;
            case 5:
                gPlayer.moveState |= 1;
                gPlayer.speedAirX = -0x800;
                gPlayer.speedAirY = 0;
                break;
            case 6:
            case 7:
                gPlayer.speedAirX = 0;
                gPlayer.speedAirY = 0x800;
                break;
            case 3:
            case 8:
                gPlayer.moveState &= ~MOVESTATE_FACING_LEFT;
                gPlayer.speedAirX = 0x800;
                gPlayer.speedAirY = 0;
                break;
        }
    }
    windmill->unk3F = 0;
    gCurTask->main = sub_807C110;
}

u32 sub_807BE70(Sprite_SmallWindmill *windmill)
{
    switch (windmill->unk3D) {
        case 1:
        case 3:
        case 5:
        case 7:
            windmill->unk3F += 8;
            break;
        case 2:
        case 4:
        case 6:
        case 8:
            windmill->unk3F -= 8;
            break;
    }

    if (PlayerIsAlive) {
        gPlayer.x = COS_24_8(windmill->unk3F * 4) * 0x18 + Q_24_8(windmill->x);
        gPlayer.y = SIN_24_8(windmill->unk3F * 4) * 0x18 + Q_24_8(windmill->y);
    }

    return windmill->unk3F == windmill->unk3E;
}

u32 sub_807BF34(Sprite_SmallWindmill *windmill)
{
    if (PlayerIsAlive) {
        s16 x = windmill->x - gCamera.x;
        s16 y = windmill->y - gCamera.y;
        s16 playerX = Q_24_8_TO_INT(gPlayer.x) - gCamera.x;
        s16 playerY = Q_24_8_TO_INT(gPlayer.y) - gCamera.y;

        s16 dX = (x - playerX);
        s16 dY = (y - playerY);

        if (dX * dX + dY * dY < 0x401) {
            if (playerX <= x) {
                if (playerY <= y) {
                    if (windmill->unk3C & 1) {
                        if (abs(gPlayer.speedAirX) <= abs(gPlayer.speedAirY)) {
                            return 2;
                        } else {
                            return 1;
                        }
                    }
                } else {
                    if (windmill->unk3C & 4) {
                        if (abs(gPlayer.speedAirX) <= abs(gPlayer.speedAirY)) {
                            return 5;
                        } else {
                            return 6;
                        }
                    }
                }
            } else {
                if (playerY <= y) {
                    if (windmill->unk3C & 2) {
                        if (abs(gPlayer.speedAirX) <= abs(gPlayer.speedAirY)) {
                            return 3;
                        } else {
                            return 4;
                        }
                    }
                } else {
                    if (windmill->unk3C & 8) {
                        if (abs(gPlayer.speedAirX) <= abs(gPlayer.speedAirY)) {
                            return 8;
                        } else {
                            return 7;
                        }
                    }
                }
            }
        }
    }

    return 0;
}

u32 sub_807C20C(Sprite_SmallWindmill *);
void sub_807C1C0(Sprite_SmallWindmill *);
void sub_807C25C(Sprite_SmallWindmill *);

void Task_Interactable_SkyCanyon_SmallSpinnyWindmill(void)
{
    Sprite_SmallWindmill *windmill = TaskGetStructPtr(gCurTask);

    windmill->unk3D = sub_807BF34(windmill);
    if (windmill->unk3D != 0) {
        sub_807BC1C(windmill);
    }

    if (sub_807C20C(windmill)) {
        sub_807C25C(windmill);
    } else {
        sub_807C1C0(windmill);
    }
}

void sub_807C0B4(void)
{
    Sprite_SmallWindmill *windmill = TaskGetStructPtr(gCurTask);
    Sprite *sprite = &windmill->sprite;
    if (sub_807BE70(windmill) != 0) {
        sub_807BD7C(windmill);
    }

    if (sprite->unk10 & 0x4000) {
        sprite->unk10 &= ~0x4000;
        sprite->unk1E = -1;
        sprite->unk21 = -1;
    }
    sub_807C1C0(windmill);
}

void sub_807C18C(Sprite_SmallWindmill *);

void sub_807C110(void)
{
    Sprite_SmallWindmill *windmill = TaskGetStructPtr(gCurTask);
    Sprite *sprite = &windmill->sprite;

    if (sprite->unk10 & 0x4000) {
        sprite->unk10 &= ~0x4000;
        sprite->unk1E = -1;
        sprite->unk21 = -1;

        sprite->unk22 -= 8;
        if (sprite->unk22 == 0) {
            sub_807C18C(windmill);
        }
    }
    sub_807C1C0(windmill);
}

void TaskDestructor_Interactable_SkyCanyon_SmallSpinnyWindmill(struct Task *t)
{
    Sprite_SmallWindmill *windmill = TaskGetStructPtr(t);

    VramFree(windmill->sprite.graphics.dest);
}
