#include "global.h"
#include "malloc_vram.h"
#include "task.h"
#include "trig.h"
#include "lib/m4a.h"
#include "sakit/camera.h"
#include "sakit/collision.h"
#include "sakit/player.h"
#include "game/game.h" // sub_801E4E4
#include "game/bosses/common.h"
#include "game/screen_shake.h"

#include "constants/animations.h"
#include "constants/songs.h"

typedef struct {
    /* 0x000 */ s32 unk0;
    /* 0x004 */ s32 worldX;
    /* 0x008 */ s32 worldY;
    /* 0x00C */ u8 fillerC[0x4];
    /* 0x010 */ s16 timerUnk;
    /* 0x012 */ s16 timerBombDrop;
    /* 0x014 */ bool8 unk14;
    /* 0x015 */ u8 unk15;
    /* 0x016 */ u8 unk16;
    /* 0x017 */ u8 unk17;
    /* 0x018 */ u8 filler18[0x70];
    /* 0x088 */ Sprite spr88;
    /* 0x0B8 */ u8 fillerB8[0x8];
    /* 0x0C0 */ Sprite sprC0;
    /* 0x0F0 */ Sprite sprF0;
    /* 0x120 */ Sprite spr120;
    /* 0x150 */ void *tilesBomb;
} AeroEgg; /* size: 0x154 */

typedef struct {
    /* 0x00 */ u32 tAlive;
    /* 0x04 */ s32 screenX;
    /* 0x08 */ s32 screenY;
    /* 0x0C */ s16 dx;
    /* 0x0E */ s16 dy;
    /* 0x10 */ AeroEgg *boss;
    /* 0x14 */ Sprite s;
} AeroEggBomb; /* size: 0x44 */

typedef AeroEggBomb AeroEggDebris; /* size: 0x44 */

static void Task_CreateAeroEggBombMain(void);
static void Task_DeleteAeroEggBombTask(void);
static void Task_AeroEggBombDebris(void);
static void Task_8042AB0(void);
static void CreateAeroEggBombDebris(AeroEgg *boss, s32 screenX, s32 screenY, s16 param3,
                                    u16 param4);

void TaskDestructor_AeroEggMain(struct Task *t)
{
    AeroEgg *boss = TASK_DATA(t);

    VramFree(boss->tilesBomb);
    VramFree(boss->spr88.graphics.dest);
    VramFree(boss->sprC0.graphics.dest);
    VramFree(boss->sprF0.graphics.dest);
    VramFree(boss->spr120.graphics.dest);

    gActiveBossTask = NULL;
}

