#include "global.h"
#include "core.h"
#include "malloc_vram.h"
#include "sprite.h"
#include "task.h"
#include "trig.h"
#include "lib/m4a/m4a.h"

#include "game/sa1_sa2_shared/collision.h"
#include "game/sa1_sa2_shared/dust_cloud.h"

#include "game/entity.h"
#include "game/stage/item_tasks.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"

#include "game/multiplayer/multiplayer_event_mgr.h"
#include "game/multiplayer/mp_player.h"

#include "constants/animations.h"
#include "constants/char_states.h"
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
    /* 0x74 */ s16 iconOffset;
    /* 0x76 */ u8 kind;
    /* 0x77 */ u8 frames;
    /* 0x78 */ bool8 noPlayerBreakRecoil;
} Entity_ItemBox; /* size: 0x7C */

void BreakItemBox(Entity_ItemBox *);
void InitItemBoxGraphics(Entity_ItemBox *, bool32);
void DrawItemBox(Entity_ItemBox *, bool32);
void Task_ItemBoxMain(void);
void Task_ItemBoxIconMain_Rising(void);
void Task_ItemBoxIconMain_Idle(void);
void TaskDestructor_ItemBox(struct Task *);
void MultiplayerItemBoxBreak(Entity_ItemBox *);
bool32 CheckItemBoxOutOfBounds(Entity_ItemBox *);
bool32 CheckItemBoxPlayerCollision(Entity_ItemBox *);
void Task_ItemBoxIconMain_Rise_MP(void);
void FinishItemBoxRise_MP(Entity_ItemBox *);

const u16 ItemBox_MysteryIcons[13][3] = {
    [ITEM__ONE_UP] = { SA2_ANIM_ITEMBOX_TYPE, 0, 4 },          [ITEM__SHIELD] = { SA2_ANIM_ITEMBOX_TYPE, 5, 4 },
    [ITEM__SHIELD_MAGNETIC] = { SA2_ANIM_ITEMBOX_TYPE, 6, 4 }, [ITEM__INVINCIBILITY] = { SA2_ANIM_ITEMBOX_TYPE, 7, 4 },
    [ITEM__SPEED_UP] = { SA2_ANIM_ITEMBOX_TYPE, 8, 4 },        [ITEM__RINGS_RANDOM] = { SA2_ANIM_ITEMBOX_TYPE, 9, 4 },
    [ITEM__RINGS_5] = { SA2_ANIM_ITEMBOX_TYPE, 10, 4 },        [ITEM__RINGS_10] = { SA2_ANIM_ITEMBOX_TYPE, 11, 4 },
    [ITEM__MP_SWAP] = { SA2_ANIM_ITEMBOX_TYPE, 13, 4 },        [ITEM__MP_CONFUSION] = { SA2_ANIM_ITEMBOX_TYPE, 14, 4 },
    [ITEM__MP_SLOWDOWN] = { SA2_ANIM_ITEMBOX_TYPE, 15, 4 },    [ITEM__MP_ATTACK] = { SA2_ANIM_ITEMBOX_TYPE, 16, 4 },
    [ITEM__MP_ATTACK_2] = { SA2_ANIM_ITEMBOX_TYPE, 12, 4 },
};

const u16 ItemBox_1UpIcons[5][3] = {
    { SA2_ANIM_ITEMBOX_TYPE, CHARACTER_SONIC, 4 }, { SA2_ANIM_ITEMBOX_TYPE, CHARACTER_CREAM, 4 },
    { SA2_ANIM_ITEMBOX_TYPE, CHARACTER_TAILS, 4 }, { SA2_ANIM_ITEMBOX_TYPE, CHARACTER_KNUCKLES, 4 },
    { SA2_ANIM_ITEMBOX_TYPE, CHARACTER_AMY, 4 },
};

const u16 ItemBox_randTypeTable[8] = { ITEM__RINGS_RANDOM,  ITEM__MP_RANDOM, ITEM__SPEED_UP, ITEM__MP_RANDOM,
                                       ITEM__INVINCIBILITY, ITEM__MP_RANDOM, ITEM__RINGS_5,  ITEM__MP_RANDOM };

