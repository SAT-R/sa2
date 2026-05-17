#include <math.h> // M_PI
#include "global.h"
#include "core.h"
#include "trig.h"
#include "malloc_vram.h"
#include "lib/m4a/m4a.h"
#include "game/shared/stage/entity.h"
#include "game/shared/stage/collision.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/anim_sizes.h"
#include "constants/sa1/songs.h"
#include "constants/sa1/vram_hardcoded.h"
#include "constants/sa1/zones.h"

/* TODO: Maybe inline this file into bosses_misc.c ? */

typedef struct {
    /* 0x00 */ Sprite s;
    /* 0x30 */ Sprite s2;
    /* 0x60 */ CamCoord worldX;
    /* 0x62 */ CamCoord worldY;
    /* 0x64 */ s16 offsetX;
    /* 0x66 */ s16 offsetY;
    /* 0x68 */ u16 stunDelay;
} PostBossEggMobile;

#ifdef BUG_FIX
#define EGGMOBILE_DESPAWN_X (DISPLAY_WIDTH + 120)
#else
// NOTE(Jace): I don't think they intended to use a double for this...
#define EGGMOBILE_DESPAWN_X (DISPLAY_WIDTH + 120.0)
#endif

void Task_EggMobileAscent(void);
void Task_EggMobileTurnAround(void);
void Task_EggMobileEscape(void);

void CreatePostBossEggMobile(CamCoord worldX, CamCoord worldY)
{
    struct Task *t;
    PostBossEggMobile *eggMobile;
    Sprite *s;

    t = TaskCreate(Task_EggMobileAscent, sizeof(PostBossEggMobile), 0x2000U, 0U, NULL);
    eggMobile = TASK_DATA(t);

    eggMobile->worldX = worldX;
    eggMobile->worldY = worldY;
    eggMobile->offsetX = 0;
    eggMobile->offsetY = 0;
    eggMobile->stunDelay = 0;

    s = &eggMobile->s;
    s->x = worldX;
    s->y = worldY;
    s->graphics.dest = VRAM_RESERVED_BOSS_EGGMOBILE;
    s->oamFlags = SPRITE_OAM_ORDER(21);
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_EGGMOBILE;
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0x2000;

    s = &eggMobile->s2;
    s->x = worldX;
    s->y = worldY;
    s->graphics.dest = VRAM_RESERVED_EGGMAN;
    s->oamFlags = SPRITE_OAM_ORDER(19);
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_EGGMAN;
    s->variant = 4;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0x2000;
}

void Task_EggMobileAscent()
{
    PostBossEggMobile *eggMobile = TASK_DATA(gCurTask);
    Sprite *s;
    Sprite *s2;

    s = &eggMobile->s;
    s2 = &eggMobile->s2;
    eggMobile->s.x = eggMobile->worldX - gCamera.x;
    eggMobile->s.y = (eggMobile->worldY + I(eggMobile->offsetY)) - gCamera.y;
    s2->x = eggMobile->s.x;
    s2->y = eggMobile->s.y;

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
    UpdateSpriteAnimation(s2);
    DisplaySprite(s2);

    if (eggMobile->stunDelay > TIME(0, 0.75)) {
        eggMobile->offsetY -= Q(1);

        if (eggMobile->offsetY <= -Q(80)) {
            gCurTask->main = Task_EggMobileTurnAround;

            eggMobile->s.graphics.anim = SA1_ANIM_EGGMOBILE;
            eggMobile->s.variant = 1;

            s2->graphics.anim = SA1_ANIM_EGGMAN;
            eggMobile->s2.variant = 9;

            // NOTE(Jace): I think this is the first time a value is used
            //             both as a Q-value and a regular integer.
            eggMobile->offsetY = I(eggMobile->offsetY);
        }
    } else {
        ++eggMobile->stunDelay;
    }
}

void Task_EggMobileTurnAround(void)
{
    PostBossEggMobile *eggMobile = TASK_DATA(gCurTask);
    Sprite *s;
    Sprite *s2;
    AnimCmdResult acmdRes;

    s = &eggMobile->s;
    s2 = &eggMobile->s2;
    eggMobile->s.x = eggMobile->worldX - gCamera.x;
    eggMobile->s.y = (eggMobile->worldY + eggMobile->offsetY) - gCamera.y;
    s2->x = eggMobile->s.x;
    s2->y = eggMobile->s.y;

    acmdRes = UpdateSpriteAnimation(s);
    DisplaySprite(s);
    UpdateSpriteAnimation(s2);
    DisplaySprite(s2);

    if (acmdRes == ACMD_RESULT__ENDED) {
        gCurTask->main = Task_EggMobileEscape;
        s->graphics.anim = SA1_ANIM_EGGMOBILE;
        s->variant = 0;
        s->frameFlags |= SPRITE_FLAG_MASK_X_FLIP;
        s2->frameFlags |= SPRITE_FLAG_MASK_X_FLIP;
        s2->graphics.anim = SA1_ANIM_EGGMAN;
        s2->variant = 0;

        if ((gCurrentLevel == 12) && (eggMobile->worldX >= Q(8))) {
            s2->variant = 8;
        }
    }
}

void Task_EggMobileEscape()
{
    s16 *temp_r1;
    s16 temp_r0;
    s16 temp_r3;
    s32 temp_ret;

    PostBossEggMobile *eggMobile = TASK_DATA(gCurTask);
    Sprite *s = &eggMobile->s;
    Sprite *s2 = &eggMobile->s2;

    eggMobile->offsetX += 4;
    eggMobile->s.x = (eggMobile->worldX + eggMobile->offsetX) - gCamera.x;
    eggMobile->s.y = (eggMobile->worldY + eggMobile->offsetY) - gCamera.y;
    s2->x = eggMobile->s.x;
    s2->y = eggMobile->s.y;

    if (s->x > EGGMOBILE_DESPAWN_X) {
        TaskDestroy(gCurTask);
        return;
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
    UpdateSpriteAnimation(s2);
    DisplaySprite(s2);
}
