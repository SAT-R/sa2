#include "global.h"
#include "flags.h"
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
#include "game/player_callbacks_1.h" // Player_DisableInputAndBossTimer

#include "constants/animations.h"
#include "constants/songs.h"
#include "constants/zones.h"

#define NUM_TAIL_SEGMENTS 3

#define PAL_BOSS_4_DEFAULT 0
#define PAL_BOSS_4_HIT     1

static const u16 gUnknown_080D7F54[][16] = {
    [PAL_BOSS_4_DEFAULT] = INCBIN_U16("graphics/boss_4_a.gbapal"),
    [PAL_BOSS_4_HIT] = INCBIN_U16("graphics/boss_4_b.gbapal"),
};

typedef struct {
    /* 0x00 */ s32 x;
    /* 0x04 */ s32 y;
    /* 0x08 */ s32 dx;
    /* 0x0C */ s32 dy;
    /* 0x10 */ bool32 status;
} AeroEggPart; /* size: 0x14 */

typedef struct {
    /* 0x000 */ s32 unk0;
    /* 0x004 */ s32 worldX;
    /* 0x008 */ s32 worldY;
    /* 0x00C */ s16 dx;
    /* 0x00E */ s16 dy;
    /* 0x010 */ s16 timerUnk;
    /* 0x012 */ s16 timerBombDrop;
    /* 0x014 */ u8 lives;
    /* 0x015 */ u8 unk15;
    /* 0x016 */ u8 unk16;
    /* 0x017 */ u8 unk17;
} AeroEggMain;

typedef struct {
    /* Full  Sub   */
    /* 0x018 0x00  */ u32 unk00;
    /* 0x01C 0x04  */ AeroEggPart cockpit;
    /* 0x030 0x18  */ AeroEggPart tail[NUM_TAIL_SEGMENTS];
    /* 0x06C 0x54  */ AeroEggPart tailTip;
    /* 0x080 0x68  */ u8 unk68;
    /* 0x081 0x69  */ u8 unk69;
    /* 0x082 0x6A  */ u8 unk6A;
    /* 0x083 0x6B  */ u8 unk6B;
    /* 0x084 0x6C  */ u8 unk6C;
    /* 0x085 0x6D  */ u8 filler85[0x3];
    /* 0x088 0x70  */ Sprite spr70;
    /* 0x0B8 0xA0  */ u8 fillerB8[0x8];
    /* 0x0C0 0xA8  */ Sprite sprA8;
    /* 0x0F0 0xD8  */ Sprite sprD8;
    /* 0x120 0x108 */ Sprite spr108;
    /* 0x150 0x138 */ void *tilesBomb;
} AeroEggSub;

typedef struct {
    /* 0x00 */ AeroEggMain main;
    /* 0x18 */ AeroEggSub sub;
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
void Task_AeroEggExploding(void);
void Task_80426C4(void);
static void Task_8042AB0(void);
void sub_8041B44(AeroEgg *boss);
void sub_8041880(AeroEgg *boss);
void sub_8041A08(AeroEgg *boss);
void sub_8041BF8(AeroEgg *boss);
void sub_8042024(AeroEgg *boss);
void sub_80424EC(AeroEgg *boss);
void sub_8042560(AeroEgg *boss);
void AeroEgg_UpdatePos(AeroEgg *boss);
static void CreateAeroEggBombDebris(AeroEgg *boss, s32 screenX, s32 screenY, s16 param3,
                                    u16 param4);

#define AE_DEFEATED_COLL_COCKPIT(_sub, _part)                                           \
    {                                                                                   \
        if (_sub->unk6B != 0) {                                                         \
            if (--_sub->unk6B == 0) {                                                   \
                _part.dy = 0;                                                           \
                _part.status = 1;                                                       \
            }                                                                           \
                                                                                        \
            CreateScreenShake(0x400, 0x20, 0x80, 0x14, SCREENSHAKE_VERTICAL | 0x3);     \
        }                                                                               \
    }

#define AE_DEFEATED_COLL_PART(_part)                                                    \
    {                                                                                   \
        if (_part.dy > -48) {                                                           \
            _part.dy = 0;                                                               \
            _part.status = 1;                                                           \
        }                                                                               \
    }

#define AE_UPDATE_PART_DEFEATED(_sub, _part, _halfHeight, _dyNum, _dyDenom,             \
                                CODE_ON_COLL)                                           \
    if ((_sub->unk00 > 10) && (_part.status == 0)) {                                    \
        _part.dy += 0x10;                                                               \
    }                                                                                   \
    _part.x += _part.dx;                                                                \
    _part.y += _part.dy;                                                                \
                                                                                        \
    res = sub_801E4E4(Q_24_8_TO_INT(_part.y) + _halfHeight, Q_24_8_TO_INT(_part.x), 1,  \
                      8, NULL, &sub_801EE64);                                           \
                                                                                        \
    if ((res <= 0) && (_part.dy >= 0)) {                                                \
        _part.y += Q_24_8(res);                                                         \
        _part.dy = Div((_part.dy * (_dyNum)), (_dyDenom));                              \
                                                                                        \
        CODE_ON_COLL;                                                                   \
                                                                                        \
        _part.dx -= 8;                                                                  \
        if (_part.dx < 0) {                                                             \
            _part.dx = 0;                                                               \
        }                                                                               \
    } else if (_part.status != 0) {                                                     \
        _part.y += Q_24_8(res);                                                         \
    }

