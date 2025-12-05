#include "global.h"
#include "malloc_vram.h"
#include "game/entity.h"
#include "game/sa1_sa2_shared/collision.h"
#include "game/sa1_sa2_shared/entities_manager.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "task.h"
#include "sprite.h"

#include "constants/animations.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ u8 filler3c[0x10];
    /* 0x4C */ Sprite s2;

    u8 filler7C[0x10];

    /* 0x8C */ s32 spawnX;
    /* 0x90 */ s32 spawnY;
    /* 0x94 */ s32 offsetX;
    /* 0x98 */ s32 offsetY;

    // Might be Vec2_16?
    /* 0x9C */ s16 unk9C;
    /* 0x9E */ s16 unk9E;

    u8 unkA0;

    /* 0xA4 */ Vec2_32 positions[64];
    /* 0x2A4 */ u8 unk2A4;
} Sprite_Flickey; /* size: 0x2A8 */

static void Task_FlickeyMain(void);
static void sub_80591FC(void);
static void sub_8058EDC(void);

static void Flickey_RenderIronBalls(Sprite_Flickey *flickey);
static void TaskDestructor_Flickey(struct Task *);

void CreateEntity_Flickey(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    u8 i;
    s32 x, y;

    if (DIFFICULTY_LEVEL_IS_NOT_EASY) {
        struct Task *t = TaskCreate(Task_FlickeyMain, sizeof(Sprite_Flickey), 0x4040, 0, TaskDestructor_Flickey);
        Sprite_Flickey *flickey = TASK_DATA(t);
        Sprite *s = &flickey->s;
        flickey->base.regionX = spriteRegionX;
        flickey->base.regionY = spriteRegionY;
        flickey->base.me = me;
        flickey->base.meX = me->x;
        flickey->base.id = spriteY;

        ENEMY_SET_SPAWN_POS_FLYING(flickey, me);

        flickey->unk9C = -Q(1.5);
        flickey->unk9E = -Q(4.0);
        flickey->unk2A4 = 0;

        x = Q(flickey->spawnX);
        y = Q(flickey->spawnY);

        for (i = 0; i < ARRAY_COUNT(flickey->positions); i++) {
            flickey->positions[i].x = I(x >> 8);
            flickey->positions[i].y = I(y >> 8);
        }

        s->x = 0;
        s->y = 0;
        SET_MAP_ENTITY_INITIALIZED(me);

        SPRITE_INIT(s, 20, SA2_ANIM_FLICKEY, 1, 18, 2);

        s = &flickey->s2;
        s->x = TO_WORLD_POS(me->x, spriteRegionX);
        s->y = TO_WORLD_POS(me->y, spriteRegionY);
        SPRITE_INIT(s, 8, SA2_ANIM_FLICKEY_PROJ, 0, 19, 2);
    }
}

