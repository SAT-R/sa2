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
#include "game/interactables_2/techno_base/arrow_platform.h"

#include "constants/animations.h"
#include "constants/char_states.h"
#include "constants/player_transitions.h"
#include "constants/songs.h"

// Probably arrow screen

typedef struct {
    SpriteBase base;
    Sprite s1;
    Sprite s2;
    s32 x;
    s32 y;
    s32 unk74;
    s32 unk78;
    s32 unk7C;
    s32 unk80;
    s16 width;
    s16 height;
    s16 offsetX;
    s16 offsetY;
    s32 unk8C;
    s32 unk90;
    u16 unk94;
    u16 unk96;
    s32 unk98[3][2];
} Sprite_IA75; /* 0xB0 */

#define BORDER_VRAM_ADDR (OBJ_VRAM0 + 0x2C80)

static void sub_807AB04(struct Task *);
static void sub_807AA68(void);
static void sub_807AB54(Sprite_IA75 *ia75);
static void sub_807AB6C(Sprite_IA75 *);
static void sub_807AB18(Sprite_IA75 *);
static void sub_807A73C(Sprite_IA75 *);
static void sub_807A7F4(Sprite_IA75 *);
static void sub_807AABC(void);

static void sub_807A33C(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY, u8 param)
{
    s32 i;
    Sprite *s;
    struct Task *t = TaskCreate(sub_807AA68, sizeof(Sprite_IA75), 0x2010, 0, sub_807AB04);
    Sprite_IA75 *ia75 = TASK_DATA(t);
    ia75->unk94 = param;
    ia75->unk8C = 0;
    ia75->unk90 = 0;
    ia75->width = me->d.sData[0] * TILE_WIDTH + 0x18;
    ia75->height = me->d.sData[1] * TILE_WIDTH + 0x18;
    ia75->offsetX = me->d.uData[2] * TILE_WIDTH + ia75->width - 0x18;
    ia75->offsetY = me->d.uData[3] * TILE_WIDTH + ia75->height - 0x18;

    ia75->base.me = me;
    ia75->base.regionX = spriteRegionX;
    ia75->base.regionY = spriteRegionY;
    ia75->base.meX = me->x;
    ia75->base.id = spriteY;

    switch (ia75->unk94) {
        case 0:
            ia75->unk74 = Q(ia75->offsetX);
            ia75->unk78 = Q(ia75->height);
            break;
        case 1:
            ia75->unk74 = Q(ia75->width);
            ia75->unk78 = Q(ia75->height);
            break;
        case 2:
            ia75->unk74 = Q(ia75->width);
            ia75->unk78 = Q(ia75->offsetY);
            break;
    }

    for (i = 0; i < 3; i++) {
        ia75->unk98[i][0] = ia75->unk74;
        ia75->unk98[i][1] = ia75->unk78;
    }

    ia75->x = TO_WORLD_POS(me->x, spriteRegionX);
    ia75->y = TO_WORLD_POS(me->y, spriteRegionY);

    s = &ia75->s1;
    s->oamFlags = SPRITE_OAM_ORDER(19);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
    s->graphics.dest = VramMalloc(8);
    s->graphics.anim = SA2_ANIM_ARROW_SCREEN;
    s->variant = 2;
    UpdateSpriteAnimation(s);

    s = &ia75->s2;
    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
    s->graphics.dest = (void *)BORDER_VRAM_ADDR;
    s->graphics.anim = SA2_ANIM_ARROW_SCREEN_BORDER;
    s->variant = 0;
    UpdateSpriteAnimation(s);

    SET_MAP_ENTITY_INITIALIZED(me);
}