const u16 ItemBox_subRandTypeTable[] = { ITEM__MP_SWAP, ITEM__MP_CONFUSION, ITEM__MP_SLOWDOWN, ITEM__MP_ATTACK };
#if (GAME == GAME_SA1)
const u8 ItemBox_ringAmountTable[] = { 1, 5, 10, 20, 30, 40 };
#elif (GAME == GAME_SA2)
const u8 ItemBox_ringAmountTable[] = { 1, 5, 10, 30, 50 };
#endif

void CreateEntity_ItemBox(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    struct Task *t;
    Entity_ItemBox *itembox;
    Sprite *s;
    if (gGameMode == GAME_MODE_TIME_ATTACK || gGameMode == GAME_MODE_BOSS_TIME_ATTACK) {
        if (me->index == ITEM__ONE_UP) {
            SET_MAP_ENTITY_INITIALIZED(me);
            return;
        }

        if (me->index == ITEM__RINGS_RANDOM) {
            me->index = ITEM__RINGS_10;
        }
    }

    t = TaskCreate(Task_ItemBoxMain, sizeof(Entity_ItemBox), 0x2000, 0, TaskDestructor_ItemBox);
    itembox = TASK_DATA(t);
    itembox->kind = me->index;
    itembox->iconOffset = 0;
    itembox->x = TO_WORLD_POS(me->x, spriteRegionX);
    itembox->y = TO_WORLD_POS(me->y, spriteRegionY);
    itembox->base.regionX = spriteRegionX;
    itembox->base.regionY = spriteRegionY;
    itembox->base.me = me;
    itembox->base.spriteX = me->x;
    itembox->base.id = spriteY;

    s = &itembox->s;
    s->oamFlags = SPRITE_OAM_ORDER(19);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = (SPRITE_FLAG(PRIORITY, 2) | SPRITE_FLAG_MASK_MOSAIC);
    s->graphics.anim = SA2_ANIM_ITEMBOX;
    s->variant = 0;
    s->graphics.dest = VramMalloc(TILE_COUNT__ANIM_ITEMBOX);
    UpdateSpriteAnimation(s);

    s = &itembox->item;
    s->oamFlags = SPRITE_OAM_ORDER(20);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = (SPRITE_FLAG(PRIORITY, 2) | SPRITE_FLAG_MASK_MOSAIC);
    s->graphics.dest = VramMalloc(TILE_COUNT__ANIM_ITEMBOX_TYPE);
    InitItemBoxGraphics(itembox, TRUE);

    SET_MAP_ENTITY_INITIALIZED(me);
}

void BreakItemBox(Entity_ItemBox *itembox)
{
    if (itembox->noPlayerBreakRecoil != TRUE || gPlayer.moveState & MOVESTATE_IN_AIR) {
        gPlayer.qSpeedAirY = -Q(3.0);
        gPlayer.charState = CHARSTATE_SPRING_B;
        gPlayer.prevCharState = CHARSTATE_INVALID;
        gPlayer.transition = PLTRANS_UNCURL;
    }

    m4aSongNumStart(SE_ITEM_BOX_2);

    CreateDustCloud(itembox->x, itembox->y);

    itembox->frames = 0;

    if (IS_MULTI_PLAYER) {
        RoomEvent_ItemBoxBreak *roomEvent = CreateRoomEvent();
        roomEvent->type = ROOMEVENT_TYPE_ITEMBOX_BREAK;
        roomEvent->x = itembox->base.regionX;
        roomEvent->y = itembox->base.regionY;
        roomEvent->id = itembox->base.id;
    }

    gCurTask->main = Task_ItemBoxIconMain_Rising;
}