static void Task_FlickeyMain(void)
{
    u8 i;
    Sprite_Flickey *flickey = TASK_DATA(gCurTask);
    Sprite *s = &flickey->s;
    MapEntity *me = flickey->base.me;
    s32 positions[3][3];
    Vec2_32 pos;
    s32 someVal;
    u8 index;

    flickey->unk9E += 0x20;
    flickey->offsetX += flickey->unk9C;
    flickey->offsetY += flickey->unk9E;

    pos.x = I(flickey->spawnX + flickey->offsetX);
    pos.y = I(flickey->spawnY + flickey->offsetY);
    someVal = sub_801F07C(pos.y, pos.x, 1, 8, 0, sub_801EE64);
    s->x = pos.x - gCamera.x;
    s->y = pos.y - gCamera.y;

    flickey->positions[flickey->unk2A4].x = pos.x;
    flickey->positions[flickey->unk2A4].y = pos.y;

    flickey->unk2A4 = (flickey->unk2A4 + 1) & 0x3F;

    s = &flickey->s2;
    for (i = 0; i < 3; i++) {
        index = (flickey->unk2A4 - ((i + 1) * 16)) & 0x3F;
        s->x = flickey->positions[index].x - gCamera.x;
        s->y = flickey->positions[index].y - gCamera.y;
        Coll_Player_Projectile(s, flickey->positions[index].x, flickey->positions[index].y);
    }

    s = &flickey->s;
    if (Coll_Player_Enemy_Attack(s, pos.x, pos.y, 0)) {
        flickey->unkA0 = 0x78;
        s = &flickey->s2;
        UpdateSpriteAnimation(s);
        for (i = 0; i < 3; i++) {
            index = (flickey->unk2A4 - ((i + 1) * 16)) & 0x3F;
            s->x = flickey->positions[index].x - gCamera.x;
            s->y = flickey->positions[index].y - gCamera.y;

            positions[i][0] = flickey->positions[index].x;
            positions[i][1] = flickey->positions[index].y;
            positions[i][2] = flickey->positions[index].y - flickey->positions[(index - 1) & 0x3F].y;

            DisplaySprite(s);
        }

        for (i = 0; i < 3; i++) {
            u32 temp;
            flickey->positions[i].x = QS(positions[i][0]);
            flickey->positions[i].y = QS(positions[i][1]);
            temp = Div(flickey->unk9C, i + 1);
            flickey->positions[i + 3].x = temp;
            flickey->positions[i + 3].y = QS(positions[i][2]);
        }

        gCurTask->main = sub_80591FC;
        return;
    }

    if (someVal < 0) {
        s->y += someVal;
        flickey->offsetY += Q(someVal);

        flickey->unk9E = -0x400;
        s->graphics.anim = SA2_ANIM_FLICKEY;
        s->variant = 1;
        s->prevVariant = -1;

        if (ENEMY_CROSSED_LEFT_BORDER(flickey, me) && flickey->unk9C < 0) {
            s->graphics.anim = SA2_ANIM_FLICKEY;
            s->variant = 0;
            s->prevVariant = -1;
            gCurTask->main = sub_8058EDC;
        } else if (ENEMY_CROSSED_RIGHT_BORDER(flickey, me) && flickey->unk9C > 0) {
            s->graphics.anim = SA2_ANIM_FLICKEY;
            s->variant = 0;
            s->prevVariant = -1;
            gCurTask->main = sub_8058EDC;
        }
    }

    if (flickey->unk9E > 0 && s->variant == 1) {
        s->graphics.anim = SA2_ANIM_FLICKEY;
        s->variant = 2;
        s->prevVariant = -1;
    }

    ENEMY_DESTROY_IF_OFFSCREEN(flickey, me, s);

    ENEMY_UPDATE(s, pos.x, pos.y);

    Flickey_RenderIronBalls(flickey);
}

