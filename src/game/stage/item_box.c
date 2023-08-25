#include "global.h"
#include "core.h"
#include "malloc_vram.h"
#include "sprite.h"
#include "task.h"
#include "trig.h"
#include "lib/m4a.h"
#include "game/game.h"
#include "game/entity.h"
#include "game/item_tasks.h"
#include "game/multiplayer/unknown_1.h"
#include "game/stage/dust_cloud.h"

#include "constants/animations.h"
#include "constants/items.h"
#include "constants/player_transitions.h"
#include "constants/songs.h"
#include "constants/zones.h"

#define ITEM_DURATION_INVINCIBILITY ZONE_TIME_TO_INT(0, 20)
#define ITEM_DURATION_SPEED_UP      ZONE_TIME_TO_INT(0, 20)

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ Sprite item;
    /* 0x6C */ s32 x;
    /* 0x70 */ s32 y;
    /* 0x74 */ s16 unk74;
    /* 0x76 */ u8 kind;
    /* 0x77 */ u8 frames;
    /* 0x78 */ bool8 unk78;
} Entity_ItemBox; /* size: 0x7C */

void sub_800B1AC(Entity_ItemBox *);
void sub_800B580(Entity_ItemBox *, bool32);
void sub_800B860(Entity_ItemBox *, bool32);
void Task_800B704(void);
void Task_800B780(void);
void Task_800B7D0(void);
void TaskDestructor_800B80C(struct Task *);
void sub_800B828(Entity_ItemBox *);
bool32 sub_800B8AC(Entity_ItemBox *);
bool32 sub_800B8F4(Entity_ItemBox *);
void Task_800B950(void);
void sub_800B9A0(Entity_ItemBox *);

const u16 ItemBox_MysteryIcons[13][3] = {
    { SA2_ANIM_ITEMBOX_TYPE, 0, 4 },  { SA2_ANIM_ITEMBOX_TYPE, 5, 4 },
    { SA2_ANIM_ITEMBOX_TYPE, 6, 4 },  { SA2_ANIM_ITEMBOX_TYPE, 7, 4 },
    { SA2_ANIM_ITEMBOX_TYPE, 8, 4 },  { SA2_ANIM_ITEMBOX_TYPE, 9, 4 },
    { SA2_ANIM_ITEMBOX_TYPE, 10, 4 }, { SA2_ANIM_ITEMBOX_TYPE, 11, 4 },
    { SA2_ANIM_ITEMBOX_TYPE, 13, 4 }, { SA2_ANIM_ITEMBOX_TYPE, 14, 4 },
    { SA2_ANIM_ITEMBOX_TYPE, 15, 4 }, { SA2_ANIM_ITEMBOX_TYPE, 16, 4 },
    { SA2_ANIM_ITEMBOX_TYPE, 12, 4 },
};

const u16 ItemBox_1UpIcons[5][3] = {
    { SA2_ANIM_ITEMBOX_TYPE, CHARACTER_SONIC, 4 },
    { SA2_ANIM_ITEMBOX_TYPE, CHARACTER_CREAM, 4 },
    { SA2_ANIM_ITEMBOX_TYPE, CHARACTER_TAILS, 4 },
    { SA2_ANIM_ITEMBOX_TYPE, CHARACTER_KNUCKLES, 4 },
    { SA2_ANIM_ITEMBOX_TYPE, CHARACTER_AMY, 4 },
};

const u16 gUnknown_080D51E4[8] = { 5, 13, 4, 13, 3, 13, 6, 13 };

const u16 gUnknown_080D51F4[] = { 8, 9, 10, 11 };
const u8 gUnknown_080D51FC[] = { 1, 5, 10, 30, 50, 0, 0, 0 };

