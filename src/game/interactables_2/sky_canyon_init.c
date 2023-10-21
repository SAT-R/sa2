#include "global.h"

#include "sprite.h"
#include "task.h"

#include "game/interactables_2/sky_canyon_init.h"

#include "constants/animations.h"

typedef struct {
    /* 0x00 */ Sprite spring;
    /* 0x30 */ Sprite propellor;
    /* 0x60 */ u16 unk60;
    /* 0x62 */ u16 unk62;
} Sprite_OnInit_SkyCanyon;

static void Task_80808DC(void);

/* sub_80807CC is pointed to by 'gSpriteTileInits_PreStageEntry' inside entities_0.s
 * Which itself is referenced by 'CreateStageEntitiesManager'
 * It is called on stage-entry of ONLY Sky Canyon Acts 1 & 2,
 * the other pointers inside 'gSpriteTileInits_PreStageEntry' are empty.
 */

struct Task *sub_80807CC(void)
{
    struct Task *t
        = TaskCreate(Task_80808DC, sizeof(Sprite_OnInit_SkyCanyon), 0x2001, 0, NULL);
    Sprite_OnInit_SkyCanyon *init = TASK_DATA(t);
    Sprite *spring, *propellor;

    init->unk60 = 0;
    init->unk62 = 0;

    spring = &init->spring;
    spring->unk1A = 0x480;
    spring->graphics.size = 0;
    spring->animCursor = 0;
    spring->timeUntilNextFrame = 0;
    spring->prevVariant = -1;
    spring->animSpeed = 0x10;
    spring->palId = 0;
    spring->hitboxes[0].index = -1;
    spring->unk10 = 0x2000;
    spring->graphics.dest = (void *)(OBJ_VRAM0 + 0x3040);
    spring->graphics.anim = SA2_ANIM_SPRING_FLYING;
    spring->variant = 0;
    UpdateSpriteAnimation(&init->spring);

    propellor = &init->propellor;
    propellor->unk1A = 0x480;
    propellor->graphics.size = 0;
    propellor->animCursor = 0;
    propellor->timeUntilNextFrame = 0;
    propellor->prevVariant = -1;
    propellor->animSpeed = 0x10;
    propellor->palId = 0;
    propellor->hitboxes[0].index = -1;
    propellor->unk10 = 0x2000;
    propellor->graphics.dest = (void *)(OBJ_VRAM0 + 0x2980);
    propellor->graphics.anim = SA2_ANIM_PROPELLOR;
    propellor->variant = 0;
    UpdateSpriteAnimation(&init->propellor);

    return t;
}

static void Task_80808DC(void)
{
    Sprite_OnInit_SkyCanyon *init = TASK_DATA(gCurTask);
    if (init->unk60) {
        UpdateSpriteAnimation(&init->spring);
    }
    init->unk60 = 0;

    if (init->unk62 != 0) {
        UpdateSpriteAnimation(&init->propellor);
    }
    init->unk62 = 0;
}