static void sub_8058EDC(void)
{
    u8 i;
    Sprite_Flickey *flickey = TASK_DATA(gCurTask);
    Sprite *s = &flickey->s;
    MapEntity *me = flickey->base.me;
    s32 positions[3][3];
    Vec2_32 pos;
    u8 index;

    ENEMY_UPDATE_POSITION(flickey, s, pos.x, pos.y);

    flickey->positions[flickey->unk2A4].x = pos.x;
    flickey->positions[flickey->unk2A4].y = pos.y;

    flickey->unk2A4 = (flickey->unk2A4 + 1) & 0x3F;

    s = &flickey->s2;
    for (i = 0; i < 3; i++) {
        index = (flickey->unk2A4 - ((i + 1) * 16)) & 0x3F;
        s->x = flickey->positions[index].x - gCamera.x;
        s->y = flickey->positions[index].y - gCamera.y;
        Coll_Player_Projectile(s, flickey->positions[index].x, flickey->positions[index].y);
    }

    s = &flickey->s;
    if (Coll_Player_Enemy_Attack(s, pos.x, pos.y, 0)) {
        flickey->unkA0 = 0x78;
        gCurTask->main = sub_80591FC;

        s = &flickey->s2;
        UpdateSpriteAnimation(s);

        for (i = 0; i < 3; i++) {
            index = (flickey->unk2A4 - ((i + 1) * 16)) & 0x3F;
            s->x = flickey->positions[index].x - gCamera.x;
            s->y = flickey->positions[index].y - gCamera.y;

            positions[i][0] = flickey->positions[index].x;
            positions[i][1] = flickey->positions[index].y;
            positions[i][2] = flickey->positions[index].y - flickey->positions[(index - 1) & 0x3F].y;

            DisplaySprite(s);
        }

        for (i = 0; i < 3; i++) {
            u32 temp;
            flickey->positions[i].x = QS(positions[i][0]);
            flickey->positions[i].y = QS(positions[i][1]);
            temp = Div(flickey->unk9C, i + 1);
            flickey->positions[i + 3].x = temp;
            flickey->positions[i + 3].y = QS(positions[i][2]);
        }
        return;
    }

    ENEMY_DESTROY_IF_OFFSCREEN(flickey, me, s);
    Player_UpdateHomingPosition(QS(pos.x), QS(pos.y));
    if (UpdateSpriteAnimation(s) == 0) {
        if (s->frameFlags & SPRITE_FLAG_MASK_X_FLIP) {
            SPRITE_FLAG_CLEAR(s, X_FLIP);
            flickey->unk9C = -0x180;
        } else {
            SPRITE_FLAG_SET(s, X_FLIP);
            flickey->unk9C = 0x180;
        }

        s->graphics.anim = SA2_ANIM_FLICKEY;
        s->variant = 1;
        s->prevVariant = -1;
        gCurTask->main = Task_FlickeyMain;
    }

    DisplaySprite(s);
    Flickey_RenderIronBalls(flickey);
}

static void sub_80591FC(void)
{
    Sprite_Flickey *flickey = TASK_DATA(gCurTask);
    Sprite *s = &flickey->s2;
    s32 someVal;
    u8 i;

    flickey->unkA0--;

    if (flickey->unkA0 == 0) {
        TaskDestroy(gCurTask);
        return;
    }

    UpdateSpriteAnimation(s);
    for (i = 0; i < 3; i++) {
        flickey->positions[i + 3].y += 0x30;
        flickey->positions[i].x += flickey->positions[i + 3].x;
        flickey->positions[i].y += flickey->positions[i + 3].y;
        someVal = sub_801F07C(I(flickey->positions[i].y), I(flickey->positions[i].x), 1, 8, 0, sub_801EE64);

        if (someVal < 0) {
            flickey->positions[i].y += QS(someVal);
            flickey->positions[i + 3].y = -flickey->positions[i + 3].y;
        }

        if (flickey->unkA0 > 0x2D || (gStageTime & 2 && flickey->unkA0 < 0x2D)) {
            s->x = I(flickey->positions[i].x) - gCamera.x;
            s->y = I(flickey->positions[i].y) - gCamera.y;

            DisplaySprite(s);
            s->frameFlags ^= 0x400;
            DisplaySprite(s);
        }
    }
}

static void Flickey_RenderIronBalls(Sprite_Flickey *flickey)
{
    u8 i;
    Sprite *s = &flickey->s2;
    UpdateSpriteAnimation(s);

    for (i = 0; i < 3; i++) {
        u8 index = (flickey->unk2A4 - (i + 1) * 16) & 0x3F;
        s->x = flickey->positions[index].x - gCamera.x;
        s->y = flickey->positions[index].y - gCamera.y;
        DisplaySprite(s);

        SPRITE_FLAG_FLIP(s, X_FLIP);
        DisplaySprite(s);
    }
}

static void TaskDestructor_Flickey(struct Task *t)
{
    Sprite_Flickey *flickey = TASK_DATA(t);
    VramFree(flickey->s.graphics.dest);
    VramFree(flickey->s2.graphics.dest);
}