void CreateEntity_ItemBox(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                          u8 spriteY)
{
    struct Task *t;
    Entity_ItemBox *itembox;
    Sprite *s;
    if (gGameMode == GAME_MODE_TIME_ATTACK || gGameMode == GAME_MODE_BOSS_TIME_ATTACK) {
        if (me->index == 0) {
            SET_MAP_ENTITY_INITIALIZED(me);
            return;
        }

        if (me->index == 5) {
            me->index = 7;
        }
    }

    t = TaskCreate(Task_800B704, sizeof(Entity_ItemBox), 0x2000, 0,
                   TaskDestructor_800B80C);
    itembox = TaskGetStructPtr(t);
    itembox->kind = me->index;
    itembox->unk74 = 0;
    itembox->x = TO_WORLD_POS(me->x, spriteRegionX);
    itembox->y = TO_WORLD_POS(me->y, spriteRegionY);
    itembox->base.regionX = spriteRegionX;
    itembox->base.regionY = spriteRegionY;
    itembox->base.me = me;
    itembox->base.spriteX = me->x;
    itembox->base.spriteY = spriteY;

    s = &itembox->s;
    s->unk1A = 0x4C0;
    s->graphics.size = 0;
    s->unk14 = 0;
    s->unk1C = 0;
    s->unk21 = 0xFF;
    s->unk22 = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->unk10 = (SPRITE_FLAG(PRIORITY, 2) | SPRITE_FLAG_MASK_MOSAIC);
    s->graphics.anim = SA2_ANIM_ITEMBOX;
    s->variant = 0;
    s->graphics.dest = VramMalloc(TILE_COUNT__ANIM_ITEMBOX);
    sub_8004558(s);

    s = &itembox->item;
    s->unk1A = 0x500;
    s->graphics.size = 0;
    s->unk14 = 0;
    s->unk1C = 0;
    s->unk21 = -1;
    s->unk22 = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->unk10 = (SPRITE_FLAG(PRIORITY, 2) | SPRITE_FLAG_MASK_MOSAIC);
    s->graphics.dest = VramMalloc(TILE_COUNT__ANIM_ITEMBOX_TYPE);
    sub_800B580(itembox, TRUE);

    SET_MAP_ENTITY_INITIALIZED(me);
}

void sub_800B1AC(Entity_ItemBox *itembox)
{
    if (itembox->unk78 != TRUE || gPlayer.moveState & MOVESTATE_IN_AIR) {
        gPlayer.speedAirY = -Q_24_8(3.0);
        gPlayer.unk64 = 38;
        gPlayer.unk66 = -1;
        gPlayer.transition = PLTRANS_PT5;
    }

    m4aSongNumStart(SE_ITEM_BOX_2);

    CreateDustCloud(itembox->x, itembox->y);

    itembox->frames = 0;

    if (IS_MULTI_PLAYER) {
        struct UNK_3005510 *unk = sub_8019224();
        unk->unk0 = 2;
        unk->unk1 = itembox->base.regionX;
        unk->unk2 = itembox->base.regionY;
        unk->unk3 = itembox->base.spriteY;
    }

    gCurTask->main = Task_800B780;
}

#define ITEMBOX_ADD_NEW_RINGS(oldRingCount, newRingCount)                               \
    {                                                                                   \
        gRingCount = newRingCount;                                                      \
        if (gCurrentLevel != LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53)) {               \
            s32 newLivesCount = Div(gRingCount, 100);                                   \
                                                                                        \
            if (newLivesCount != Div(oldRingCount, 100)                                 \
                && (gGameMode == GAME_MODE_SINGLE_PLAYER)) {                            \
                u32 newLives = gNumLives;                                               \
                if (++newLives > 255) {                                                 \
                    newLives = 255;                                                     \
                }                                                                       \
                gNumLives = newLives;                                                   \
                                                                                        \
                gUnknown_030054A8.unk3 = 16;                                            \
            }                                                                           \
        }                                                                               \
                                                                                        \
        if (gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {                        \
            if (gRingCount > 255) {                                                     \
                gRingCount = 255;                                                       \
            }                                                                           \
        }                                                                               \
                                                                                        \
        m4aSongNumStart(SE_RING_COPY);                                                  \
    }

