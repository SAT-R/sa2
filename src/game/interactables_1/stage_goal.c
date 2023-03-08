#include "global.h"
#include "lib/m4a.h"
#include "gba/syscall.h"

#include "malloc_vram.h"

#include "game/game.h"
#include "game/entity.h"
#include "game/interactables_1/stage_goal.h"

#include "sprite.h"
#include "task.h"

#include "constants/animations.h"
#include "constants/move_states.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite sprite;
} Sprite_StageGoal;

void sub_80627CC(void);
void TaskDestructor_8062E7C(struct Task *);

void initSprite_Interactable_StageGoal(MapEntity *me, u16 spriteRegionX,
                                       u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(sub_80627CC, 0x3C, 0x2010, 0, TaskDestructor_8062E7C);
    Sprite_StageGoal *stageGoal = TaskGetStructPtr(t);

    Sprite *sprite = &stageGoal->sprite;

    stageGoal->base.regionX = spriteRegionX;
    stageGoal->base.regionY = spriteRegionY;
    stageGoal->base.me = me;
    stageGoal->base.spriteX = me->x;
    stageGoal->base.spriteY = spriteY;

    sprite->x = SpriteGetScreenPos(me->x, spriteRegionX);
    sprite->y = SpriteGetScreenPos(me->y, spriteRegionY);
    SET_MAP_ENTITY_INITIALIZED(me);

    sprite->graphics.dest = VramMalloc(4);
    sprite->graphics.anim = 532;
    sprite->variant = 1;
    sprite->unk21 = -1;
    sprite->unk1A = 0x100;
    sprite->graphics.size = 0;
    sprite->unk14 = 0;
    sprite->unk1C = 0;
    sprite->unk22 = 0x10;
    sprite->focused = FALSE;
    sprite->unk28[0].unk0 = -1;
    sprite->unk10 = 0x1000;
    sub_8004558(sprite);
}

void sub_80628B4(void);

void sub_80627CC(void)
{
    Sprite_StageGoal *stageGoal = TaskGetStructPtr(gCurTask);
    Sprite *sprite = &stageGoal->sprite;
    MapEntity *me = stageGoal->base.me;

    s32 x = SpriteGetScreenPos(stageGoal->base.spriteX, stageGoal->base.regionX);
    s32 y = SpriteGetScreenPos(me->y, stageGoal->base.regionY);

    sprite->x = x - gCamera.x;
    sprite->y = y - gCamera.y;

    if (IS_OUT_OF_CAM_RANGE(sprite->x, sprite->y)) {
        me->x = stageGoal->base.spriteX;
        TaskDestroy(gCurTask);
        return;
    }

    if (PlayerIsAlive && !(gPlayer.moveState & MOVESTATE_400000)) {
        if (sub_800C204(sprite, x, y, 0, &gPlayer, 0) == 1) {
            sprite->graphics.anim = 532;
            sprite->variant = 0;
            sprite->unk21 = -1;
            gCurTask->main = sub_80628B4;
        }
    }
    sub_80051E8(sprite);
}

void sub_80628B4(void)
{
    Sprite_StageGoal *stageGoal = TaskGetStructPtr(gCurTask);
    Sprite *sprite = &stageGoal->sprite;
    MapEntity *me = stageGoal->base.me;

    s32 x = SpriteGetScreenPos(stageGoal->base.spriteX, stageGoal->base.regionX);
    s32 y = SpriteGetScreenPos(me->y, stageGoal->base.regionY);

    sprite->x = x - gCamera.x;
    sprite->y = y - gCamera.y;

    if (IS_OUT_OF_CAM_RANGE(sprite->x, sprite->y)) {
        me->x = stageGoal->base.spriteX;
        TaskDestroy(gCurTask);
        return;
    }

    sub_8004558(sprite);
    sub_80051E8(sprite);
}

void sub_8062B00(void);