void CreateAeroEggBomb(AeroEgg *boss, s32 spawnX, s32 spawnY)
{
    struct Task *t
        = TaskCreate(Task_CreateAeroEggBombMain, sizeof(AeroEggBomb), 0x6100, 0, NULL);
    AeroEggBomb *eb = TASK_DATA(t);
    Sprite *s;

    eb->screenX = spawnX - Q_24_8(gCamera.x);
    eb->screenY = spawnY - Q_24_8(gCamera.y);
    eb->dx = Q_24_8(5.00);
    eb->dy = Q_24_8(1.00);
    eb->tAlive = 0;
    eb->boss = boss;

    s = &eb->s;
    s->x = Q_24_8_TO_INT(boss->worldX) - gCamera.x;
    s->y = Q_24_8_TO_INT(eb->screenY);
    s->graphics.dest = boss->tilesBomb;
    SPRITE_INIT_WITHOUT_VRAM(s, SA2_ANIM_AERO_EGG_BOMB, 0, 21, 2, 0);
    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

static void Task_CreateAeroEggBombMain(void)
{
    AeroEggBomb *eb = TASK_DATA(gCurTask);
    Sprite *s = &eb->s;

    eb->tAlive++;

    if (eb->tAlive < 16) {
        eb->screenY += Q_24_8(1.0);
        s->x = Q_24_8_TO_INT(eb->boss->worldX) - gCamera.x;
        s->y = Q_24_8_TO_INT(eb->screenY);

        if (eb->tAlive == 16 - 1) {
            m4aSongNumStart(SE_PROJECTILE_DROP);
            eb->screenX = eb->boss->worldX - Q_24_8(gCamera.x);
        }
    } else {
        eb->dy += Q_24_8(0.0625);

        if (!PLAYER_IS_ALIVE) {
            eb->screenX += eb->dx;
            eb->screenY += eb->dy;
        } else {
            eb->screenX += eb->dx + Q_24_8(gCamera.unk38);
            eb->screenY += eb->dy + Q_24_8(gCamera.unk3C);
        }

        s->x = Q_24_8_TO_INT(eb->screenX);
        s->y = Q_24_8_TO_INT(eb->screenY);
    }

    if (sub_801E4E4(Q_24_8_TO_INT(eb->screenY) + gCamera.y,
                    Q_24_8_TO_INT(eb->screenX) + gCamera.x, 1, 8, NULL, sub_801EE64)
        < 0) {
        m4aSongNumStart(SE_PROJECTILE_IMPACT);

        eb->dx = 0;
        s->graphics.anim = SA2_ANIM_AERO_EGG_FIRE;
        s->variant = 0;

        CreateScreenShake(0x800, 0x10, 0x80, 0x14, SCREENSHAKE_VERTICAL | 0x3);

        CreateAeroEggBombDebris(eb->boss, eb->screenX, eb->screenY, 0x600, 738);
        CreateAeroEggBombDebris(eb->boss, eb->screenX, eb->screenY, 0x600, 798);
        CreateAeroEggBombDebris(eb->boss, eb->screenX, eb->screenY, 0x580, 708);
        CreateAeroEggBombDebris(eb->boss, eb->screenX, eb->screenY, 0x580, 828);
        gCurTask->main = Task_8042AB0;
    }

    if (eb->boss->unk14) {
        if (sub_800CA20(s, Q_24_8_TO_INT(eb->screenX) + gCamera.x,
                        Q_24_8_TO_INT(eb->screenY) + gCamera.y, 0, &gPlayer)
            == TRUE) {
            if (eb->boss->unk16 == 0) {
                Sprite *s2 = &eb->boss->sprC0;
                eb->boss->unk15 = 30;
                s2->graphics.anim = SA2_ANIM_HAMMERTANK_PILOT;
                s2->variant = 1;
                s2->prevVariant = -1;
            }
        }
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

static void Task_8042AB0(void)
{
    AeroEggBomb *eb = TASK_DATA(gCurTask);
    Sprite *s = &eb->s;

    if (!PLAYER_IS_ALIVE) {
        eb->screenX += eb->dx;
    } else {
        eb->screenX += eb->dx + Q_24_8(gCamera.unk38);
        eb->screenY += Q_24_8(gCamera.unk3C);
    }
    // _08042B04

    s->x = Q_24_8_TO_INT(eb->screenX);
    s->y = Q_24_8_TO_INT(eb->screenY);

    if (eb->boss->unk14) {
        if (sub_800CA20(s, Q_24_8_TO_INT(eb->screenX) + gCamera.x,
                        Q_24_8_TO_INT(eb->screenY) + gCamera.y, 0, &gPlayer)
            == TRUE) {
            if (eb->boss->unk16 == 0) {
                Sprite *s2 = &eb->boss->sprC0;
                eb->boss->unk15 = 30;
                s2->graphics.anim = SA2_ANIM_HAMMERTANK_PILOT;
                s2->variant = 1;
                s2->prevVariant = -1;
            }
        }
    }
    // _08042B5A

    if (UpdateSpriteAnimation(s) == 0) {
        gCurTask->main = Task_DeleteAeroEggBombTask;
    }

    DisplaySprite(s);
}

static void CreateAeroEggBombDebris(AeroEgg *boss, s32 screenX, s32 screenY, s16 param3,
                                    u16 param4)
{
    struct Task *t
        = TaskCreate(Task_AeroEggBombDebris, sizeof(AeroEggDebris), 0x6100, 0, NULL);
    AeroEggDebris *deb = TASK_DATA(t);
    Sprite *s;
    s16 cos, sin;

    deb->screenX = screenX;
    deb->screenY = screenY;

    deb->dx = Q_2_14_TO_INT(COS(param4) * param3);
    deb->dy = Q_2_14_TO_INT(SIN(param4) * param3);
    deb->tAlive = 0;
    deb->boss = boss;

    s = &deb->s;
    s->x = Q_24_8_TO_INT(screenX);
    s->y = Q_24_8_TO_INT(deb->screenY);

    if (PseudoRandom32() % 2u) {
        s->graphics.dest = boss->tilesBomb + (32 * TILE_SIZE_4BPP);
        s->graphics.anim = SA2_ANIM_AERO_EGG_DEBRIS_BIG;
        s->variant = 0;
    } else {
        s->graphics.dest = boss->tilesBomb + (41 * TILE_SIZE_4BPP);
        s->graphics.anim = SA2_ANIM_AERO_EGG_DEBRIS_SMALL;
        s->variant = 0;
    }
    SPRITE_INIT_WITHOUT_ANIM_OR_VRAM(s, 20, 2, 0);

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

static void Task_AeroEggBombDebris(void)
{
    AeroEggDebris *deb = TASK_DATA(gCurTask);
    Sprite *s = &deb->s;

    deb->dy += Q_24_8(0.3125);

    if (!PLAYER_IS_ALIVE) {
        deb->screenX += deb->dx;
        deb->screenY += deb->dy;
    } else {
        deb->screenX += deb->dx + Q_24_8(gCamera.unk38);
        deb->screenY += deb->dy + Q_24_8(gCamera.unk3C);
    }

    s->x = Q_24_8_TO_INT(deb->screenX);
    s->y = Q_24_8_TO_INT(deb->screenY);

    if (sub_801E4E4(Q_24_8_TO_INT(deb->screenY) + gCamera.y,
                    Q_24_8_TO_INT(deb->screenX) + gCamera.x, 1, 8, NULL, sub_801EE64)
        < 0) {
        if (deb->dy > 0) {
            TaskDestroy(gCurTask);
            return;
        }
    }

    if (deb->boss->unk14) {
        if (sub_800CA20(s, Q_24_8_TO_INT(deb->screenX) + gCamera.x,
                        Q_24_8_TO_INT(deb->screenY) + gCamera.y, 0, &gPlayer)
            == TRUE) {
            if (deb->boss->unk16 == 0) {
                Sprite *s2 = &deb->boss->sprC0;
                deb->boss->unk15 = 30;
                s2->graphics.anim = SA2_ANIM_HAMMERTANK_PILOT;
                s2->variant = 1;
                s2->prevVariant = -1;
            }
        }
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

static void Task_DeleteAeroEggBombTask(void) { TaskDestroy(gCurTask); }