#define ITEMBOX_ADD_NEW_RINGS(oldRingCount, newRingCount)                                                                                  \
    {                                                                                                                                      \
        gRingCount = newRingCount;                                                                                                         \
        if (gCurrentLevel != LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53)) {                                                                  \
            s32 newLivesCount = Div(gRingCount, 100);                                                                                      \
                                                                                                                                           \
            if (newLivesCount != Div(oldRingCount, 100) && (gGameMode == GAME_MODE_SINGLE_PLAYER)) {                                       \
                u32 newLives = gNumLives;                                                                                                  \
                if (++newLives > 255) {                                                                                                    \
                    newLives = 255;                                                                                                        \
                }                                                                                                                          \
                gNumLives = newLives;                                                                                                      \
                                                                                                                                           \
                gMusicManagerState.unk3 = 16;                                                                                              \
            }                                                                                                                              \
        }                                                                                                                                  \
                                                                                                                                           \
        if (gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {                                                                           \
            if (gRingCount > 255) {                                                                                                        \
                gRingCount = 255;                                                                                                          \
            }                                                                                                                              \
        }                                                                                                                                  \
                                                                                                                                           \
        m4aSongNumStart(SE_RING_COPY);                                                                                                     \
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

            gMusicManagerState.unk3 = 16;
        } break;

        case ITEM__SHIELD: {
            if (!(gPlayer.itemEffect & PLAYER_ITEM_EFFECT__SHIELD_NORMAL)) {
                gPlayer.itemEffect &= ~PLAYER_ITEM_EFFECT__SHIELD_MAGNETIC;
                gPlayer.itemEffect |= PLAYER_ITEM_EFFECT__SHIELD_NORMAL;

                if (!(gPlayer.itemEffect & PLAYER_ITEM_EFFECT__INVINCIBILITY)) {
                    CreateItemTask_Shield_Normal(gPlayer.playerID);
                }
            }

        } break;

        case ITEM__SHIELD_MAGNETIC: {
            if (!(gPlayer.itemEffect & PLAYER_ITEM_EFFECT__SHIELD_MAGNETIC)) {
                gPlayer.itemEffect &= ~PLAYER_ITEM_EFFECT__SHIELD_NORMAL;
                gPlayer.itemEffect |= PLAYER_ITEM_EFFECT__SHIELD_MAGNETIC;

                if (!(gPlayer.itemEffect & PLAYER_ITEM_EFFECT__INVINCIBILITY)) {
                    CreateItemTask_Shield_Magnetic(gPlayer.playerID);
                }
            }

        } break;

        case ITEM__INVINCIBILITY: {
            gPlayer.timerInvincibility = ITEM_DURATION_INVINCIBILITY;

            if (IS_SINGLE_PLAYER || !(gPlayer.itemEffect & PLAYER_ITEM_EFFECT__INVINCIBILITY)) {
                gPlayer.itemEffect |= PLAYER_ITEM_EFFECT__INVINCIBILITY;
                CreateItemTask_Invincibility(gPlayer.playerID);
                gMusicManagerState.unk2 = 16;
            }
        } break;

        case ITEM__SPEED_UP: {
            gPlayer.itemEffect |= PLAYER_ITEM_EFFECT__SPEED_UP;
            gPlayer.timerSpeedup = ITEM_DURATION_SPEED_UP;

            m4aMPlayTempoControl(&gMPlayInfo_BGM, 0x200);

            if (IS_MULTI_PLAYER) {
                gPlayer.itemEffect &= ~PLAYER_ITEM_EFFECT__MP_SLOW_DOWN;
            }
        } break;

        case ITEM__RINGS_RANDOM: {
            s32 rnd = ItemBox_ringAmountTable[(u32)PseudoRandom32() % ARRAY_COUNT(ItemBox_ringAmountTable)];
#if TAS_TESTING && TAS_TESTING_WIDESCREEN_HACK && DISPLAY_WIDTH > 240
            // There are points in the game where the TAS depends on the RNG
            // giving specific values. Because widescreen runs different code
            // to the native resolution the RNG end up being different here
            // so we force the values we expect
            if (gCurrentLevel == LEVEL_INDEX(ZONE_3, ACT_2)) {
                if (itembox->base.regionX == 65) {
                    rnd = 50;
                } else {
                    rnd = 1;
                }
            } else if (gCurrentLevel == LEVEL_INDEX(ZONE_5, ACT_2)) {
                rnd = 10;
            }
#endif
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

        case ITEM__MP_SWAP: {
            s32 smallestMagnitude = -1;
            u8 nearestPlayer = 0;
            u8 playerId;

            // Find the player that's closest to you
            for (playerId = 0; playerId < MULTI_SIO_PLAYERS_MAX && gMultiplayerPlayerTasks[playerId] != NULL; playerId++) {
                MultiplayerPlayer *mpp;
                s32 boxToPlayerX, boxToPlayerY;
                s32 boxToPlayerMagnitude;

                // Don't look for your own ID
                u32 sioId = (SIO_MULTI_CNT)->id;
                if (playerId == sioId)
                    continue;

                mpp = TASK_DATA(gMultiplayerPlayerTasks[playerId]);
                boxToPlayerX = SQUARE(I(gPlayer.qWorldX) - mpp->pos.x);
                boxToPlayerY = SQUARE(I(gPlayer.qWorldY) - mpp->pos.y);

                boxToPlayerMagnitude = boxToPlayerX + boxToPlayerY;
                if (smallestMagnitude < boxToPlayerMagnitude) {
                    smallestMagnitude = boxToPlayerMagnitude;
                    nearestPlayer = playerId;
                }
            }

            {
                RoomEvent_ItemEffect *roomEvent = CreateRoomEvent();
                roomEvent->type = ROOMEVENT_TYPE_ITEMEFFECT_APPLIED;
                roomEvent->effect = 1;
                roomEvent->targetPlayer = nearestPlayer;
            }

            m4aSongNumStart(SE_218);
        } break;

        case ITEM__MP_CONFUSION: {
            RoomEvent_ItemEffect *roomEvent = CreateRoomEvent();
            roomEvent->type = ROOMEVENT_TYPE_ITEMEFFECT_APPLIED;
            roomEvent->effect = 0;
            m4aSongNumStart(SE_ITEM_CONFUSION);
        } break;

        case ITEM__MP_SLOWDOWN: {
            RoomEvent_ItemEffect *roomEvent = CreateRoomEvent();
            roomEvent->type = ROOMEVENT_TYPE_ITEMEFFECT_APPLIED;
            roomEvent->effect = 2;
            m4aSongNumStart(SE_ITEM_CONFUSION);
        } break;

        case ITEM__MP_ATTACK: {
            RoomEvent_ItemEffect *roomEvent = CreateRoomEvent();
            roomEvent->type = ROOMEVENT_TYPE_ITEMEFFECT_APPLIED;
            roomEvent->effect = 3;
            m4aSongNumStart(SE_219);
        } break;

        case ITEM__MP_ATTACK_2: {
            RoomEvent_ItemEffect *roomEvent = CreateRoomEvent();
            roomEvent->type = ROOMEVENT_TYPE_ITEMEFFECT_APPLIED;
            roomEvent->effect = 4;
            m4aSongNumStart(SE_216);
        } break;
    }

    itembox->frames = 0;
    gCurTask->main = Task_ItemBoxIconMain_Idle;
}