#if 01
// (93.60%) https://decomp.me/scratch/bgy7t
void sub_8042024(AeroEgg *boss)
{
    AeroEggSub *sub = &boss->sub;
    Sprite *s;

    boss->sub.unk00 = 0;

    boss->sub.unk68 = 0;
    boss->sub.unk69 = 0;
    boss->sub.unk6A = 0x30;
    boss->sub.unk6B = 0x3;
    boss->sub.unk6C = 0;

    s = &boss->sub.spr70;
    sub->cockpit.x = Q_24_8(s->x + gCamera.x);
    sub->cockpit.y = Q_24_8(s->y + gCamera.y);
    sub->cockpit.dx = Q_24_8(5.75);
    sub->cockpit.dy = Q_24_8(0.00);
    sub->cockpit.status = 0;

    s = &boss->sub.spr108;
    sub->tailTip.x = Q_24_8(s->x + gCamera.x);
    sub->tailTip.y = Q_24_8(s->y + gCamera.y);
    sub->tailTip.dx = Q_24_8(5.75);
    sub->tailTip.dy = Q_24_8(0.00);
    sub->tailTip.status = 0;

    {
        u8 i;
        for (i = 0; i < ARRAY_COUNT(sub->tail); i++) {
            s32 xVal, yVal;
            u16 period = SIN_24_8(((gStageTime * 12) + (i << 7)) & ONE_CYCLE) >> 3;
            s32 bossX, bossY;
            s32 sinV, cosV;

            bossX = Q_24_8_TO_INT(boss->main.worldX);
            period = (period + 500) & ONE_CYCLE;
            cosV = (COS(period) * 17);
            cosV *= (i + 1);
            cosV >>= 14;
            bossX += cosV;

            bossY = Q_24_8_TO_INT(boss->main.worldY);
            sinV = (SIN(period) * 17);
            sinV *= (i + 1);
            sinV >>= 14;
            sinV += 0x14;
            bossY += sinV;

            sub->tail[i].x = Q_24_8(bossX);
            sub->tail[i].y = Q_24_8(bossY);
            sub->tail[i].dx = Q_24_8(5.75);
            sub->tail[i].dy = 0;
            sub->tail[i].status = 0;
        }
    }
}

#endif

void AeroEgg_UpdatePartsAfterBossDefeated(AeroEgg *boss)
{
    AeroEggSub *sub = &boss->sub;
    s32 res;
    u8 i;

    sub->unk68 = 1;
    sub->unk00++;

    AE_UPDATE_PART_DEFEATED(sub, sub->cockpit, 13, -70, 100,
                            AE_DEFEATED_COLL_COCKPIT(sub, sub->cockpit));

    for (i = 0; i < ARRAY_COUNT(sub->tail); i++) {
        AE_UPDATE_PART_DEFEATED(sub, sub->tail[i], 7, -6, 10,
                                AE_DEFEATED_COLL_PART(sub->tail[i]));
    }

    AE_UPDATE_PART_DEFEATED(sub, sub->tailTip, 9, -6, 10,
                            AE_DEFEATED_COLL_PART(sub->tailTip));
}

