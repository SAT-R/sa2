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
