#include <stdlib.h> // abs

#include "global.h"
#include "core.h"
#include "malloc_vram.h"
#include "task.h"
#include "trig.h"
#include "lib/m4a/m4a.h"
#include "game/entity.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "game/interactables_2/ice_paradise/funnel_sphere.h"

#include "constants/animations.h"
#include "constants/char_states.h"
#include "constants/player_transitions.h"
#include "constants/songs.h"

typedef struct {
    s32 x; /* 0x0 */
    s32 y; /* 0x4 */
    s32 unk8; /* 0x8 */
    s32 unkC;
    u16 unk10;

    // prevPriority1
    u16 unk12;
    // prevPriority2
    u16 unk14;

    s32 keyFrame;
    u16 unk1C;
    MapEntity *me; /* 0x20 */
    s8 spriteX; /* 0x24 */
    s8 spriteY; /* 0x25 */
} Sprite_FunnelSphere;

static void sub_80784F4(Sprite_FunnelSphere *);
static void sub_80782FC(Sprite_FunnelSphere *);
static void sub_807844C(void);
static void sub_8029FF0(Sprite_FunnelSphere *);
static void sub_8078414(void);
static bool32 sub_807854C(Sprite_FunnelSphere *);
static void sub_8078594(Sprite_FunnelSphere *);
static void sub_80784B0(Sprite_FunnelSphere *);
static void sub_8077F7C(void);
static void sub_8078634(void);
static void sub_8078688(struct Task *);
static void sub_8078414(void);

#define MUL_4(val) ({ (val) * 4; })

static void sub_8077F7C(void)
{
    u8 r6;
    u16 r7;
    s32 r4;
    Sprite_FunnelSphere *funnelSphere = TASK_DATA(gCurTask);

    if (!PLAYER_IS_ALIVE) {
        sub_80782FC(funnelSphere);
        return;
    }

    funnelSphere->unk10 -= 0x40;
    r6 = (funnelSphere->unk10 >> 2);
    if (funnelSphere->keyFrame == 0 && (r6 < 0x40)) {
        gCamera.unk50 |= 1;
        funnelSphere->keyFrame = 1;
    }

#ifndef NON_MATCHING
    r6++;
    r6--;
#endif

    if (funnelSphere->unk1C == 1) {
        r7 = I(funnelSphere->unkC) - funnelSphere->y;

        r4 = (0x20 - r7) * 0x40;
        r4 = I(r4 * SIN_24_8(MUL_4(r6)));
        gPlayer.qWorldY = funnelSphere->unkC + r4;

        r4 = r7 * 2;
        r4 = I(COS_24_8(MUL_4(r6)) * 0x20 * COS_24_8(MUL_4(r4 & 0xFF)));
        gPlayer.qWorldX = funnelSphere->unk8 + r4;

        r4 = r6;
        if (r4 > 0x80) {
#ifndef NON_MATCHING
            register u32 r0 asm("r0") = 0x100;
            asm("" ::"r"(r0));
            r4 = r0 - r6;
#else
            u32 r0 = 0x100 - r6;
            r4 = r0;
#endif
        }

#ifndef NON_MATCHING
        r7++;
        r7--;
#endif

        gPlayer.rotation = I((0x40 - r4) * COS_24_8(MUL_4((r7 * 2) & 0xFF))) + 0x40;

        gPlayer.qSpeedAirX = COS_24_8(MUL_4(gPlayer.rotation));
        gPlayer.qSpeedAirY = SIN_24_8(MUL_4(gPlayer.rotation));
        funnelSphere->unkC += 0x40;
    } else {
        r7 = funnelSphere->y - I(funnelSphere->unkC);
        r4 = (0x20 - r7) * 0x40;
        r4 = I(-(r4 * SIN_24_8(MUL_4(r6))));
        gPlayer.qWorldY = funnelSphere->unkC + r4;

        r4 = r7 * 2;
        r4 = I(COS_24_8(MUL_4(r6)) * 0x20 * COS_24_8(MUL_4(r4 & 0xFF)));
        gPlayer.qWorldX = funnelSphere->unk8 + r4;

        r4 = r6;
        if (r4 < 0x80) {
            u32 r0 = (0x80 - r6) * 2;
            r4 += r0;
        }

#ifndef NON_MATCHING
        r7++;
        r7--;
#endif

        gPlayer.rotation = I((0xC0 - r4) * COS_24_8(MUL_4((r7 * 2) & 0xFF))) - 0x40;

        gPlayer.qSpeedAirX = COS_24_8(MUL_4(gPlayer.rotation));
        gPlayer.qSpeedAirY = SIN_24_8(MUL_4(gPlayer.rotation));
        funnelSphere->unkC -= 0x40;
    }
    if (r7 > 0x1F) {
        sub_80784F4(funnelSphere);
    }
};