static void sub_807A560(void)
{
    u8 someBool = FALSE;
    Sprite_IA75 *ia75 = TASK_DATA(gCurTask);
    gPlayer.transition = PLTRANS_TOUCH_GROUND;
    gPlayer.charState = CHARSTATE_IDLE;

    if (IS_MULTI_PLAYER) {
        sub_807AB6C(ia75);
    }

    switch (ia75->unk94) {
        case 0:
            ia75->unk74 -= Q_8_8(7.5);
            if (I(ia75->unk74) <= ia75->width) {
                ia75->unk74 = Q(ia75->width);
                someBool = TRUE;
            }
            break;
        case 1:
            ia75->unk74 += Q_8_8(7.5);
            if (I(ia75->unk74) >= ia75->offsetX) {
                ia75->unk74 = Q(ia75->offsetX);
                someBool = TRUE;
            }
            break;
        case 2:
            ia75->unk78 -= Q_8_8(7.5);
            if (I(ia75->unk78) <= ia75->height) {
                ia75->unk78 = Q(ia75->height);
                someBool = TRUE;
            }

            break;
    }

    if (gPlayer.timerInvulnerability == 120 && ia75->unk90) {
        gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;
        ia75->unk90 = 0;
    }

    if (PLAYER_IS_ALIVE && ia75->unk90) {
        sub_807AB18(ia75);
    }

    if (someBool) {
        sub_807A73C(ia75);
    }

    UpdateSpriteAnimation(&ia75->s1);
    sub_807A7F4(ia75);
}

static void sub_807A688(Sprite_IA75 *ia75)
{
    Sprite *s;
    ia75->unk7C = gPlayer.qWorldX - (Q(ia75->x) + ia75->unk74);
    ia75->unk80 = gPlayer.qWorldY - (Q(ia75->y) + ia75->unk78);

    gPlayer.transition = PLTRANS_TOUCH_GROUND;
    gPlayer.charState = CHARSTATE_IDLE;
    gPlayer.qSpeedAirX = 0;
    gPlayer.qSpeedAirY = 0;
    gPlayer.qSpeedGround = 0;
    gPlayer.rotation = 0;
    ia75->unk90 = 1;

    s = &ia75->s1;

    switch (ia75->unk94) {
        case 0:
            s->graphics.anim = SA2_ANIM_ARROW_SCREEN;
            s->variant = 0;
            break;
        case 1:
            s->graphics.anim = SA2_ANIM_ARROW_SCREEN;
            s->variant = 0;
            break;
        case 2:
            s->graphics.anim = SA2_ANIM_ARROW_SCREEN;
            s->variant = 1;
            break;
    }
    ia75->unk8C = 1;
    m4aSongNumStart(SE_296);
    gCurTask->main = sub_807A560;
}

static void sub_807A73C(Sprite_IA75 *ia75)
{
    Sprite *s = &ia75->s1;
    s->graphics.anim = SA2_ANIM_ARROW_SCREEN;
    s->variant = 2;
    UpdateSpriteAnimation(s);

    if (PLAYER_IS_ALIVE && ia75->unk90) {
        gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;
        ia75->unk90 = 0;
        switch (ia75->unk94) {
            case 0:
                gPlayer.qSpeedGround = -Q_8_8(7.5);
                gPlayer.moveState |= 1;
                gPlayer.transition = PLTRANS_TOUCH_GROUND;
                break;
            case 1:
                gPlayer.qSpeedGround = Q_8_8(7.5);
                gPlayer.moveState &= ~MOVESTATE_FACING_LEFT;
                gPlayer.transition = PLTRANS_TOUCH_GROUND;
                break;
            case 2:
                gPlayer.transition = PLTRANS_SPRING_UP;
                gPlayer.unk6E = 0;
                break;
        }
    }

    ia75->unk8C = 0;
    m4aSongNumStop(SE_296);
    gCurTask->main = sub_807AABC;
}

static void sub_807A7F4(Sprite_IA75 *ia75)
{
    Sprite *s = &ia75->s1;
    if (IS_MULTI_PLAYER) {
        s->x = ia75->x + I(ia75->unk98[1][0]) - gCamera.x;
        s->y = ia75->y + I(ia75->unk98[1][1]) - gCamera.y;
    } else {
        s->x = ia75->x + I(ia75->unk74) - gCamera.x;
        s->y = ia75->y + I(ia75->unk78) - gCamera.y;
    }

    if (ia75->unk8C != 0) {
        switch (ia75->unk94) {
            case 0:
                s->frameFlags &= ~(0x800 | 0x400);
                DisplaySprite(&ia75->s1);
                s->frameFlags |= 0x800;
                DisplaySprite(&ia75->s1);
                break;
            case 1:
                s->frameFlags &= ~0x800;
                s->frameFlags |= SPRITE_FLAG_MASK_X_FLIP;
                DisplaySprite(&ia75->s1);
                s->frameFlags |= 0x800;
                DisplaySprite(&ia75->s1);
                break;
            case 2:
                s->frameFlags &= ~(0x800 | 0x400);
                DisplaySprite(&ia75->s1);
                s->frameFlags |= SPRITE_FLAG_MASK_X_FLIP;
                DisplaySprite(&ia75->s1);
                break;
        }
    } else {
        s->frameFlags &= ~(0x800 | 0x400);
        DisplaySprite(&ia75->s1);
        s->frameFlags |= 0x800;
        DisplaySprite(&ia75->s1);
    }

    ia75->s2.x = s->x;
    ia75->s2.y = s->y;
    DisplaySprite(&ia75->s2);
}

