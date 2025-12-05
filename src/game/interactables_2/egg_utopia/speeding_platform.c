#include "global.h"
#include "core.h"
#include "malloc_vram.h"
#include "task.h"
#include "trig.h"
#include "lib/m4a/m4a.h"

#include "game/sa1_sa2_shared/collision.h"
#include "game/entity.h"

#include "game/stage/player.h"
#include "game/stage/camera.h"

#include "game/interactables_2/egg_utopia/speeding_platform.h"

#include "constants/animations.h"
#include "constants/player_transitions.h"
#include "constants/songs.h"

typedef struct {
    SpriteBase base;
    Sprite s;
    s32 x;
    s32 y;
    s32 unk44;
    s32 unk48;

    bool32 unk4C;
    s16 unk50;
    s16 unk52;

    s32 unk54;
    s16 unk58;
    s16 unk5A;
    s16 unk5C;
    u8 unk5E;
    s32 unk60[3][2];
} Sprite_SpeedingPlatform; /* size 0x78 */

static void Task_Interactable097(void);
static void TaskDestructor_Interactable097(struct Task *);
static void sub_807FF04(Sprite_SpeedingPlatform *);
static void sub_807FB1C(Sprite_SpeedingPlatform *);
static bool32 ShouldDespawn(Sprite_SpeedingPlatform *);
static void sub_807FEEC(Sprite_SpeedingPlatform *);
static void RenderPlatform(Sprite_SpeedingPlatform *);
static bool32 sub_807FC9C(Sprite_SpeedingPlatform *);
static u32 sub_807FD0C(Sprite_SpeedingPlatform *platform);
static void sub_807FE34(Sprite_SpeedingPlatform *);
static void sub_807FF20(void);
static void sub_807FF88(Sprite_SpeedingPlatform *);
static void sub_807FFB0(void);

void CreateEntity_SpeedingPlatform(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    u32 i;
    struct Task *t = TaskCreate(Task_Interactable097, sizeof(Sprite_SpeedingPlatform), 0x2010, 0, TaskDestructor_Interactable097);
    Sprite_SpeedingPlatform *platform = TASK_DATA(t);
    Sprite *s;
    platform->unk54 = 0;
    platform->unk58 = 0;
    platform->unk5A = 0;
    platform->unk5C = 0;
    platform->unk5E = 32;

    platform->x = TO_WORLD_POS(me->x, spriteRegionX);
    platform->y = TO_WORLD_POS(me->y, spriteRegionY);

    platform->unk44 = Q(32);
    platform->unk48 = Q(18);

    platform->base.regionX = spriteRegionX;
    platform->base.regionY = spriteRegionY;
    platform->base.me = me;
    platform->base.meX = me->x;
    platform->base.id = spriteY;

    for (i = 0; i < 3; i++) {
        platform->unk60[i][0] = platform->unk44;
        platform->unk60[i][1] = platform->unk48;
    }

    s = &platform->s;
    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
    s->graphics.dest = VramMalloc(0x10);
    s->graphics.anim = SA2_ANIM_SPEEDING_PLATFORM;
    s->variant = 0;
    UpdateSpriteAnimation(s);
    SET_MAP_ENTITY_INITIALIZED(me);
}

static void sub_807F9F0(void)
{
    Sprite_SpeedingPlatform *platform = TASK_DATA(gCurTask);
    if (IS_MULTI_PLAYER) {
        sub_807FF04(platform);
    }

    sub_807FB1C(platform);
    if (platform->unk4C && platform->unk5A > -1) {
        s32 res = sub_801F100(platform->y + I(platform->unk48), platform->x + I(platform->unk44), 1, 8, sub_801EC3C);
        if (res < 0) {
            platform->unk4C = FALSE;
            gPlayer.transition = PLTRANS_INIT_JUMP;
            gPlayer.moveState &= ~8;
            gPlayer.stoodObj = 0;
        }
    }

    if (ShouldDespawn(platform)) {
        sub_807FEEC(platform);
    } else {
        RenderPlatform(platform);
    }
}

