#include "global.h"
#include "core.h"
#include "trig.h"
#include "malloc_vram.h"
#include "lib/m4a/m4a.h"
#include "game/shared/stage/entity.h"
#include "game/shared/stage/collision.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/songs.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ Hitbox reserved;

    /* 0x44 */ u16 unk44;
    /* 0x46 */ u16 unk46;
    /* 0x48 */ s32 unk48;
    /* 0x4C */ s32 unk4C;
    /* 0x50 */ s16 unk50;
    /* 0x52 */ s16 unk52;
    /* 0x54 */ u16 unk54;
    /* 0x56 */ u8 unk56;
    /* 0x57 */ u8 unk57;
} SpikedBarrel;

void Task_SpikedBarrel(void);
void TaskDestructor_SpikedBarrel(Task *t);

// TODO: Unused except for the 1st element...
const TileInfoBarrel gUnknown_086CEE50[4] = {
    { SA1_ANIM_SPIKED_BARREL, 0 },
    { SA1_ANIM_SPIKED_BARREL, 1 },
    { SA1_ANIM_SPIKED_BARREL, 2 },
    { SA1_ANIM_SPIKED_BARREL, 3 },
};

void CreateEntity_SpikedBarrel(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_SpikedBarrel, sizeof(SpikedBarrel), 0x2000, 0, TaskDestructor_SpikedBarrel);
    SpikedBarrel *barrel = TASK_DATA(t);
    Sprite *s = &barrel->s;

    barrel->base.regionX = regionX;
    barrel->base.regionY = regionY;
    barrel->base.me = me;
    barrel->base.meX = me->x;
    barrel->base.id = id;

    barrel->unk48 = 0;
    barrel->unk4C = 0;
    barrel->unk54 = 0;
    barrel->unk56 = 0;
    barrel->unk57 = 0x10;

    if (me->d.uData[2] > me->d.uData[3]) {
        if (me->d.sData[0] >= 0) {
            barrel->unk50 = 4;
            barrel->unk44 = 0;
            barrel->unk52 = 0;
        } else {
            barrel->unk50 = 4;
            barrel->unk44 = 0x80;
            barrel->unk52 = 0;
        }
    } else {
        if (me->d.sData[1] >= 0) {
            barrel->unk50 = 0;
            barrel->unk52 = 4;
            barrel->unk44 = 0;
        } else {
            barrel->unk50 = 0;
            barrel->unk52 = 4;
            barrel->unk44 = 0x80;
        }
    }

    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);

    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = ALLOC_TILES(SA1_ANIM_SPIKED_BARREL);
    s->graphics.anim = gUnknown_086CEE50[0].anim;
    s->variant = gUnknown_086CEE50[0].variant;
    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
    UpdateSpriteAnimation(s);
}