static bool32 sub_807A920(Sprite_IA75 *ia75)
{
    s16 x = ia75->x - gCamera.x;
    s16 y = ia75->y - gCamera.y;

    if ((x + ia75->offsetX + 24) < -128 || (x + ia75->width - 24) > (DISPLAY_WIDTH + 128) || (y + ia75->offsetY + 24) < -128
        || (y + ia75->height - 24) > (DISPLAY_HEIGHT + 128)) {
        return TRUE;
    }
    return FALSE;
}

static u32 sub_807A99C(Sprite_IA75 *ia75)
{
    if (PLAYER_IS_ALIVE) {
        u32 temp = Coll_Player_Platform(&ia75->s2, ia75->x + I(ia75->unk74), ia75->y + I(ia75->unk78), &gPlayer);
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
                return 3;
            }
            if (temp & 0x20000) {
                gPlayer.qWorldY += Q_8_8(temp);
                gPlayer.qSpeedAirY = 0;
                return 4;
            }
        }
    }

    return 0;
}

static void sub_807AA68(void)
{
    Sprite_IA75 *ia75 = TASK_DATA(gCurTask);

    if (IS_MULTI_PLAYER) {
        sub_807AB6C(ia75);
    }

    if (sub_807A99C(ia75) == 2) {
        sub_807A688(ia75);
    }

    if (sub_807A920(ia75) != 0) {
        sub_807AB54(ia75);
    } else {
        sub_807A7F4(ia75);
    }
}

static void sub_807AABC(void)
{
    Sprite_IA75 *ia75 = TASK_DATA(gCurTask);

    if (IS_MULTI_PLAYER) {
        sub_807AB6C(ia75);
    }

    sub_807A99C(ia75);

    if (sub_807A920(ia75) != 0) {
        sub_807AB54(ia75);
    } else {
        sub_807A7F4(ia75);
    }
}

static void sub_807AB04(struct Task *t)
{
    Sprite_IA75 *ia75 = TASK_DATA(t);
    VramFree(ia75->s1.graphics.dest);
}

static void sub_807AB18(Sprite_IA75 *ia75)
{
    gPlayer.moveState |= MOVESTATE_IA_OVERRIDE;
    gPlayer.qWorldX = ia75->unk7C + Q(ia75->x) + ia75->unk74;
    gPlayer.qWorldY = ia75->unk80 + Q(ia75->y) + ia75->unk78;
    sub_807A99C(ia75);
}

static void sub_807AB54(Sprite_IA75 *ia75)
{
    SET_MAP_ENTITY_NOT_INITIALIZED(ia75->base.me, ia75->base.meX);
    TaskDestroy(gCurTask);
}

static void sub_807AB6C(Sprite_IA75 *ia75)
{
    ia75->unk98[2][0] = ia75->unk98[1][0];
    ia75->unk98[2][1] = ia75->unk98[1][1];

    ia75->unk98[1][0] = ia75->unk98[0][0];
    ia75->unk98[1][1] = ia75->unk98[0][1];

    ia75->unk98[0][0] = ia75->unk74;
    ia75->unk98[0][1] = ia75->unk78;
}

void CreateEntity_ArrowPlatform_Left(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    sub_807A33C(me, spriteRegionX, spriteRegionY, spriteY, 0);
}

void CreateEntity_ArrowPlatform_Right(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    sub_807A33C(me, spriteRegionX, spriteRegionY, spriteY, 1);
}

void CreateEntity_ArrowPlatform_Up(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    sub_807A33C(me, spriteRegionX, spriteRegionY, spriteY, 2);
}