void ApplyItemboxEffect(Entity_ItemBox *itembox)
{
    s32 oldRingCount;
    u32 newRingCount;
    u16 *rings;

    switch (itembox->kind) {
        case ITEM__ONE_UP: {
            u32 newLives = gNumLives;
            if (++newLives > 255) {
                newLives = 255;
            }
            gNumLives = newLives;

            gUnknown_030054A8.unk3 = 16;
        } break;

        case ITEM__SHIELD: {
            if (!(gPlayer.itemEffect & PLAYER_ITEM_EFFECT__SHIELD_NORMAL)) {
                gPlayer.itemEffect &= ~PLAYER_ITEM_EFFECT__SHIELD_MAGNETIC;
                gPlayer.itemEffect |= PLAYER_ITEM_EFFECT__SHIELD_NORMAL;

                if (!(gPlayer.itemEffect & PLAYER_ITEM_EFFECT__INVINCIBILITY)) {
                    CreateItemTask_Shield_Normal(gPlayer.unk60);
                }
            }

        } break;

        case ITEM__SHIELD_MAGNETIC: {
            if (!(gPlayer.itemEffect & PLAYER_ITEM_EFFECT__SHIELD_MAGNETIC)) {
                gPlayer.itemEffect &= ~PLAYER_ITEM_EFFECT__SHIELD_NORMAL;
                gPlayer.itemEffect |= PLAYER_ITEM_EFFECT__SHIELD_MAGNETIC;

                if (!(gPlayer.itemEffect & PLAYER_ITEM_EFFECT__INVINCIBILITY)) {
                    CreateItemTask_Shield_Magnetic(gPlayer.unk60);
                }
            }

        } break;

        case ITEM__INVINCIBILITY: {
            gPlayer.timerInvincibility = ITEM_DURATION_INVINCIBILITY;

            if (IS_SINGLE_PLAYER
                || !(gPlayer.itemEffect & PLAYER_ITEM_EFFECT__INVINCIBILITY)) {
                gPlayer.itemEffect |= PLAYER_ITEM_EFFECT__INVINCIBILITY;
                CreateItemTask_Invincibility(gPlayer.unk60);
                gUnknown_030054A8.unk2 = 16;
            }
        } break;

        case ITEM__SPEED_UP: {
            gPlayer.itemEffect |= PLAYER_ITEM_EFFECT__SPEED_UP;
            gPlayer.timerSpeedup = ITEM_DURATION_SPEED_UP;

            m4aMPlayTempoControl(&gMPlayInfo_BGM, 0x200);

            if (IS_MULTI_PLAYER) {
                gPlayer.itemEffect &= ~PLAYER_ITEM_EFFECT__10;
            }
        } break;

        case ITEM__RINGS_RANDOM: {
            s32 rnd = gUnknown_080D51FC[(u32)PseudoRandom32() % 5];
            rings = &gRingCount;
            oldRingCount = *rings;
            newRingCount = *rings + rnd;
            ITEMBOX_ADD_NEW_RINGS(oldRingCount, newRingCount);
        } break;

        case ITEM__RINGS_5: {
            rings = &gRingCount;
            oldRingCount = *rings;
            newRingCount = *rings + 5;
            ITEMBOX_ADD_NEW_RINGS(oldRingCount, newRingCount);
        } break;

        case ITEM__RINGS_10: {
            rings = &gRingCount;
            oldRingCount = *rings;
            newRingCount = *rings + 10;
            ITEMBOX_ADD_NEW_RINGS(oldRingCount, newRingCount);
        } break;

        case ITEM__MP_8: {
            s32 smallestMagnitude = -1;
            u8 nearestPlayer = 0;
            u8 playerId;

            // Find the player that's closest to you
            for (playerId = 0; playerId < MULTI_SIO_PLAYERS_MAX
                 && gMultiplayerPlayerTasks[playerId] != NULL;
                 playerId++) {
                struct MultiplayerPlayer *mpp;
                s32 boxToPlayerX, boxToPlayerY;
                s32 boxToPlayerMagnitude;

                // Don't look for your own ID
                u32 sioId = (SIO_MULTI_CNT)->id;
                if (playerId == sioId)
                    continue;

                mpp = TaskGetStructPtr(gMultiplayerPlayerTasks[playerId]);
                boxToPlayerX = SQUARE(Q_24_8_TO_INT(gPlayer.x) - mpp->unk50);
                boxToPlayerY = SQUARE(Q_24_8_TO_INT(gPlayer.y) - mpp->unk52);

                boxToPlayerMagnitude = boxToPlayerX + boxToPlayerY;
                if (smallestMagnitude < boxToPlayerMagnitude) {
                    smallestMagnitude = boxToPlayerMagnitude;
                    nearestPlayer = playerId;
                }
            }

            {
                struct UNK_3005510 *unkPtr = sub_8019224();
                unkPtr->unk0 = 6;
                unkPtr->unk1 = 1;
                unkPtr->unk2 = nearestPlayer;
            }

            m4aSongNumStart(SE_218);
        } break;

        case ITEM__MP_9: {
            struct UNK_3005510 *unkPtr = sub_8019224();
            unkPtr->unk0 = 6;
            unkPtr->unk1 = 0;
            m4aSongNumStart(SE_ITEM_CONFUSION);
        } break;

        case ITEM__MP_10: {
            struct UNK_3005510 *unkPtr = sub_8019224();
            unkPtr->unk0 = 6;
            unkPtr->unk1 = 2;
            m4aSongNumStart(SE_ITEM_CONFUSION);
        } break;

        case ITEM__MP_11: {
            struct UNK_3005510 *unkPtr = sub_8019224();
            unkPtr->unk0 = 6;
            unkPtr->unk1 = 3;
            m4aSongNumStart(SE_219);
        } break;

        case ITEM__MP_12: {
            struct UNK_3005510 *unkPtr = sub_8019224();
            unkPtr->unk0 = 6;
            unkPtr->unk1 = 4;
            m4aSongNumStart(SE_216);
        } break;
    }

    itembox->frames = 0;
    gCurTask->main = Task_800B7D0;
}