// (97.43%) https://decomp.me/scratch/qM0DE
NONMATCH("asm/non_matching/game/sa1/stage/interactables/spiked_barrel__Task_SpikedBarrel.inc", void Task_SpikedBarrel(void))
{
    SpikedBarrel *barrel;
    Sprite *s;
    s32 unk50;
    Player *p;
    CamCoord worldX;
    CamCoord worldY; // sp00, sp04
    MapEntity *me;
    s32 qSp0C;
    s32 qSp10 = 0;
    s32 r3;
    s32 r6;
    s32 r8;
    s32 theta;
    s32 i;
    qSp10 = 0;
    barrel = TASK_DATA(gCurTask);
    s = &barrel->s;
    me = barrel->base.me;
    unk50 = barrel->unk50;

    if (barrel->unk50 != 0) {
        r8 = barrel->unk48;
        r3 = Q(me->d.uData[2] * TILE_WIDTH);
        theta = CLAMP_SIN_PERIOD(barrel->unk50 * ((gStageTime + barrel->unk44) & 0xFF));
        barrel->unk48 = (r3 * SIN(theta)) >> 14;
        qSp0C = barrel->unk48 - r8;
    } else {
        // _080909F4
        qSp0C = 0;
        barrel->unk48 = qSp10;
    }
    // _080909FC

    if (barrel->unk52 != 0) {
        r6 = barrel->unk4C;
        r3 = Q(me->d.uData[3] * TILE_WIDTH);
        theta = CLAMP_SIN_PERIOD(barrel->unk52 * ((gStageTime + barrel->unk44) & 0xFF));
        barrel->unk4C = (r3 * SIN(theta)) >> 14;
        r6 = barrel->unk4C - r6;
        qSp10 = r6;
    } else {
        // _08090A4C
        r6 = 0;
        qSp10 = 0;
        barrel->unk4C = 0;
    }
    // _08090A52

    worldX = TO_WORLD_POS(barrel->base.meX, barrel->base.regionX);
    worldY = TO_WORLD_POS(me->y, barrel->base.regionY);

    s->x = worldX - gCamera.x + Div(barrel->unk48, 0x100);
    s->y = worldY - gCamera.y + Div(barrel->unk4C, 0x100);

    i = 0;
    do {
        // _08090AB2_loop
        p = &PLAYER(i);

        if ((p->moveState & MOVESTATE_STOOD_ON_OBJ) && (p->stoodObj == s)) {
            p->qWorldX += qSp0C;
            p->qWorldY += Q(1) + qSp10;
        }
        // _08090AE2

        Coll_Player_PlatformCrumbling(s, I(barrel->unk48) + worldX, I(barrel->unk4C) + worldY, p);

        if ((barrel->unk56 == 0) || (barrel->unk56 == 2)) {
            if (s->hitboxes[1].index != HITBOX_STATE_INACTIVE) {
                // _08090B2C
                s32 r0, r2;

                // r0 = worldX + Div(barrel->unk48, 0x100) + s->hitboxes[1].b.left;
                // r2 = I(p->qWorldX) + p->spriteInfoBody->s.hitboxes[0].b.left;

                // RECT_COLLISION(x0,y0,hb0,x1,y1,hb1)
                if (RECT_COLLISION(worldX + Div(barrel->unk48, 0x100), worldY + Div(barrel->unk4C, 0x100), &s->hitboxes[1].b, I(p->qWorldX),
                                   I(p->qWorldY), &p->spriteInfoBody->s.hitboxes[0].b)) {
                    if (PLAYER_IS_ALIVE) {
                        if (Coll_DamagePlayer(p)) {
                            m4aSongNumStart(SE_171);
                        }
                    }
                }
            }
        }
    } while (++i < gNumSingleplayerCharacters);
    // _08090C9C

    if (IS_OUT_OF_DISPLAY_RANGE(worldX, worldY) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, barrel->base.meX);
        TaskDestroy(gCurTask);
        return;
    } else if (((gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ) && (gPlayer.stoodObj == s))
               || ((gNumSingleplayerCharacters == 2) && ((gPartner.moveState & MOVESTATE_STOOD_ON_OBJ) && (gPartner.stoodObj == s)))) {
        // _08090D1C
        if (barrel->unk54 != 0x100) {
            barrel->unk54 += 0x10;
        }
    } else {
        if (barrel->unk54 != 0x0) {
            barrel->unk54 -= 0x10;
        }
    }

    s->y += (SIN(barrel->unk54) >> 12);

    if (--barrel->unk57 == 0) {
        if (barrel->unk56 == 0 || barrel->unk56 == 2) {
            barrel->unk57 = 0x30;
        } else {
            barrel->unk57 = 0x10;
        }
        // _08090DB6

        barrel->unk56 = (barrel->unk56 + 1) % 4u;
        s->prevVariant = -1;
        s->variant = barrel->unk56;
    }

    // _08090DD4
    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}
END_NONMATCH

void TaskDestructor_SpikedBarrel(Task *t)
{
    SpikedBarrel *barrel = TASK_DATA(t);
    VramFree(barrel->s.graphics.dest);
}