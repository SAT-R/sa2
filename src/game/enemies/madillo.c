#include "global.h"
#include "malloc_vram.h"
#include "game/entity.h"

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

void Task_MadilloMain(void);
void Task_8056230(void);
void Task_80564BC(void);
void TaskDestructor_80095E8(struct Task *);

void CreateEntity_Madillo(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                          u8 spriteY)
{
    ENTITY_INIT(Sprite_Madillo, madillo, Task_MadilloMain, 0x4040, 0,
                TaskDestructor_80095E8);

    if (me->d.sData[1] != 0) {
        madillo->clampParam = TRUE;
    } else {
        madillo->clampParam = FALSE;
    }

    ENEMY_SET_SPAWN_POS_GROUND(madillo, me);

    madillo->unk4C = -Q_24_8(1.5);
    madillo->unk51 = 120;

    s->x = TO_WORLD_POS(me->x, spriteRegionX);
    s->y = TO_WORLD_POS(me->y, spriteRegionY);
    SET_MAP_ENTITY_INITIALIZED(me);

    SPRITE_INIT_EXCEPT_POS(s, 16, SA2_ANIM_MADILLO, 0, 0x480, 2);
}

// (98.89%) https://decomp.me/scratch/5PiOp
NONMATCH("asm/non_matching/Task_MadilloMain.inc", void Task_MadilloMain(void))
{
    Sprite_Madillo *madillo = TaskGetStructPtr(gCurTask);
    Sprite *s = &madillo->s;
    MapEntity *me = madillo->base.me;
    Player *p;
    Vec2_32 pos;
    s32 posX, posY;

    // TODO: Merge with ENEMY_CLAMP_TO_GROUND macro
    {
        s32 delta
            = ENEMY_CLAMP_TO_GROUND_INNER(madillo, madillo->clampParam, sub_801EC3C);
        if (delta < 0) {
            madillo->offsetY += Q_24_8(delta);
            delta
                = ENEMY_CLAMP_TO_GROUND_INNER(madillo, madillo->clampParam, sub_801EC3C);
        }

        if (delta > 0) {
            madillo->offsetY += Q_24_8(delta);
        }
    }

    // ENEMY_UPDATE_POSITION(madillo, s, pos.x, pos.y);
    pos.x = Q_24_8_TO_INT(madillo->spawnX + madillo->offsetX);
    pos.y = Q_24_8_TO_INT(madillo->spawnY + madillo->offsetY);
    s->x = pos.x - gCamera.x;
    s->y = pos.y - gCamera.y;

    ENEMY_DESTROY_IF_PLAYER_HIT_2(s, pos);
    ENEMY_DESTROY_IF_INVISIBLE(madillo, me, s);

    p = &gPlayer;
    posY = Q_24_8(pos.y - 50);
    posX = Q_24_8(pos.x) << 8;
    if (Q_24_8(pos.y - 50) < gPlayer.y) {
        if (Q_24_8(pos.y + 50) > gPlayer.y) {
            if ((posX > gPlayer.x) && (Q_24_8(pos.x - 120) < (gPlayer.x))) {
                if (Q_24_8_TO_INT(madillo->offsetX) > me->d.sData[0] * TILE_WIDTH) {
                    gCurTask->main = Task_8056230;
                    s->graphics.anim = SA2_ANIM_MADILLO;
                    s->variant = 1;
                    s->unk21 = -1;
                    SPRITE_FLAG_CLEAR(s, X_FLIP);
                }
            } else {
                // _080561BC
                if (Q_24_8(pos.x + 120) > gPlayer.x) {
                    if (Q_24_8_TO_INT(madillo->offsetX)
                        < (me->d.sData[0] + me->d.uData[2]) * TILE_WIDTH) {
                        gCurTask->main = Task_8056230;
                        s->graphics.anim = SA2_ANIM_MADILLO;
                        s->variant = 1;
                        s->unk21 = -1;
                        SPRITE_FLAG_SET(s, X_FLIP);
                    }
                }
            }
        }
    }

    ENEMY_UPDATE_EX_RAW(s, posX, Q_24_8_NEW(pos.y), {});
}
END_NONMATCH