void sub_800B580(Entity_ItemBox *itembox, bool32 p1)
{
    switch (gGameMode) {
        case GAME_MODE_SINGLE_PLAYER:
        case GAME_MODE_TIME_ATTACK:
        case GAME_MODE_BOSS_TIME_ATTACK: {
            if (p1) {
                if (itembox->kind == 0) {
                    itembox->item.graphics.anim
                        = ItemBox_1UpIcons[gSelectedCharacter][0];
                    itembox->item.variant = ItemBox_1UpIcons[gSelectedCharacter][1];
                } else {
                    itembox->item.graphics.anim = ItemBox_MysteryIcons[itembox->kind][0];
                    itembox->item.variant = ItemBox_MysteryIcons[itembox->kind][1];
                }

                sub_8004558(&itembox->item);
            }
        } break;

        case GAME_MODE_MULTI_PLAYER:
        case GAME_MODE_TEAM_PLAY: {
            if (p1 || ((gUnknown_03005590 & 0x1F) == 0)) {
                s32 kind = gUnknown_080D51E4[(gUnknown_03005590 >> 5) & 0x7];

                if (kind == 13) {
                    kind = gUnknown_080D51F4[gMultiplayerPseudoRandom & 0x3];

                    if (LEVEL_TO_ZONE(gCurrentLevel) == ZONE_7) {
                        if (kind == 8) {
                            s32 index = ((gMultiplayerPseudoRandom >> 2) % 3) + 1;
                            kind = gUnknown_080D51F4[index];
                        }
                    }
                }
                itembox->kind = kind;

                itembox->item.graphics.anim = ItemBox_MysteryIcons[kind][0];
                itembox->item.variant = ItemBox_MysteryIcons[kind][1];
                sub_8004558(&itembox->item);
            }
        } break;

        case GAME_MODE_MULTI_PLAYER_COLLECT_RINGS: {
            if (p1) {
                itembox->item.graphics.anim = ItemBox_MysteryIcons[itembox->kind][0];
                itembox->item.variant = ItemBox_MysteryIcons[itembox->kind][1];
                sub_8004558(&itembox->item);
            }
        } break;
    }
}