bool32 sub_80423EC(AeroEgg *boss)
{
    Sprite *s = &boss->sub.sprA8;

    bool32 result = FALSE;

    if (boss->main.lives > 0) {
        boss->main.lives--;

        if (boss->main.lives & 0x1) {
            m4aSongNumStart(SE_143);
        } else {
            m4aSongNumStart(SE_235);
        }

        boss->main.unk16 = 30;

        if (boss->main.lives == 0) {
            s->graphics.anim = SA2_ANIM_AERO_EGG_PILOT;
            s->variant = 4;

            INCREMENT_SCORE(1000);
        } else {
            s->graphics.anim = SA2_ANIM_HAMMERTANK_PILOT;
            s->variant = 2;
        }
        s->prevVariant = -1;
    } else {
        result = TRUE;
    }

    if (gCurrentLevel != LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE)) {
        if (boss->main.lives == 4) {
            gUnknown_030054A8.unk1 = 0x11;
        }
    }

    return result;
}

void sub_80424EC(AeroEgg *boss)
{
    Sprite *s = &boss->sub.sprA8;

    if (boss->main.unk16 != 0) {
        boss->main.unk15 = 0;

        if (--boss->main.unk16 == 0) {
            if (boss->main.lives == 0) {
                s->graphics.anim = SA2_ANIM_AERO_EGG_PILOT;
                s->variant = 4;
            } else {
                s->graphics.anim = SA2_ANIM_HAMMERTANK_PILOT;
                s->variant = 0;
            }

            s->prevVariant = -1;
        }
    } else if (boss->main.unk15 != 0) {
        boss->main.unk15--;

        if (boss->main.unk15 == 0) {
            s->graphics.anim = SA2_ANIM_HAMMERTANK_PILOT;
            s->variant = 0;
            s->prevVariant = -1;
        }
    }
}

void sub_8042560(AeroEgg *boss)
{
    u8 i;

    if (boss->main.unk16 != 0) {
        for (i = 0; i < ARRAY_COUNT(gUnknown_080D7F54[PAL_BOSS_4_DEFAULT]); i++) {
            gObjPalette[128 + i] = gUnknown_080D7F54[((gStageTime & 0x2) >> 1)][i];
        }
    } else {
        for (i = 0; i < ARRAY_COUNT(gUnknown_080D7F54[PAL_BOSS_4_HIT]); i++) {
            gObjPalette[128 + i] = gUnknown_080D7F54[PAL_BOSS_4_HIT][i];
        }
    }

    gFlags |= FLAGS_UPDATE_SPRITE_PALETTES;
}

void AeroEggResetPos(s32 dx, s32 dy)
{
    AeroEgg *boss = TASK_DATA(gActiveBossTask);
    u8 i;
    AeroEggSub *sub = &boss->sub;

    boss->main.worldX += dx;
    boss->main.worldY += dy;
    sub->cockpit.x += dx;
    sub->cockpit.y += dy;

    for (i = 0; i < ARRAY_COUNT(sub->tail); i++) {
        sub->tail[i].x += dx;
        sub->tail[i].y += dy;
    }

    sub->tailTip.x += dx;
    sub->tailTip.y += dy;
}

void Task_AeroEggMain(void)
{
    AeroEgg *boss = TASK_DATA(gCurTask);

    boss->main.worldX += boss->main.dx;
    boss->main.worldX += Q_24_8(2.25);

    sub_80424EC(boss);
    sub_8041880(boss);
    sub_8042560(boss);

    boss->main.unk0--;
    if (boss->main.unk0 == 0) {
        boss->main.timerBombDrop = ZONE_TIME_TO_INT(0, 3);

        gCurTask->main = Task_80426C4;
    }
}