static void sub_8078170(Sprite_FunnelSphere *funnelSphere)
{
    s32 character;
    Player_SetMovestate_IsInScriptedSequence();
    gPlayer.moveState |= MOVESTATE_IA_OVERRIDE;
    gPlayer.charState = CHARSTATE_SPIN_ATTACK;

    m4aSongNumStart(SE_SPIN_ATTACK);
    gPlayer.moveState &= ~MOVESTATE_FACING_LEFT;

    switch (gPlayer.character) {
        case CHARACTER_CREAM:
        case CHARACTER_TAILS:
            funnelSphere->unk14 = (gPlayer.spriteInfoLimbs->s.frameFlags & SPRITE_FLAG_MASK_PRIORITY) >> 12;
            gPlayer.spriteInfoLimbs->s.frameFlags &= ~SPRITE_FLAG_MASK_PRIORITY;
            gPlayer.spriteInfoLimbs->s.frameFlags |= SPRITE_FLAG(PRIORITY, 1);
        case CHARACTER_SONIC:
        case CHARACTER_KNUCKLES:
        case CHARACTER_AMY:
            funnelSphere->unk12 = (gPlayer.spriteInfoBody->s.frameFlags & SPRITE_FLAG_MASK_PRIORITY) >> 12;
            gPlayer.spriteInfoBody->s.frameFlags &= ~SPRITE_FLAG_MASK_PRIORITY;
            gPlayer.spriteInfoBody->s.frameFlags |= SPRITE_FLAG(PRIORITY, 1);
    }

    if (gPlayer.qSpeedAirX < Q_8_8(9)) {
        funnelSphere->unk1C = 1;
    } else {
        funnelSphere->unk1C = 0;
    }
    funnelSphere->keyFrame = 0;
    gCurTask->main = sub_807844C;
};

static void sub_8078254(Sprite_FunnelSphere *funnelSphere)
{
    Player_ClearMovestate_IsInScriptedSequence();
    gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;
    gPlayer.transition = PLTRANS_UNCURL;

    switch (gPlayer.character) {
        case CHARACTER_CREAM:
        case CHARACTER_TAILS:
            gPlayer.spriteInfoLimbs->s.frameFlags &= ~SPRITE_FLAG_MASK_PRIORITY;
            gPlayer.spriteInfoLimbs->s.frameFlags |= SPRITE_FLAG(PRIORITY, funnelSphere->unk14);
        case CHARACTER_SONIC:
        case CHARACTER_KNUCKLES:
        case CHARACTER_AMY:
            gPlayer.spriteInfoBody->s.frameFlags &= ~SPRITE_FLAG_MASK_PRIORITY;
            gPlayer.spriteInfoBody->s.frameFlags |= SPRITE_FLAG(PRIORITY, funnelSphere->unk12);
    }

    gCurTask->main = sub_8078414;
}

static void sub_80782FC(Sprite_FunnelSphere *funnelSphere)
{
    Player_ClearMovestate_IsInScriptedSequence();

    switch (gPlayer.character) {
        case CHARACTER_CREAM:
        case CHARACTER_TAILS:
            gPlayer.spriteInfoLimbs->s.frameFlags &= ~SPRITE_FLAG_MASK_PRIORITY;
            gPlayer.spriteInfoLimbs->s.frameFlags |= SPRITE_FLAG(PRIORITY, funnelSphere->unk14);
        case CHARACTER_SONIC:
        case CHARACTER_KNUCKLES:
        case CHARACTER_AMY:
            gPlayer.spriteInfoBody->s.frameFlags &= ~SPRITE_FLAG_MASK_PRIORITY;
            gPlayer.spriteInfoBody->s.frameFlags |= SPRITE_FLAG(PRIORITY, funnelSphere->unk12);
    }
    gCamera.unk50 &= ~1;
    gCurTask->main = sub_8078414;
}