void Task_800B704(void)
{
    Entity_ItemBox *itembox = TaskGetStructPtr(gCurTask);

    if (IS_MULTI_PLAYER && ((s8)itembox->base.me->x) == MAP_ENTITY_STATE_MINUS_THREE) {
        sub_800B828(itembox);
    } else {
        if (sub_800B8F4(itembox)) {
            sub_800B1AC(itembox);
        } else {
            sub_800B580(itembox, FALSE);
        }

        if (sub_800B8AC(itembox)) {
            SET_MAP_ENTITY_NOT_INITIALIZED(itembox->base.me, itembox->base.spriteX);
            TaskDestroy(gCurTask);
        } else {
            sub_800B860(itembox, FALSE);
        }
    }
}

void Task_800B780(void)
{
    Entity_ItemBox *itembox = TaskGetStructPtr(gCurTask);

    // TODO/BUG(?) This should be a pre-increment, not post-increment, right?
    if (itembox->frames++ >= 60)
        ApplyItemboxEffect(itembox);
    else {
        itembox->unk74 += -Q_24_8(1.0);
    }

    sub_800B860(itembox, TRUE);
}

void Task_800B7D0(void)
{
    Entity_ItemBox *itembox = TaskGetStructPtr(gCurTask);

    // TODO/BUG(?) This should be a pre-increment, not post-increment, right?
    if (itembox->frames++ >= 30)
        TaskDestroy(gCurTask);
    else
        sub_800B860(itembox, TRUE);
}

void TaskDestructor_800B80C(struct Task *t)
{
    Entity_ItemBox *itembox = TaskGetStructPtr(t);
    VramFree(itembox->s.graphics.dest);
    VramFree(itembox->item.graphics.dest);
}

void sub_800B828(Entity_ItemBox *itembox)
{
    m4aSongNumStart(SE_ITEM_BOX_2);

    CreateDustCloud(itembox->x, itembox->y);

    itembox->frames = 0;

    gCurTask->main = Task_800B950;
}

void sub_800B860(Entity_ItemBox *itembox, bool32 p1)
{
    itembox->s.x = itembox->x - gCamera.x;
    itembox->s.y = itembox->y - gCamera.y;

    itembox->item.x = itembox->x - gCamera.x;
    itembox->item.y = (Q_24_8_TO_INT(itembox->unk74) + itembox->s.y);

    if (!p1)
        sub_80051E8(&itembox->s);

    sub_80051E8(&itembox->item);
}

bool32 sub_800B8AC(Entity_ItemBox *itembox)
{
    s16 x = itembox->x - gCamera.x;
    s16 y = itembox->y - gCamera.y;

    if (IS_OUT_OF_RANGE_2(x, y, CAM_REGION_WIDTH / 2, CAM_REGION_WIDTH / 2)) {
        return TRUE;
    }

    return FALSE;
}

bool32 sub_800B8F4(Entity_ItemBox *itembox)
{
    if (PLAYER_IS_ALIVE) {
        Sprite *s = &itembox->s;
        u32 res = sub_800C944(s, itembox->x, itembox->y);

        if (res != 0) {
            itembox->unk78 = 1;

            return itembox->unk78;
        } else {
            if (!sub_800C204(s, itembox->x, itembox->y, 0, &gPlayer, 0)) {
            sub_800B8F4_Ret0:
                return FALSE;
            } else {
                itembox->unk78 = 0;

                return TRUE;
            }
        }
    } else {
        goto sub_800B8F4_Ret0;
    }
}

void Task_800B950(void)
{
    Entity_ItemBox *itembox = TaskGetStructPtr(gCurTask);

    // TODO/BUG(?) This should be a pre-increment, not post-increment, right?
    if (itembox->frames++ >= 60) {
        sub_800B9A0(itembox);
    } else {
        itembox->unk74 += -Q_24_8(1.0);
    }

    sub_800B860(itembox, TRUE);
}

void sub_800B9A0(Entity_ItemBox *itembox)
{
    itembox->frames = 0;
    gCurTask->main = Task_800B7D0;
}
