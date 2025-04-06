#include "global.h"
#include "malloc_vram.h"
#include "task.h"
#include "trig.h"
#include "game/enemies/hammerhead.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "game/entity.h"
#include "game/sa1_sa2_shared/collision.h"

#include "constants/animations.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ Hitbox reserved; // "overflow" from Sprite
    /* 0x48 */ s16 unk44;
    /* 0x46 */ s16 unk46;
    /* 0x48 */ s32 unk48;
    /* 0x4C */ s16 unk4C;
    /* 0x50 */ s32 unk50[3];
} Enemy_Hammerhead;

static void Task_Hammerhead(void);
static void sub_8056EDC(Enemy_Hammerhead *hammerhead);
static void TaskDestructor_Hammerhead(struct Task *);

void CreateEntity_Hammerhead(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(Task_Hammerhead, sizeof(Enemy_Hammerhead), 0x4040, 0, TaskDestructor_Hammerhead);
    Enemy_Hammerhead *hammerhead = TASK_DATA(t);
    Sprite *s = &hammerhead->s;
    hammerhead->base.regionX = spriteRegionX;
    hammerhead->base.regionY = spriteRegionY;
    hammerhead->base.me = me;
    hammerhead->base.spriteX = me->x;
    hammerhead->base.id = spriteY;

    hammerhead->unk48 = 0;
    sub_8056EDC(hammerhead);

    hammerhead->unk4C = 4;
    hammerhead->unk44 = me->d.uData[3];

    s->x = TO_WORLD_POS(me->x, spriteRegionX);
    s->y = TO_WORLD_POS(me->y, spriteRegionY);
    SET_MAP_ENTITY_INITIALIZED(me);

    SPRITE_INIT(s, 36, SA2_ANIM_HAMMERHEAD, 0, 18, 2);
}

static void Task_Hammerhead(void)
{
    Player *p = &gPlayer;
    Enemy_Hammerhead *hammerhead = TASK_DATA(gCurTask);
    Sprite *s = &hammerhead->s;
    MapEntity *me = hammerhead->base.me;
    u32 unk4C;
    u16 temp;
    s32 sin;
    s32 prevUnk48;
    s32 ip;
    s32 posX, posY;

    if (IS_MULTI_PLAYER) {
        sub_8056EDC(hammerhead);
    }

    unk4C = hammerhead->unk4C;
    temp = (((gStageTime * 3) / 2) + (u16)hammerhead->unk44) % 256;
    temp = ((unk4C * temp) & 0x1FF) | 0x200;

    prevUnk48 = hammerhead->unk48;
    sin = SIN(temp);

    hammerhead->unk48 = (sin * 15) >> 3;
    ip = hammerhead->unk48 - prevUnk48;

    posX = TO_WORLD_POS(hammerhead->base.spriteX, hammerhead->base.regionX);
    posY = TO_WORLD_POS(me->y, hammerhead->base.regionY);

    s->x = posX - gCamera.x;

    if (IS_MULTI_PLAYER) {
        s->y = (posY - gCamera.y) + I(hammerhead->unk50[2]);
    } else {
        s->y = (posY - gCamera.y) + I(prevUnk48);
    }

    if ((p->moveState & MOVESTATE_STOOD_ON_OBJ) && (p->stoodObj == s)) {
        p->qWorldY += 0x100;
        p->qWorldY += ip;
    }
    if (!(p->moveState & MOVESTATE_IA_OVERRIDE)) {
        s32 flags = Player_PlatformCollision(s, posX, posY + I(hammerhead->unk48), p);

        if (flags & 0x10000) {
            p->qWorldY += (flags << 24) >> 16;
        }
    }

    if (Enemy_PlayerAttackCollision(s, posX, posY + I(hammerhead->unk48), 1) == TRUE) {
        TaskDestroy(gCurTask);
    } else {
        posX -= gCamera.x;
        posY -= gCamera.y;

        if (IS_OUT_OF_RANGE_3(s->x, s->y, (CAM_REGION_WIDTH / 2), CAM_REGION_WIDTH)
            && IS_OUT_OF_RANGE_3(posX, posY, (CAM_REGION_WIDTH / 2), CAM_REGION_WIDTH)) {
            SET_MAP_ENTITY_NOT_INITIALIZED(me, hammerhead->base.spriteX);
            TaskDestroy(gCurTask);
        } else {
            Player_UpdateHomingPosition(posX << 8, (posY << 8) + hammerhead->unk48);
            UpdateSpriteAnimation(s);
            DisplaySprite(s);
        }
    }
}

static void sub_8056EDC(Enemy_Hammerhead *hammerhead)
{
    hammerhead->unk50[2] = hammerhead->unk50[1];
    hammerhead->unk50[1] = hammerhead->unk50[0];
    hammerhead->unk50[0] = hammerhead->unk48;
}

static void TaskDestructor_Hammerhead(struct Task *t)
{
    Enemy_Hammerhead *hammerhead = TASK_DATA(t);
    Sprite *s = &hammerhead->s;
    VramFree(s->graphics.dest);

    if ((gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ) && (gPlayer.stoodObj == s)) {
        gPlayer.moveState &= ~MOVESTATE_STOOD_ON_OBJ;
        gPlayer.stoodObj = NULL;
    }
}