// Task_8056230
// // Once this matches, Task_80564BC should be straightforward
// https://decomp.me/scratch/vV1cJ
#if 0
void Task_8056230(void)
{
    Sprite_Madillo *madillo = TaskGetStructPtr(gCurTask);
    Sprite *s = &madillo->s; // r5
    Sprite *otherS;
    struct UNK_3005A70 *ip;
    MapEntity *me = madillo->base.me;
    Player *p;
    Vec2_32 pos;
    s32 posX, posY;

    if(s->unk10 & SPRITE_FLAG_MASK_X_FLIP) {
        madillo->offsetX -= madillo->unk4C;
    } else {
        madillo->offsetX += madillo->unk4C;
    }
    
    // TODO: Merge with ENEMY_CLAMP_TO_GROUND macro
    {
        s32 delta = ENEMY_CLAMP_TO_GROUND_INNER(madillo, madillo->clampParam, sub_801EE64);
        if(delta < 0) {
            madillo->offsetY += Q_24_8(delta);
            delta = ENEMY_CLAMP_TO_GROUND_INNER(madillo, madillo->clampParam, sub_801EC3C);
        }
    
        if(delta > 0) {
            madillo->offsetY += Q_24_8(delta);
        }
    }

    posX = Q_24_8_TO_INT(madillo->spawnX + madillo->offsetX); // r6
    posY = Q_24_8_TO_INT(madillo->spawnY + madillo->offsetY); // r7
    s->x = posX - gCamera.x;
    s->y = posY - gCamera.y;

    ip = gPlayer.unk90;
    otherS = &ip->s;
    if(otherS->unk28[0].unk0 != -1) {
        u8 r8 = s->unk28[0].unk4;

        if(posX+r8 <= gPlayer.x + ip->s.unk28[0].unk4)
        if ((madillo->s.unk22 - r8 + posX) < r8)
        if (posX+r8 >= r8)
        if (ip->s.unk28[0].unk6 - ip->s.unk28[0].unk4 >= posX+r8)
        if(s->unk28[0].unk5 + posY <= Q_24_8_TO_INT(gPlayer.y) + otherS->unk28[0].unk5)
        if((s->unk28[0].unk7 - s->unk28[0].unk5) + posY < Q_24_8_TO_INT(gPlayer.y) + otherS->unk28[0].unk5)
        if(s->unk28[0].unk5 + posY >= Q_24_8_TO_INT(gPlayer.y) + otherS->unk28[0].unk5)
        {
            if(otherS->unk28[0].unk7 - s->unk28[0].unk5 >= Q_24_8_TO_INT(gPlayer.y) + otherS->unk28[0].unk5)
            if((gPlayer.itemEffect & 0x2) == PLAYER_ITEM_EFFECT__NONE)
                sub_800CBA4(&gPlayer);
        }
    }
    
    ENEMY_DESTROY_IF_INVISIBLE(madillo, me, s);

    if(s->unk10 & 0x400) {
        if((Q_24_8_TO_INT(madillo->offsetX) <= (me->d.sData[0] + me->d.uData[2]) * TILE_WIDTH)){
            gCurTask->main = Task_80564BC;
            s->graphics.anim = SA2_ANIM_MADILLO;
            s->variant = 0;
            s->unk21 = -1;
            madillo->unk51 = 120;
        }
    } else if(Q_24_8_TO_INT(madillo->offsetX) < me->d.sData[0] * TILE_WIDTH) {
            gCurTask->main = Task_80564BC;
            s->graphics.anim = SA2_ANIM_MADILLO;
            s->variant = 0;
            s->unk21 = -1;
            madillo->unk51 = 120;        
    }

    ENEMY_UPDATE_EX_RAW(s, Q_24_8_NEW(posX), Q_24_8_NEW(pos.y), {});
}
#endif