void InitItemBoxGraphics(Entity_ItemBox *itembox, bool32 firstLoad)
{
    switch (gGameMode) {
        case GAME_MODE_SINGLE_PLAYER:
        case GAME_MODE_TIME_ATTACK:
        case GAME_MODE_BOSS_TIME_ATTACK: {
            if (firstLoad) {
                if (itembox->kind == ITEM__ONE_UP) {
                    itembox->item.graphics.anim = ItemBox_1UpIcons[gSelectedCharacter][0];
                    itembox->item.variant = ItemBox_1UpIcons[gSelectedCharacter][1];
                } else {
                    itembox->item.graphics.anim = ItemBox_MysteryIcons[itembox->kind][0];
                    itembox->item.variant = ItemBox_MysteryIcons[itembox->kind][1];
                }

                UpdateSpriteAnimation(&itembox->item);
            }
        } break;

        case GAME_MODE_MULTI_PLAYER:
        case GAME_MODE_TEAM_PLAY: {
            if (firstLoad || ((gStageTime & 0x1F) == 0)) {
                s32 kind = ItemBox_randTypeTable[(gStageTime >> 5) & 0x7];

                if (kind == ITEM__MP_RANDOM) {
                    kind = ItemBox_subRandTypeTable[gMultiplayerPseudoRandom & 0x3];

                    if (LEVEL_TO_ZONE(gCurrentLevel) == ZONE_7) {
                        if (kind == ITEM__MP_SWAP) {
                            s32 index = ((gMultiplayerPseudoRandom >> 2) % 3) + 1;
                            kind = ItemBox_subRandTypeTable[index];
                        }
                    }
                }
                itembox->kind = kind;

                itembox->item.graphics.anim = ItemBox_MysteryIcons[kind][0];
                itembox->item.variant = ItemBox_MysteryIcons[kind][1];
                UpdateSpriteAnimation(&itembox->item);
            }
        } break;

        case GAME_MODE_MULTI_PLAYER_COLLECT_RINGS: {
            if (firstLoad) {
                itembox->item.graphics.anim = ItemBox_MysteryIcons[itembox->kind][0];
                itembox->item.variant = ItemBox_MysteryIcons[itembox->kind][1];
                UpdateSpriteAnimation(&itembox->item);
            }
        } break;
    }
}

