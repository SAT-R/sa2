#include "core.h"

#include "game/entity.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "game/sa1_sa2_shared/collision.h"
#include "game/sa1_sa2_shared/entities_manager.h"

#include "lib/m4a/m4a.h"

#include "constants/animations.h"
#include "constants/char_states.h"
#include "constants/player_transitions.h"
#include "constants/songs.h"

typedef struct {
    /* 0x0 */ SpriteBase base;
    /* 0xA */ Sprite s;
    /* 0x3C */ u8 landingSpeed;
    /* 0x3D */ u8 launchFrame;
    /* 0x3E */ s16 springStiffness;
    /* 0x40 */ s16 landingPosition;
} BouncyBar;

static void Task_BouncyBarIdle(void);
static void Task_BouncyBarLaunch(void);

static const u16 sSpringStiffness[] = { 9, 9, 9 };
static const s8 sLaunchBonusSpeed[] = { -16, -18, -20 };
static const s16 sBaseLaunchSpeed[] = { -Q(1.5), -Q(1.5), -Q(1.5) };

void CreateEntity_BouncyBar(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    Sprite *s;
    struct Task *t = TaskCreate(Task_BouncyBarIdle, sizeof(BouncyBar), 0x2010, 0, TaskDestructor_80095E8);
    BouncyBar *bar = TASK_DATA(t);

    s = &bar->s;

    bar->base.regionX = spriteRegionX;
    bar->base.regionY = spriteRegionY;
    bar->base.me = me;
    bar->base.spriteX = me->x;
    bar->base.id = spriteY;

    bar->landingSpeed = 0;
    bar->launchFrame = 0;
    bar->springStiffness = 0;
    bar->landingPosition = 0;

    s->x = TO_WORLD_POS(me->x, spriteRegionX);
    s->y = TO_WORLD_POS(me->y, spriteRegionY);
    SET_MAP_ENTITY_INITIALIZED(me);

    SPRITE_INIT(s, 24, SA2_ANIM_BOUNCY_BAR, 0, 18, 2);

    if (me->d.sData[0] != 0) {
        SPRITE_FLAG_SET(s, X_FLIP);
    }
}

static void Task_BouncyBarIdle(void)
{
    BouncyBar *bar = TASK_DATA(gCurTask);
    Sprite *s = &bar->s;
    MapEntity *me = bar->base.me;

    s32 screenX, screenY;

    screenX = TO_WORLD_POS(bar->base.spriteX, bar->base.regionX);
    screenY = TO_WORLD_POS(me->y, bar->base.regionY);
    s->x = screenX - gCamera.x;
    s->y = screenY - gCamera.y;

    if (!(gPlayer.moveState & MOVESTATE_DEAD) && (Player_HitboxCollision(s, screenX, screenY, 0, &gPlayer, 0) == 1)
        && (gPlayer.qSpeedAirY > 0) && (I(gPlayer.qWorldY) + 4) < screenY) {
        gPlayer.charState = CHARSTATE_CURLED_IN_AIR;
        gPlayer.transition = PLTRANS_UNCURL;

        bar->landingSpeed = I(gPlayer.qSpeedAirY) >> 2;
        if (bar->landingSpeed > 2) {
            bar->landingSpeed = 2;
        }

        bar->launchFrame = (bar->landingSpeed * 5) + 10;
        bar->springStiffness = sSpringStiffness[bar->landingSpeed];

        bar->landingPosition = ABS(screenX - I(gPlayer.qWorldX));

        gCurTask->main = Task_BouncyBarLaunch;
        gPlayer.moveState |= MOVESTATE_IA_OVERRIDE;

        bar->landingSpeed = 2 - bar->landingSpeed;
        s->graphics.anim = SA2_ANIM_BOUNCY_BAR;
        s->variant = bar->landingSpeed + 1;
        s->prevVariant = -1;
        bar->landingSpeed = 2 - bar->landingSpeed;
        m4aSongNumStart(SE_279);
    } else if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        me->x = bar->base.spriteX;
        TaskDestroy(gCurTask);
        return;
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

static void Task_BouncyBarLaunch(void)
{
    BouncyBar *bar = TASK_DATA(gCurTask);
    Sprite *s = &bar->s;
    MapEntity *me = bar->base.me;

    s32 screenX, screenY;

    screenX = TO_WORLD_POS(bar->base.spriteX, bar->base.regionX);
    screenY = TO_WORLD_POS(me->y, bar->base.regionY);
    s->x = screenX - gCamera.x;
    s->y = screenY - gCamera.y;

    if (bar->launchFrame != 0) {
        bar->launchFrame--;
        gPlayer.qWorldY += bar->landingPosition * bar->springStiffness;
        gPlayer.qSpeedAirY = 0;

        if (bar->launchFrame == 0) {
            s8 launchFactor = (bar->landingPosition >> 1) + (bar->landingPosition >> 2);

            if (launchFactor > 24) {
                launchFactor = 24;
            }

            gPlayer.qSpeedAirY = sBaseLaunchSpeed[bar->landingSpeed];
            gPlayer.qSpeedAirY += ((launchFactor * bar->springStiffness) * sLaunchBonusSpeed[bar->landingSpeed]) >> 1;
            gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;
            gPlayer.moveState &= ~MOVESTATE_100;
        }
    }

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        me->x = bar->base.spriteX;
        TaskDestroy(gCurTask);
        return;
    }

    if (UpdateSpriteAnimation(s) == 0) {
        s->graphics.anim = SA2_ANIM_BOUNCY_BAR;
        s->variant = 0;
        s->prevVariant = -1;
        gCurTask->main = Task_BouncyBarIdle;
    }
    DisplaySprite(s);
}