static void sub_807FA98(Sprite_SpeedingPlatform *platform)
{
    platform->unk44 = Q(814);
    platform->unk48 = Q(576);

    platform->unk5E = 224;
    platform->unk5C = Q(8);
    platform->unk58 = COS_24_8(platform->unk5E * 4) * 8;
    platform->unk5A = I(platform->unk5C * SIN_24_8(platform->unk5E * 4));
    platform->unk54 = 1;
    m4aSongNumStop(SE_288);
    gCurTask->main = sub_807F9F0;
}

static void sub_807FB1C(Sprite_SpeedingPlatform *platform)
{
    if (platform->unk54 == 0) {
        platform->unk5C = platform->unk5C > Q(15) ? Q(15) : platform->unk5C;
        platform->unk58 = I(platform->unk5C * COS_24_8(platform->unk5E * 4));
        platform->unk5A = I(platform->unk5C * SIN_24_8(platform->unk5E * 4));
    } else {
        platform->unk5A += Q(0.1640625);
        platform->unk5A = platform->unk5A > Q(8) ? Q(8) : platform->unk5A;
    }

    platform->unk44 += platform->unk58;
    platform->unk48 += platform->unk5A;

    if (PLAYER_IS_ALIVE && platform->unk4C) {
        gPlayer.qWorldX = platform->unk50 + (Q(platform->x) + platform->unk44);
        gPlayer.qWorldY = platform->unk52 + (Q(platform->y) + platform->unk48) - Q(gPlayer.spriteOffsetY);
        platform->unk50 += gPlayer.qSpeedAirX;
        platform->unk52 += gPlayer.qSpeedAirY;
    }

    platform->unk4C = sub_807FC9C(platform);
}

static void RenderPlatform(Sprite_SpeedingPlatform *platform)
{
    Sprite *s = &platform->s;
    if (IS_MULTI_PLAYER) {
        s->x = platform->x + I(platform->unk60[1][0]) - gCamera.x;
        s->y = platform->y + I(platform->unk60[1][1]) - gCamera.y;
    } else {
        s->x = platform->x + I(platform->unk44) - gCamera.x;
        s->y = platform->y + I(platform->unk48) - gCamera.y;
    }

    s->frameFlags |= SPRITE_FLAG_MASK_X_FLIP;
    DisplaySprite(s);
    s->frameFlags &= ~SPRITE_FLAG_MASK_X_FLIP;
    DisplaySprite(s);
}

static bool32 sub_807FC9C(Sprite_SpeedingPlatform *platform)
{
    if (!platform->unk4C) {
        return FALSE;
    }

    if (gPlayer.moveState & (MOVESTATE_1000000 | MOVESTATE_IA_OVERRIDE | MOVESTATE_IN_AIR | MOVESTATE_DEAD)) {
        gPlayer.moveState &= ~MOVESTATE_STOOD_ON_OBJ;
        gPlayer.stoodObj = NULL;
        return FALSE;
    }

    if (sub_807FD0C(platform) != 2) {
        s16 x = platform->x + I(platform->unk44) - gCamera.x - 27;
        s16 playerX = I(gPlayer.qWorldX) - gCamera.x;

        if (x <= playerX && (x + 54) >= playerX) {
            return TRUE;
        }
    } else {
        return TRUE;
    }

    return FALSE;
}

static u32 sub_807FD0C(Sprite_SpeedingPlatform *platform)
{
    if (PLAYER_IS_ALIVE) {
        u32 temp = Coll_Player_Platform(&platform->s, platform->x + I(platform->unk44), platform->y + I(platform->unk48), &gPlayer);

        if (temp != 0) {
            if (temp & 0x10000) {
                gPlayer.qWorldY += Q_8_8(temp);
                gPlayer.qSpeedAirY = 0;
                return 2;
            }

            if (temp & 0x40000) {
                gPlayer.qWorldX += (s16)(temp & 0xFF00);
                gPlayer.qSpeedAirX = 0;
                gPlayer.qSpeedGround = 0;
                gPlayer.moveState |= MOVESTATE_20;
                return 1;
            }

            if (temp & 0x80000) {
                gPlayer.qWorldX += (s16)(temp & 0xFF00);
                gPlayer.qSpeedAirX = 0;
                gPlayer.qSpeedGround = 0;
                gPlayer.moveState |= MOVESTATE_20;
                return 1;
            }

            if (temp & 0x20000) {
                gPlayer.qWorldY += Q_8_8(temp);
                gPlayer.qSpeedAirY = 0;
                return 1;
            }
        }
    }

    return 0;
}