void Task_ItemBoxMain(void)
{
    Entity_ItemBox *itembox = TASK_DATA(gCurTask);

    if (IS_MULTI_PLAYER && ((s8)itembox->base.me->x) == MAP_ENTITY_STATE_MINUS_THREE) {
        MultiplayerItemBoxBreak(itembox);
    } else {
        if (CheckItemBoxPlayerCollision(itembox)) {
            BreakItemBox(itembox);
        } else {
            InitItemBoxGraphics(itembox, FALSE);
        }

        if (CheckItemBoxOutOfBounds(itembox)) {
            SET_MAP_ENTITY_NOT_INITIALIZED(itembox->base.me, itembox->base.spriteX);
            TaskDestroy(gCurTask);
        } else {
            DrawItemBox(itembox, FALSE);
        }
    }
}

void Task_ItemBoxIconMain_Rising(void)
{
    Entity_ItemBox *itembox = TASK_DATA(gCurTask);

    // TODO/BUG(?) This should be a pre-increment, not post-increment, right?
    if (itembox->frames++ >= 60)
        ApplyItemboxEffect(itembox);
    else {
        itembox->iconOffset += -Q(1.0);
    }

    DrawItemBox(itembox, TRUE);
}

void Task_ItemBoxIconMain_Idle(void)
{
    Entity_ItemBox *itembox = TASK_DATA(gCurTask);

    // TODO/BUG(?) This should be a pre-increment, not post-increment, right?
    if (itembox->frames++ >= 30)
        TaskDestroy(gCurTask);
    else
        DrawItemBox(itembox, TRUE);
}

void TaskDestructor_ItemBox(struct Task *t)
{
    Entity_ItemBox *itembox = TASK_DATA(t);
    VramFree(itembox->s.graphics.dest);
    VramFree(itembox->item.graphics.dest);
}

void MultiplayerItemBoxBreak(Entity_ItemBox *itembox)
{
    m4aSongNumStart(SE_ITEM_BOX_2);

    CreateDustCloud(itembox->x, itembox->y);

    itembox->frames = 0;

    gCurTask->main = Task_ItemBoxIconMain_Rise_MP;
}

void DrawItemBox(Entity_ItemBox *itembox, bool32 disableBox)
{
    itembox->s.x = itembox->x - gCamera.x;
    itembox->s.y = itembox->y - gCamera.y;

    itembox->item.x = itembox->x - gCamera.x;
    itembox->item.y = (I(itembox->iconOffset) + itembox->s.y);

    if (!disableBox)
        DisplaySprite(&itembox->s);

    DisplaySprite(&itembox->item);
}

bool32 CheckItemBoxOutOfBounds(Entity_ItemBox *itembox)
{
    s16 x = itembox->x - gCamera.x;
    s16 y = itembox->y - gCamera.y;

    if (IS_OUT_OF_RANGE_2(x, y, CAM_REGION_WIDTH / 2, CAM_REGION_WIDTH / 2)) {
        return TRUE;
    }

    return FALSE;
}

bool32 CheckItemBoxPlayerCollision(Entity_ItemBox *itembox)
{
    if (PLAYER_IS_ALIVE) {
        Sprite *s = &itembox->s;
        u32 res = Player_ItemBoxCollision(s, itembox->x, itembox->y);

        if (res != 0) {
            itembox->noPlayerBreakRecoil = TRUE;

            return itembox->noPlayerBreakRecoil;
        } else {
            if (!Player_HitboxCollision(s, itembox->x, itembox->y, 0, &gPlayer, 0)) {
            CheckItemBoxPlayerCollision_Ret0:
                return FALSE;
            } else {
                itembox->noPlayerBreakRecoil = FALSE;

                return TRUE;
            }
        }
    } else {
        goto CheckItemBoxPlayerCollision_Ret0;
    }
}

void Task_ItemBoxIconMain_Rise_MP(void)
{
    Entity_ItemBox *itembox = TASK_DATA(gCurTask);

    // TODO/BUG(?) This should be a pre-increment, not post-increment, right?
    if (itembox->frames++ >= 60) {
        FinishItemBoxRise_MP(itembox);
    } else {
        itembox->iconOffset += -Q(1.0);
    }

    DrawItemBox(itembox, TRUE);
}

void FinishItemBoxRise_MP(Entity_ItemBox *itembox)
{
    itembox->frames = 0;
    gCurTask->main = Task_ItemBoxIconMain_Idle;
}