static bool32 sub_80783A4(Sprite_FunnelSphere *funnelSphere)
{
    if (!PLAYER_IS_ALIVE) {
        return FALSE;
    } else if (gPlayer.moveState & MOVESTATE_IN_AIR) {
        return FALSE;
    } else {
        s16 x = funnelSphere->x - gCamera.x;
        s16 y = funnelSphere->y - gCamera.y;
        s16 playerX = (I(gPlayer.qWorldX) - gCamera.x);
        s16 playerY = (I(gPlayer.qWorldY) - gCamera.y);
        s16 dX = x - playerX;
        s16 dY = y - playerY;
        if (dX * dX + dY * dY <= (12 * 12)) {
            return TRUE;
        }
    }
    return FALSE;
}

static void sub_8078414(void)
{
    Sprite_FunnelSphere *funnelSphere = TASK_DATA(gCurTask);
    if (sub_80783A4(funnelSphere)) {
        sub_8078170(funnelSphere);
    }

    if (sub_807854C(funnelSphere)) {
        sub_8078594(funnelSphere);
    }
}

static void sub_807844C(void)
{
    Sprite_FunnelSphere *funnelSphere = TASK_DATA(gCurTask);
    if (!PLAYER_IS_ALIVE) {
        sub_80782FC(funnelSphere);
        return;
    }

    if (gPlayer.qSpeedAirX < 0x300) {
        gPlayer.qWorldX += 0x300;
    } else {
        gPlayer.qWorldX += gPlayer.qSpeedAirX;
    }

    if (I(gPlayer.qWorldX) >= funnelSphere->x + 0x20) {
        sub_80784B0(funnelSphere);
    }
}

static void sub_80784B0(Sprite_FunnelSphere *funnelSphere)
{
    gPlayer.qWorldX = Q(funnelSphere->x + 0x20);
    funnelSphere->unk10 = 0x200;
    funnelSphere->unk8 = Q(funnelSphere->x + 0x40);
    funnelSphere->unkC = Q(funnelSphere->y);
    m4aSongNumStart(SE_293);
    gCurTask->main = sub_8077F7C;
}

static void sub_80784F4(Sprite_FunnelSphere *funnelSphere)
{
    if (funnelSphere->unk1C == 1) {
        gPlayer.qSpeedAirY = 0x600;
    } else {
        gPlayer.qSpeedAirY = -0xA00;
    }

    gPlayer.qSpeedAirX = 0;
    gCamera.unk50 &= ~1;
    m4aSongNumStop(SE_293);
    gCurTask->main = sub_8078634;
}

static bool32 sub_807854C(Sprite_FunnelSphere *funnelSphere)
{
    s16 x = funnelSphere->x - gCamera.x;
    s16 y = funnelSphere->y - gCamera.y;

    if (x < -128 || x > (DISPLAY_WIDTH + 128) || y < -128 || y > (DISPLAY_HEIGHT + 128)) {
        return TRUE;
    }

    return FALSE;
}

static void sub_8078594(Sprite_FunnelSphere *funnelSphere)
{
    SET_MAP_ENTITY_NOT_INITIALIZED(funnelSphere->me, funnelSphere->spriteX);
    TaskDestroy(gCurTask);
}

void CreateEntity_FunnelSphere(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(sub_8078414, sizeof(Sprite_FunnelSphere), 0x2010, 0, sub_8078688);
    Sprite_FunnelSphere *funnelSphere = TASK_DATA(t);
    funnelSphere->me = me;
    funnelSphere->spriteX = me->x;
    funnelSphere->spriteY = spriteY;
    funnelSphere->x = TO_WORLD_POS(me->x, spriteRegionX);
    funnelSphere->y = TO_WORLD_POS(me->y, spriteRegionY);
    SET_MAP_ENTITY_INITIALIZED(me);
}

static void sub_8078634(void)
{
    s16 y;
    Sprite_FunnelSphere *funnelSphere = TASK_DATA(gCurTask);

    if (!PLAYER_IS_ALIVE) {
        sub_80782FC(funnelSphere);
        return;
    }

    gPlayer.qWorldY += gPlayer.qSpeedAirY;
    y = funnelSphere->y - I(gPlayer.qWorldY);

    if (abs(y) >= 72) {
        sub_8078254(funnelSphere);
    }
}

static void sub_8078688(UNUSED struct Task *t)
{
    // unused
}