static void Task_Interactable097(void)
{
    Sprite_SpeedingPlatform *platform = TASK_DATA(gCurTask);
    if (IS_MULTI_PLAYER) {
        sub_807FF04(platform);
    }

    if (sub_807FD0C(platform) == 2) {
        sub_807FE34(platform);
    }

    if (ShouldDespawn(platform)) {
        sub_807FEEC(platform);
    } else {
        RenderPlatform(platform);
    }
}

static void TaskDestructor_Interactable097(struct Task *t)
{
    Sprite_SpeedingPlatform *platform = TASK_DATA(t);
    VramFree(platform->s.graphics.dest);
}

static void sub_807FE34(Sprite_SpeedingPlatform *platform)
{
    platform->unk50 = gPlayer.qWorldX - (Q(platform->x) + platform->unk44);
    platform->unk52 = gPlayer.qWorldY - (Q(platform->y) + platform->unk48) + Q(gPlayer.spriteOffsetY);
    platform->unk4C = TRUE;
    m4aSongNumStart(SE_288);
    gCurTask->main = sub_807FF20;
}

static bool32 ShouldDespawn(Sprite_SpeedingPlatform *platform)
{
    s16 x = platform->x + I(platform->unk44) - gCamera.x;
    s16 y = platform->y + I(platform->unk48) - gCamera.y;

    if (x < -((CAM_REGION_WIDTH / 2) + 64) || x > (DISPLAY_WIDTH + ((CAM_REGION_WIDTH / 2) + 64)) || y + 32 < -(CAM_REGION_WIDTH / 2)
        || y - 32 > (DISPLAY_HEIGHT + (CAM_REGION_WIDTH / 2))) {
        return TRUE;
    }

    return FALSE;
}

static void sub_807FEEC(Sprite_SpeedingPlatform *platform)
{
    SET_MAP_ENTITY_NOT_INITIALIZED(platform->base.me, platform->base.meX);
    TaskDestroy(gCurTask);
}

static void sub_807FF04(Sprite_SpeedingPlatform *platform)
{
    platform->unk60[2][0] = platform->unk60[1][0];
    platform->unk60[2][1] = platform->unk60[1][1];

    platform->unk60[1][0] = platform->unk60[0][0];
    platform->unk60[1][1] = platform->unk60[0][1];

    platform->unk60[0][0] = platform->unk44;
    platform->unk60[0][1] = platform->unk48;
}

static void sub_807FF20(void)
{
    Sprite_SpeedingPlatform *platform = TASK_DATA(gCurTask);

    if (IS_MULTI_PLAYER) {
        sub_807FF04(platform);
    }

    platform->unk5C += Q(0.125);
    sub_807FB1C(platform);

    if (platform->unk44 >= Q(590)) {
        sub_807FF88(platform);
    }

    if (ShouldDespawn(platform)) {
        sub_807FEEC(platform);
    } else {
        RenderPlatform(platform);
    }
}

static void sub_807FF88(Sprite_SpeedingPlatform *platform)
{
    platform->unk44 = Q(590);
    platform->unk48 = Q(576);
    platform->unk5E = 0;
    gCurTask->main = sub_807FFB0;
}

static void sub_807FFB0(void)
{
    Sprite_SpeedingPlatform *platform = TASK_DATA(gCurTask);

    if (IS_MULTI_PLAYER) {
        sub_807FF04(platform);
    }

    sub_807FB1C(platform);

    if (platform->unk44 >= Q(814)) {
        sub_807FA98(platform);
    }

    if (ShouldDespawn(platform)) {
        sub_807FEEC(platform);
    } else {
        RenderPlatform(platform);
    }
}
