#include "global.h"
#include "gba/types.h"

#include "game/game.h"
#include "game/entity.h"
#include "sprite.h"
#include "task.h"
#include "trig.h"

#include "constants/move_states.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ s32 posX;
    /* 0x40 */ s32 posY;
    /* 0x44 */ u16 kind;
    /* 0x46 */ u8 filler46[0x2];
    /* 0x48 */ s16 unk48;
    /* 0x4A */ s16 unk4A;
    /* 0x4C */ s16 unk4C;
    /* 0x4E */ s16 unk4E;
    /* 0x50 */ u8 filler50[0x8];
} Sprite_IA087; /* size: 0x58 */

#define PROPDIR_LEFT                           0
#define PROPDIR_RIGHT                          1
#define SKYCAN_PROPELLER_KIND(dir, isPeriodic) (((isPeriodic) << 1) | (dir))

extern void initSprite_Interactable_SkyCanyon_SmallPropeller(MapEntity *me,
                                                             u16 spriteRegionX,
                                                             u16 spriteRegionY,
                                                             u8 spriteY, u8 kind);
extern void Task_Interactable_SkyCanyon_SmallPropeller(void);

void sub_807D468(Sprite_IA087 *);
void sub_807D5CC(Sprite_IA087 *);
void sub_807D6A8(Sprite_IA087 *);
bool32 sub_807D6FC(Sprite_IA087 *);

// static
s16 ClampGroundSpeed(s16);

void SetTaskMain_Interactable087(Sprite_IA087 *unused);

// static
s16 ClampGroundSpeed(s16 speed)
{
    if (gPlayer.unk5A) {
        CLAMP_INLINE2(speed, -Q_24_8(15.0), +Q_24_8(15.0));
    } else {
        // @BUG: It seems like this should have -9.0 as min-value?
        CLAMP_INLINE2(speed, -Q_24_8(15.0), +Q_24_8(9.0));
    }

    return speed;
}

bool32 sub_807D86C(Sprite_IA087 *ia087)
{
    s16 posX, posY;

    posX = ia087->posX - gCamera.x;
    posY = ia087->posY - gCamera.y;

    if (((posX + ia087->unk4C) < -128) || ((posX + ia087->unk48) > 368)
        || ((posY + ia087->unk4E) < -128) || ((posY + ia087->unk4A) > 288))
        return TRUE;

    return FALSE;
}

void DestroyTask_Interactable087(Sprite_IA087 *ia087)
{
    SET_MAP_ENTITY_NOT_INITIALIZED(ia087->base.me, ia087->base.spriteX);
    TaskDestroy(gCurTask);
}

void initSprite_Interactable_SkyCanyon_SmallPropeller_Left(MapEntity *me,
                                                           u16 spriteRegionX,
                                                           u16 spriteRegionY, u8 spriteY)
{
    initSprite_Interactable_SkyCanyon_SmallPropeller(
        me, spriteRegionX, spriteRegionY, spriteY,
        SKYCAN_PROPELLER_KIND(PROPDIR_LEFT, FALSE));
}

void initSprite_Interactable_SkyCanyon_SmallPropeller_Right(MapEntity *me,
                                                            u16 spriteRegionX,
                                                            u16 spriteRegionY,
                                                            u8 spriteY)
{
    initSprite_Interactable_SkyCanyon_SmallPropeller(
        me, spriteRegionX, spriteRegionY, spriteY,
        SKYCAN_PROPELLER_KIND(PROPDIR_RIGHT, FALSE));
}

void initSprite_Interactable_SkyCanyon_SmallPropeller_Left_Periodic(MapEntity *me,
                                                                    u16 spriteRegionX,
                                                                    u16 spriteRegionY,
                                                                    u8 spriteY)
{
    initSprite_Interactable_SkyCanyon_SmallPropeller(
        me, spriteRegionX, spriteRegionY, spriteY,
        SKYCAN_PROPELLER_KIND(PROPDIR_LEFT, TRUE));
}

void initSprite_Interactable_SkyCanyon_SmallPropeller_Right_Periodic(MapEntity *me,
                                                                     u16 spriteRegionX,
                                                                     u16 spriteRegionY,
                                                                     u8 spriteY)
{
    initSprite_Interactable_SkyCanyon_SmallPropeller(
        me, spriteRegionX, spriteRegionY, spriteY,
        SKYCAN_PROPELLER_KIND(PROPDIR_RIGHT, TRUE));
}

void Task_807D978(void)
{
    Sprite_IA087 *ia087 = TaskGetStructPtr(gCurTask);

    sub_807D468(ia087);

    if (!sub_807D6FC(ia087)) {
        SetTaskMain_Interactable087(ia087);
    }

    sub_807D5CC(ia087);
    sub_807D6A8(ia087);
}

void SetTaskMain_Interactable087(Sprite_IA087 *unused)
{
    gCurTask->main = Task_Interactable_SkyCanyon_SmallPropeller;
}