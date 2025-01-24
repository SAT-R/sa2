#include "global.h"
#include "core.h"
#include "malloc_vram.h"
#include "sprite.h"
#include "task.h"
#include "game/entity.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "lib/m4a/m4a.h"
#include "game/sa1_sa2_shared/collision.h"
#include "game/sa1_sa2_shared/entities_manager.h"

#include "constants/animations.h"
#include "constants/char_states.h"
#include "constants/player_transitions.h"
#include "constants/songs.h"

typedef struct {
    /* 0x0 */ SpriteBase base;
    /* 0xA */ Sprite s;
    /* 0x3C */ u8 unk3C;
    /* 0x3D */ u8 unk3D;
    /* 0x3E */ s16 unk3E;
    /* 0x40 */ s16 unk40;
} BouncyBar;

void Task_BouncyBarIdle(void);
void Task_BouncyBarLaunch(void);

const u16 gUnknown_080D94E8[] = { 9, 9, 9 };

const s8 gUnknown_080D94EE[] = { -16, -18, -20 };

const s16 gUnknown_080D94F2[] = { -384, -384, -384 };

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

    bar->unk3C = 0;
    bar->unk3D = 0;
    bar->unk3E = 0;
    bar->unk40 = 0;

    s->x = TO_WORLD_POS(me->x, spriteRegionX);
    s->y = TO_WORLD_POS(me->y, spriteRegionY);
    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = VramMalloc(0x18);
    s->graphics.anim = SA2_ANIM_BOUNCY_BAR;
    s->variant = 0;

    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0x2000;

    if (me->d.sData[0] != 0) {
        SPRITE_FLAG_SET(s, X_FLIP);
    }
}

void Task_BouncyBarIdle(void)
{
    BouncyBar *bar = TASK_DATA(gCurTask);
    Sprite *s = &bar->s;
    MapEntity *me = bar->base.me;

    s32 screenX, screenY;

    screenX = TO_WORLD_POS(bar->base.spriteX, bar->base.regionX);
    screenY = TO_WORLD_POS(me->y, bar->base.regionY);
    s->x = screenX - gCamera.x;
    s->y = screenY - gCamera.y;

    if (!(gPlayer.moveState & MOVESTATE_DEAD) && (sub_800C204(s, screenX, screenY, 0, &gPlayer, 0) == 1) && (gPlayer.qSpeedAirY > 0)
        && (I(gPlayer.qWorldY) + 4) < screenY) {
        gPlayer.charState = CHARSTATE_CURLED_IN_AIR;
        gPlayer.transition = PLTRANS_UNCURL;

        bar->unk3C = gPlayer.qSpeedAirY >> 0xA;
        if (bar->unk3C > 2) {
            bar->unk3C = 2;
        }

        bar->unk3D = (bar->unk3C * 5) + 10;
        bar->unk3E = gUnknown_080D94E8[bar->unk3C];

        bar->unk40 = screenX - I(gPlayer.qWorldX) >= 0 ? screenX - I(gPlayer.qWorldX) : I(gPlayer.qWorldX) - screenX;

        gCurTask->main = Task_BouncyBarLaunch;
        gPlayer.moveState |= MOVESTATE_IA_OVERRIDE;

        bar->unk3C = 2 - bar->unk3C;
        s->graphics.anim = 538;
        s->variant = bar->unk3C + 1;
        s->prevVariant = -1;
        bar->unk3C = 2 - bar->unk3C;
        m4aSongNumStart(SE_279);
    } else if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        me->x = bar->base.spriteX;
        TaskDestroy(gCurTask);
        return;
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

void Task_BouncyBarLaunch(void)
{
    BouncyBar *bar = TASK_DATA(gCurTask);
    Sprite *s = &bar->s;
    MapEntity *me = bar->base.me;

    s32 screenX, screenY;

    screenX = TO_WORLD_POS(bar->base.spriteX, bar->base.regionX);
    screenY = TO_WORLD_POS(me->y, bar->base.regionY);
    s->x = screenX - gCamera.x;
    s->y = screenY - gCamera.y;

    if (bar->unk3D != 0) {
        s8 temp;
        bar->unk3D--;
        gPlayer.qWorldY += bar->unk40 * bar->unk3E;
        gPlayer.qSpeedAirY = 0;

        if (bar->unk3D == 0) {
            temp = (bar->unk40 >> 1) + (bar->unk40 >> 2);

            if (temp > 0x18) {
                temp = 0x18;
            }

            gPlayer.qSpeedAirY = gUnknown_080D94F2[bar->unk3C];
            gPlayer.qSpeedAirY += ((temp * bar->unk3E) * gUnknown_080D94EE[bar->unk3C]) >> 1;
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