void Task_80426C4(void)
{
    AeroEgg *boss = TASK_DATA(gCurTask);

    AeroEgg_UpdatePos(boss);
    sub_8041B44(boss);
    sub_80424EC(boss);
    sub_8041BF8(boss);
    sub_8041880(boss);
    sub_8042560(boss);
    sub_8041A08(boss);

    if (boss->main.lives == 0) {
        Sprite *s = &boss->sub.spr70;
        s->graphics.anim = SA2_ANIM_AERO_EGG_COCKPIT;
        s->variant = 3;
        s->prevVariant = -1;

        Player_DisableInputAndBossTimer();
        sub_8042024(boss);

        gCurTask->main = Task_AeroEggExploding;
    }
}

void Task_DeleteAeroEggTask(void) { TaskDestroy(gCurTask); }

void AeroEgg_UpdatePos(AeroEgg *boss)
{
    boss->main.worldX += boss->main.dx;
    boss->main.worldY += boss->main.dy;
}

void sub_8042774(AeroEgg *boss)
{
    Sprite *s = &boss->sub.sprA8;
    boss->main.unk15 = 30;

    if (boss->main.unk16 == 0) {
        s->graphics.anim = SA2_ANIM_HAMMERTANK_PILOT;
        s->variant = 1;
        s->prevVariant = -1;
    }
}

void TaskDestructor_AeroEggMain(struct Task *t)
{
    AeroEgg *boss = TASK_DATA(t);

    VramFree(boss->sub.tilesBomb);
    VramFree(boss->sub.spr70.graphics.dest);
    VramFree(boss->sub.sprA8.graphics.dest);
    VramFree(boss->sub.sprD8.graphics.dest);
    VramFree(boss->sub.spr108.graphics.dest);

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
    s->x = Q_24_8_TO_INT(boss->main.worldX) - gCamera.x;
    s->y = Q_24_8_TO_INT(eb->screenY);
    s->graphics.dest = boss->sub.tilesBomb;
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
        s->x = Q_24_8_TO_INT(eb->boss->main.worldX) - gCamera.x;
        s->y = Q_24_8_TO_INT(eb->screenY);

        if (eb->tAlive == 16 - 1) {
            m4aSongNumStart(SE_PROJECTILE_DROP);
            eb->screenX = eb->boss->main.worldX - Q_24_8(gCamera.x);
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

    if (eb->boss->main.lives > 0) {
        if (sub_800CA20(s, Q_24_8_TO_INT(eb->screenX) + gCamera.x,
                        Q_24_8_TO_INT(eb->screenY) + gCamera.y, 0, &gPlayer)
            == TRUE) {
            if (eb->boss->main.unk16 == 0) {
                Sprite *s2 = &eb->boss->sub.sprA8;
                eb->boss->main.unk15 = 30;
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

    s->x = Q_24_8_TO_INT(eb->screenX);
    s->y = Q_24_8_TO_INT(eb->screenY);

    if (eb->boss->main.lives > 0) {
        if (sub_800CA20(s, Q_24_8_TO_INT(eb->screenX) + gCamera.x,
                        Q_24_8_TO_INT(eb->screenY) + gCamera.y, 0, &gPlayer)
            == TRUE) {
            if (eb->boss->main.unk16 == 0) {
                Sprite *s2 = &eb->boss->sub.sprA8;
                eb->boss->main.unk15 = 30;
                s2->graphics.anim = SA2_ANIM_HAMMERTANK_PILOT;
                s2->variant = 1;
                s2->prevVariant = -1;
            }
        }
    }

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
        s->graphics.dest = boss->sub.tilesBomb + (32 * TILE_SIZE_4BPP);
        s->graphics.anim = SA2_ANIM_AERO_EGG_DEBRIS_BIG;
        s->variant = 0;
    } else {
        s->graphics.dest = boss->sub.tilesBomb + (41 * TILE_SIZE_4BPP);
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

    if (deb->boss->main.lives > 0) {
        if (sub_800CA20(s, Q_24_8_TO_INT(deb->screenX) + gCamera.x,
                        Q_24_8_TO_INT(deb->screenY) + gCamera.y, 0, &gPlayer)
            == TRUE) {
            if (deb->boss->main.unk16 == 0) {
                Sprite *s2 = &deb->boss->sub.sprA8;
                deb->boss->main.unk15 = 30;
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