void sub_8062934(void)
{
    Sprite_StageGoal *stageGoal = TaskGetStructPtr(gCurTask);
    Sprite *sprite = &stageGoal->sprite;
    MapEntity *me = stageGoal->base.me;

    u8 spriteX = stageGoal->base.spriteX;
    u16 regionX = stageGoal->base.regionX;
    u16 regionY = stageGoal->base.regionY;
    s32 x = SpriteGetScreenPos(spriteX, regionX);
    s32 y = SpriteGetScreenPos(me->y, regionY);

    if (!GAME_MODE_IS_SINGLE_PLAYER(gGameMode)) {
        if (x <= Q_24_8_TO_INT(gPlayer.x)
            && !(gPlayer.moveState & (MOVESTATE_8000000 | MOVESTATE_8))) {
            gPlayer.unk6D = 10;
            gUnknown_030054D0 = x;
            sub_8062B00();
        }
    } else if (x <= Q_24_8_TO_INT(gPlayer.x)
               && !(gPlayer.moveState & MOVESTATE_8000000)) {
        gPlayer.unk6D = 10;
        gUnknown_03005424 |= 0x21;
        gUnknown_030054D0 = x;

        if (gGameMode == GAME_MODE_SINGLE_PLAYER
            && !(gPlayer.moveState & MOVESTATE_IN_AIR) && gPlayer.speedGroundX > 0x280) {
            u32 temp;
            if (gPlayer.speedGroundX < 0x401) {
                temp = 200;
            } else if (gPlayer.speedGroundX < 0x901) {
                temp = 300;
            } else if (gPlayer.speedGroundX < 0xA01) {
                temp = 500;
            } else {
                temp = 800;
            }

            // Redundant check :/
            if (temp != 0) {
                u32 temp2, temp3;
                u32 prev = gUnknown_03005450;
                gUnknown_03005450 += temp;
                temp2 = Div(gUnknown_03005450, 50000);
                temp3 = Div(prev, 50000);
                if (temp2 != temp3 && gGameMode == GAME_MODE_SINGLE_PLAYER) {
                    u16 numLives = (temp2 - temp3);
                    numLives += gNumLives;

                    if (numLives > 0xFF) {
                        numLives = 0xFF;
                    }

                    gNumLives = numLives;
                    gUnknown_030054A8[3] = 0x10;
                }
                sub_801F3A4(Q_24_8_TO_INT(gPlayer.x), Q_24_8_TO_INT(gPlayer.y), temp);
            }
        }
    }

    x -= gCamera.x;
    y -= gCamera.y;
    if (IS_OUT_OF_CAM_RANGE_TYPED(u32, x, y)) {
        me->x = spriteX;
        TaskDestroy(gCurTask);
    }
}

extern void sub_8019CCC(u8, u8);
extern struct UNK_3005510 *sub_8019224(void);

void sub_8062D44(void);

void sub_8062B00(void)
{
    struct UNK_3005510 *unk5510;
    u32 count = 0;
    struct MultiplayerPlayer *player
        = TaskGetStructPtr(gMultiplayerPlayerTasks[SIO_MULTI_CNT->id]);
    gPlayer.unk37 &= ~0x40;
    gPlayer.unk32 = 0;

    if (!(player->unk5C & 1)) {
        u32 j;
        for (j = 0; j < ARRAY_COUNT(gMultiplayerPlayerTasks)
             && gMultiplayerPlayerTasks[j] != NULL;
             j++) {
            struct MultiplayerPlayer *otherPlayer
                = TaskGetStructPtr(gMultiplayerPlayerTasks[j]);
            if (otherPlayer->unk5C & 1) {
                count++;
            }
        }

        sub_8019CCC(SIO_MULTI_CNT->id, count);
        player->unk5C |= 1;

        if (count == 0) {
            gUnknown_03005424 |= 4;
            gUnknown_03005490 = 3600;
        }

        unk5510 = sub_8019224();
        unk5510->unk0 = 7;
        gCurTask->main = sub_8062D44;
        gCamera.unk50 |= 4;
    }
}

void sub_8062BD0(void)
{
    u32 thing = 0;
    struct Task **mpTasks = gMultiplayerPlayerTasks;
    struct UNK_3005510 *unk5510;
    u32 j;

    // Required for match
    *SIO_MULTI_CNT;

    gPlayer.unk37 &= ~0x40;
    gPlayer.unk32 = 0;

    for (j = 0; j < ARRAY_COUNT(gMultiplayerPlayerTasks) && mpTasks[j] != NULL; j++) {
        // TODO: make this a macro? What does it even mean
        if ((gMultiplayerConnections & (0x10 << (j))) >> ((j + 4))
                != (gMultiplayerConnections & (0x10 << (SIO_MULTI_CNT->id)))
                    >> (SIO_MULTI_CNT->id + 4)
            && gUnknown_030054B4[j] == 0) {
            thing = 1;
            break;
        }
    }

    for (j = 0;
         j < ARRAY_COUNT(gMultiplayerPlayerTasks) && gMultiplayerPlayerTasks[j] != NULL;
         j++) {
        if (gUnknown_030054B4[j] == -1) {
            if ((gMultiplayerConnections & (0x10 << (j))) >> ((j + 4))
                == (gMultiplayerConnections & (0x10 << (SIO_MULTI_CNT->id)))
                    >> (SIO_MULTI_CNT->id + 4)) {
                sub_8019CCC(j, thing);
            } else {
                sub_8019CCC(j, thing ^ 1);
            }
        }
    }

    gUnknown_03005424 |= 4;
    gUnknown_03005490 = 3600;
    unk5510 = sub_8019224();
    unk5510->unk0 = 7;
    gCurTask->main = sub_8062D44;
    gCamera.unk50 |= 4;
}