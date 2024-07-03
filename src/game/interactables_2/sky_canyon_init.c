#include "global.h"
#include "sprite.h"
#include "task.h"

#include "game/interactables_2/sky_canyon_init.h"

#include "constants/animations.h"

static void Task_80808DC(void);

/* sub_80807CC is pointed to by 'gSpriteTileInits_PreStageEntry' inside collision.s
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
    SPRITE_INIT_WITHOUT_ANIM_OR_VRAM(spring, 18, 2, 0);
    spring->graphics.dest = (void *)(OBJ_VRAM0 + 0x3040);
    spring->graphics.anim = SA2_ANIM_SPRING_FLYING;
    spring->variant = 0;
    UpdateSpriteAnimation(&init->spring);

    propellor = &init->propellor;
    SPRITE_INIT_WITHOUT_ANIM_OR_VRAM(propellor, 18, 2, 0);
    propellor->graphics.dest = (void *)(OBJ_VRAM0 + 0x2980);
    propellor->graphics.anim = SA2_ANIM_PROPELLER;
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