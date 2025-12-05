#include "global.h"
#include "malloc_vram.h"
#include "game/entity.h"
#include "game/enemies/madillo.h"
#include "game/sa1_sa2_shared/entities_manager.h"

#include "game/stage/player.h"
#include "game/stage/camera.h"

#include "constants/animations.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ s32 spawnX;
    /* 0x40 */ s32 spawnY;
    /* 0x44 */ s32 offsetX;
    /* 0x48 */ s32 offsetY;
    /* 0x4C */ s32 unk4C;
    /* 0x50 */ bool8 clampParam;
    /* 0x51 */ u8 unk51;
} Sprite_Madillo; /* size: 0x54 */

static void Task_MadilloMain(void);
static void Task_8056230(void);
static void Task_80564BC(void);

void CreateEntity_Madillo(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(Task_MadilloMain, sizeof(Sprite_Madillo), 0x4040, 0, TaskDestructor_80095E8);
    Sprite_Madillo *madillo = TASK_DATA(t);
    Sprite *s = &madillo->s;
    madillo->base.regionX = spriteRegionX;
    madillo->base.regionY = spriteRegionY;
    madillo->base.me = me;
    madillo->base.meX = me->x;
    madillo->base.id = spriteY;

    if (me->d.sData[1] != 0) {
        madillo->clampParam = TRUE;
    } else {
        madillo->clampParam = FALSE;
    }

    ENEMY_SET_SPAWN_POS_GROUND(madillo, me);

    madillo->unk4C = -Q(1.5);
    madillo->unk51 = 120;

    s->x = TO_WORLD_POS(me->x, spriteRegionX);
    s->y = TO_WORLD_POS(me->y, spriteRegionY);
    SET_MAP_ENTITY_INITIALIZED(me);

    SPRITE_INIT(s, 16, SA2_ANIM_MADILLO, 0, 18, 2);
}

static void Task_MadilloMain(void)
{
    Sprite_Madillo *madillo = TASK_DATA(gCurTask);
    Sprite *s = &madillo->s;
    MapEntity *me = madillo->base.me;
    Vec2_32 pos;

    // TODO: Merge with ENEMY_CLAMP_TO_GROUND macro
    {
        s32 delta = ENEMY_CLAMP_TO_GROUND_INNER(madillo, madillo->clampParam, sub_801EC3C);
        if (delta < 0) {
            madillo->offsetY += Q(delta);
            delta = ENEMY_CLAMP_TO_GROUND_INNER(madillo, madillo->clampParam, sub_801EC3C);
        }

        if (delta > 0) {
            madillo->offsetY += Q(delta);
        }
    }

    // ENEMY_UPDATE_POSITION(madillo, s, pos.x, pos.y);
    pos.x = I(madillo->spawnX + madillo->offsetX);
    pos.y = I(madillo->spawnY + madillo->offsetY);
    s->x = pos.x - gCamera.x;
    s->y = pos.y - gCamera.y;

    ENEMY_DESTROY_IF_PLAYER_HIT_2(s, pos);
    ENEMY_DESTROY_IF_OFFSCREEN(madillo, me, s);

    if (Q(pos.y - 50) < gPlayer.qWorldY) {
        if (Q(pos.y + 50) > gPlayer.qWorldY) {
            if (((QS(pos.x)) > gPlayer.qWorldX) && (Q(pos.x - 120) < (gPlayer.qWorldX))) {
                if (I(madillo->offsetX) > me->d.sData[0] * TILE_WIDTH) {
                    gCurTask->main = Task_8056230;
                    s->graphics.anim = SA2_ANIM_MADILLO;
                    s->variant = 1;
                    s->prevVariant = -1;
                    SPRITE_FLAG_CLEAR(s, X_FLIP);
                }
            } else if (Q(pos.x + 120) > gPlayer.qWorldX) {
                if (I(madillo->offsetX) < (me->d.sData[0] + me->d.uData[2]) * TILE_WIDTH) {
                    gCurTask->main = Task_8056230;
                    s->graphics.anim = SA2_ANIM_MADILLO;
                    s->variant = 1;
                    s->prevVariant = -1;
                    SPRITE_FLAG_SET(s, X_FLIP);
                }
            }
        }
    }

    ENEMY_UPDATE_EX_RAW(s, (QS(pos.x)), QS(pos.y), {});
}
static void Task_8056230(void)
{
    Sprite_Madillo *madillo = TASK_DATA(gCurTask);
    Sprite *s = &madillo->s;
    Sprite *s2;

    MapEntity *me = madillo->base.me;
    Vec2_32 pos;
    Player *p;
    u8 sp0[4];

    if (s->frameFlags & SPRITE_FLAG_MASK_X_FLIP) {
        madillo->offsetX -= madillo->unk4C;
    } else {
        madillo->offsetX += madillo->unk4C;
    }

    ENEMY_CLAMP_TO_GROUND_RAW(madillo, madillo->clampParam, &sp0[0]);
    ENEMY_UPDATE_POSITION(madillo, s, pos.x, pos.y);

    p = &gPlayer;
    s2 = &p->spriteInfoBody->s;

    if ((s2->hitboxes[0].index != -1)) {
        if (HB_COLLISION(pos.x, pos.y, s->hitboxes[0], I(p->qWorldX), I(p->qWorldY), s2->hitboxes[0])) {
            if ((p->itemEffect & 0x2) == PLAYER_ITEM_EFFECT__NONE) {
                Coll_DamagePlayer(p);
            }
        }
    }

    ENEMY_DESTROY_IF_OFFSCREEN(madillo, me, s);

    if ((s->frameFlags & SPRITE_FLAG(X_FLIP, 1) && I(madillo->offsetX) > (me->d.sData[0] + me->d.uData[2]) * TILE_WIDTH)
        || (!(s->frameFlags & SPRITE_FLAG(X_FLIP, 1)) && I(madillo->offsetX) < me->d.sData[0] * TILE_WIDTH)) {
        gCurTask->main = Task_80564BC;
        s->graphics.anim = SA2_ANIM_MADILLO;
        s->variant = 0;
        s->prevVariant = -1;
        madillo->unk51 = 120;
    }

    ENEMY_UPDATE_EX_RAW(s, QS(pos.x), QS(pos.y), {});
}

static void Task_80564BC(void)
{
    Sprite_Madillo *madillo = TASK_DATA(gCurTask);
    Sprite *s = &madillo->s;

    MapEntity *me = madillo->base.me;
    Vec2_32 pos;
    u8 sp0[4];

    if (s->frameFlags & SPRITE_FLAG_MASK_X_FLIP) {
        madillo->offsetX -= madillo->unk4C;
    } else {
        madillo->offsetX += madillo->unk4C;
    }

    ENEMY_CLAMP_TO_GROUND_RAW(madillo, madillo->clampParam, &sp0[0]);

    madillo->unk4C = Div(madillo->unk4C * 90, 100);
    if ((u32)(madillo->unk4C + 0x1F) < 0x3F) {
        madillo->unk4C = 0;
    }

    ENEMY_UPDATE_POSITION(madillo, s, pos.x, pos.y);
    ENEMY_DESTROY_IF_PLAYER_HIT_2(s, pos);
    ENEMY_DESTROY_IF_OFFSCREEN(madillo, me, s);

    Player_UpdateHomingPosition(QS(pos.x), QS(pos.y));

    if (--madillo->unk51 == 0) {
        madillo->unk4C = -384;
        madillo->unk51 = 120;
        gCurTask->main = Task_MadilloMain;
        s->graphics.anim = SA2_ANIM_MADILLO;
        s->variant = 0;
        s->prevVariant = -1;
    }
    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}
