#include "global.h"
#include "sprite.h"
#include "task.h"

#include "game/sa2/stage/interactables/sky_canyon_level_task.h"

#include "constants/sa2/animations.h"

static void Task_UpdateAnimations(void);

Task *CreateLevelTask_SkyCanyon(void)
{
    Task *t = TaskCreate(Task_UpdateAnimations, sizeof(SkyCanyonLevelTask), 0x2001, 0, NULL);
    SkyCanyonLevelTask *init = TASK_DATA(t);
    Sprite *spring, *propellor;

    init->visibleFlyingSprings = 0;
    init->visiblePropellers = 0;

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

static void Task_UpdateAnimations(void)
{
    SkyCanyonLevelTask *init = TASK_DATA(gCurTask);

    if (init->visibleFlyingSprings != 0) {
        UpdateSpriteAnimation(&init->spring);
    }
    init->visibleFlyingSprings = 0;

    if (init->visiblePropellers != 0) {
        UpdateSpriteAnimation(&init->propellor);
    }
    init->visiblePropellers = 0;
}
