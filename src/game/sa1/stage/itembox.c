#include "global.h"
#include "core.h"
#include "malloc_vram.h"
#include "sprite.h"
#include "task.h"
#include "trig.h"
#include "lib/m4a/m4a.h"

#include "game/shared/stage/collision.h"
#include "game/shared/stage/dust_cloud.h"

#include "game/shared/stage/entity.h"
#include "game/shared/parameters/characters.h"
#include "game/shared/stage/item_tasks.h"
#include "game/shared/stage/player.h"
#include "game/shared/stage/camera.h"
#include "game/shared/stage/terrain_collision.h"

#include "game/shared/stage/mp_event_mgr.h"
#include "game/shared/stage/mp_player.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/char_states.h"
#include "constants/sa1/items.h"
#include "constants/sa1/player_transitions.h"
#include "constants/sa1/songs.h"
#include "constants/zones.h"

#define ITEM_DURATION_INVINCIBILITY TIME(0, 20)
#define ITEM_DURATION_SPEED_UP      TIME(0, 20)

typedef struct {
    /* 0x00|0x00 */ SpriteBase base;
    /* 0x0C|0x0C */ Sprite s;
    /* 0x3C|0x3C */ Sprite sprItem;
#if (GAME == GAME_SA1)
    /* 0x6C|xxxx */ s16 iconOffset;
    /* 0x6E|xxxx */ s16 qUnk6E;
    /* 0x70|xxxx */ u8 unk70; // frames, actually?
    /* 0x71|0x76 */ u8 kind;
    /* 0x72|0x77 */ u8 frames;
#elif (GAME == GAME_SA2)
    /* xxxx|0x6C */ CamCoord qX;
    /* xxxx|0x70 */ CamCoord qY;
    /* 0x70|0x74 */ s16 iconOffset;
    /* 0x71|0x76 */ u8 kind;
    /* 0x72|0x77 */ u8 frames;
    /* 0x78 */ bool8 noPlayerBreakRecoil;
#endif
} ItemBox; /* size: 0x7C */

void Task_ItemBoxMain(void);
void Task_Itembox2(void);
void Task_Itembox3(void);
void Task_Itembox4(void);
void TaskDestructor_ItemBox(Task *t);
#if (GAME == GAME_SA1)
const s8 ItemBox_RingAmountTable[] = { 1, 5, 10, 20, 30, 40 };
#elif (GAME == GAME_SA2)
const u8 ItemBox_RingAmountTable[] = { 1, 5, 10, 30, 50 };
#endif

extern u8 gUnknown_080BB4D8[ITEM__COUNT];
extern u8 gUnknown_080BB4E8[8];
extern u8 gUnknown_080BB4F0[4];

#if (GAME == GAME_SA1)
void CreateEntity_ItemBox(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t;
    ItemBox *itembox;
    Sprite *s, *sTemp;

    if ((gGameMode == GAME_MODE_TIME_ATTACK) && (me->index == ITEM__ONE_UP)) {
        // Don't spawn 1-UPs in Time Attack mode
        SET_MAP_ENTITY_INITIALIZED(me);
        return;
    }

    t = TaskCreate(Task_ItemBoxMain, sizeof(ItemBox), 0x2000, 0, TaskDestructor_ItemBox);
    itembox = TASK_DATA(t);
    s = &itembox->s;

    itembox->base.regionX = regionX;
    itembox->base.regionY = regionY;
    itembox->base.me = me;
    itembox->base.meX = me->x;
    itembox->base.id = id;

    itembox->qUnk6E = Q(0);
    itembox->iconOffset = 0;
    itembox->unk70 = 0;
    itembox->kind = me->index;

    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);

    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = ALLOC_TILES(SA1_ANIM_ITEMBOX);
    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_ITEMBOX;
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
    UpdateSpriteAnimation(s);

    sTemp = s;
    s = &itembox->sprItem;
    DmaCopy16(3, sTemp, s, sizeof(*s));
    s->graphics.dest = ALLOC_TILES(SA1_ANIM_ITEMBOX_TYPE);
    s->graphics.anim = SA1_ANIM_ITEMBOX_TYPE;
    s->variant = gUnknown_080BB4D8[itembox->kind];

    if (itembox->kind == ITEM__ONE_UP) {
        s->variant += gSelectedCharacter;
    }

    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->palId = 0;
    s->oamFlags = SPRITE_OAM_ORDER(19);
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
    UpdateSpriteAnimation(s);
}

// (93.66%) https://decomp.me/scratch/VxlQa
NONMATCH("asm/non_matching/game/shared/stage/item_box__Task_ItemBoxMain.inc", void Task_ItemBoxMain(void))
{
    bool32 sl = FALSE;
    ItemBox *itembox = TASK_DATA(gCurTask);
    Sprite *s = &itembox->s;
    MapEntity *me = itembox->base.me;

    s16 worldX = TO_WORLD_POS(itembox->base.meX, itembox->base.regionX);
    s16 worldY = TO_WORLD_POS(itembox->base.me->y, itembox->base.regionY);
    s32 screenX, screenY;

    if (IS_MULTI_PLAYER && ((s8)me->x == MAP_ENTITY_STATE_MINUS_THREE)) {
        m4aSongNumStart(SE_ITEM_BOX_2);

        CreateDustCloud(worldX, worldY + itembox->iconOffset);

        gCurTask->main = Task_Itembox3;

        itembox->unk70 = sl;

        if (gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ) {
            if (gPlayer.stoodObj == s) {
                gPlayer.moveState &= ~MOVESTATE_STOOD_ON_OBJ;
                gPlayer.moveState |= MOVESTATE_IN_AIR;
            }
        }
    } else {
        s32 res;
        if (itembox->unk70 != 0) {
            // _0801E890

            itembox->iconOffset += I(itembox->qUnk6E);
            itembox->qUnk6E += Q(40. / 256.);

            res = SA2_LABEL(sub_801F07C)(worldY + itembox->iconOffset, worldX, 1, 8, NULL, SA2_LABEL(sub_801EE64));
            if (res < 0) {
                itembox->iconOffset += res;
                itembox->unk70 = 0;
            }
        }
        // _0801E8F0

        s->x = worldX - gCamera.x;
        s->y = worldY - gCamera.y + itembox->iconOffset;

        if (IS_TEAM_PLAY) {
            u8 i;
            for (i = 0; (i < MULTI_SIO_PLAYERS_MAX) && (gMultiplayerPlayerTasks[i] != NULL); i++) {
                if (i != SIO_MULTI_CNT->id) {
                    MultiplayerPlayer *mpp = TASK_DATA(gMultiplayerPlayerTasks[i]);
                    if (mpp->unk5C & 0x4) {
                        sl = TRUE;
                    }
                }
            }
        }
        // _0801E95E

        if (!(gPlayer.moveState & MOVESTATE_IA_OVERRIDE) || sl) {
            // _0801E974

            if (gNumSingleplayerCharacters > 1) {
                Coll_Player_Platform(s, worldX, worldY + itembox->iconOffset, &gPartner);
            }
            // _0801E998

            if (((gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ) && (gPlayer.stoodObj == s))
                || (gPlayer.spriteInfoBody->s.hitboxes[0].index == HITBOX_STATE_INACTIVE)) {
                // _0801E9B6
                res = Coll_Player_Platform(s, worldX, worldY + itembox->iconOffset, &gPlayer);
            } else {
                // _0801E9FC
                res = Coll_Player_Itembox(s, worldX, worldY + itembox->iconOffset, &gPlayer);
            }

            // _0801EA20
            if (res & 0x10000) {
                itembox->qUnk6E = -Q(1.0);
                itembox->unk70 = -1;
            } else if (res & 0x28) {
                // _0801EA32 + 0x8

                if ((gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ) && (gPlayer.stoodObj == s)) {
                    gPlayer.moveState &= ~MOVESTATE_STOOD_ON_OBJ;
                    gPlayer.moveState &= ~MOVESTATE_20;
                    gPlayer.moveState |= MOVESTATE_IN_AIR;
                }

                if ((gPartner.moveState & MOVESTATE_STOOD_ON_OBJ) && (gPartner.stoodObj == s)) {
                    gPartner.moveState &= ~MOVESTATE_STOOD_ON_OBJ;
                    gPartner.moveState &= ~MOVESTATE_20;
                    gPartner.moveState |= MOVESTATE_IN_AIR;
                }

                m4aSongNumStart(SE_ITEM_BOX_2);
                CreateDustCloud(worldX, worldY + itembox->iconOffset);

                gCurTask->main = Task_Itembox2;
                itembox->unk70 = 0;

                if (IS_MULTI_PLAYER) {
                    RoomEvent_ItemBoxBreak *event = CreateRoomEvent();
                    event->type = ROOMEVENT_TYPE_ITEMBOX_BREAK;
                    event->x = itembox->base.regionX;
                    event->y = itembox->base.regionY;
                    event->id = itembox->base.id;
                }

                return;
            }
        }
        // _0801EADC

        if (IS_OUT_OF_DISPLAY_RANGE(worldX, worldY) && IS_OUT_OF_CAM_RANGE(s->x, s->y + itembox->iconOffset)) {
            SET_MAP_ENTITY_NOT_INITIALIZED(me, itembox->base.meX);
            TaskDestroy(gCurTask);
            return;
        }
        // _0801EB54

        DisplaySprite(s);

        s = &itembox->sprItem;

        if (gGameMode == GAME_MODE_RACE || gGameMode == GAME_MODE_MULTI_PLAYER) {
            if ((gStageTime >> 5) & 0x1) {
                u32 kind = gUnknown_080BB4F0[gMultiplayerPseudoRandom % ARRAY_COUNT(gUnknown_080BB4F0)];
                itembox->kind = kind;

                if ((LEVEL_TO_ZONE(gCurrentLevel) == ZONE_6) && (kind == ITEM__MP_8)) {
                    itembox->kind = ITEM__MP_10;
                }
            } else {
                // _0801EBBC
                itembox->kind = gUnknown_080BB4E8[((gStageTime >> 6) + me->index) % ARRAY_COUNT(gUnknown_080BB4E8)];
            }
            // _0801EBD6

            s->variant = gUnknown_080BB4D8[itembox->kind];

            UpdateSpriteAnimation(s);
        }
        // _0801EBEA

        s->x = worldX - gCamera.x;
        s->y = worldY - gCamera.y + itembox->iconOffset;
        DisplaySprite(s);
    }
}
END_NONMATCH

void Task_Itembox2(void)
{
    ItemBox *itembox = TASK_DATA(gCurTask);
    MapEntity *me = itembox->base.me;
    Sprite *s;
    s16 worldX, worldY;
    RoomEvent_ItemEffect *roomEvent;

    itembox->iconOffset--;
    itembox->unk70++;

    worldX = TO_WORLD_POS(itembox->base.meX, itembox->base.regionX);
    worldY = TO_WORLD_POS(me->y, itembox->base.regionY) + itembox->iconOffset;

    if (itembox->unk70 >= 60) {
        switch (itembox->kind) {
            case ITEM__ONE_UP: {
                gNumLives++;

                gMusicManagerState.unk3 = 0x10 | 0x0;
            } break;

            case ITEM__SHIELD: {
                gPlayer.itemEffect |= PLAYER_ITEM_EFFECT__SHIELD_NORMAL;
                gPlayer.itemEffect &= ~PLAYER_ITEM_EFFECT__SHIELD_MAGNETIC;
                CreateItemTask_Shield_Normal(gPlayer.playerID);
            } break;

            case ITEM__SHIELD_MAGNETIC: {
                gPlayer.itemEffect &= ~PLAYER_ITEM_EFFECT__SHIELD_NORMAL;
                gPlayer.itemEffect |= PLAYER_ITEM_EFFECT__SHIELD_MAGNETIC;
                CreateItemTask_Shield_Magnetic(gPlayer.playerID);
            } break;

            case ITEM__INVINCIBILITY: {
                if (!(gPlayer.itemEffect & PLAYER_ITEM_EFFECT__INVINCIBILITY)) {
                    CreateItemTask_Invincibility(gPlayer.playerID);
                    gMusicManagerState.unk2 = 0x10 | 0x0;
                }

                gPlayer.itemEffect |= PLAYER_ITEM_EFFECT__INVINCIBILITY;
                gPlayer.timerInvincibility = PLAYER_INVINCIBLE_DURATION;
            } break;

            case ITEM__SPEED_UP: {
                gPlayer.itemEffect |= PLAYER_ITEM_EFFECT__SPEED_UP;
                gPlayer.timerSpeedup = PLAYER_SPEED_UP_DURATION;

                m4aMPlayTempoControl(&gMPlayInfo_BGM, PLAYER_SPEED_UP_MUSIC_TEMPO);

                if (IS_MULTI_PLAYER) {
                    gPlayer.itemEffect &= ~PLAYER_ITEM_EFFECT__MP_SLOW_DOWN;
                }
            } break;

            case ITEM__RINGS_RANDOM: {
                s16 rings = ItemBox_RingAmountTable[(u32)PseudoRandom32() % ARRAY_COUNT(ItemBox_RingAmountTable)];
                INCREMENT_RINGS(rings);

                if (gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
                    if (gRingCount > 255) {
                        gRingCount = 255;
                    }
                }

                m4aSongNumStart(SE_RING_COPY);
            } break;

            case ITEM__RINGS_5: {
                INCREMENT_RINGS(5);

                if (gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
                    if (gRingCount > 255) {
                        gRingCount = 255;
                    }
                }

                m4aSongNumStart(SE_RING_COPY);
            } break;

            case ITEM__RINGS_10: {
                INCREMENT_RINGS(10);

                if (gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
                    if (gRingCount > 255) {
                        gRingCount = 255;
                    }
                }

                m4aSongNumStart(SE_RING_COPY);
            } break;

            case ITEM__MP_8: {
                u32 nearestPlayer = 0;
                u32 smallestMagnitude = 0;
                u32 playerId;
                Task **mppTasks;

                // Find the player that's closest to you
                for (playerId = 0, mppTasks = gMultiplayerPlayerTasks; playerId < MULTI_SIO_PLAYERS_MAX && mppTasks[playerId] != NULL;
                     playerId++) {
                    MultiplayerPlayer *mpp;
                    s32 boxToPlayerX, boxToPlayerY;
                    s32 boxToPlayerMagnitude;

                    // Don't look for your own ID
                    u32 sioId = (SIO_MULTI_CNT)->id;
                    if (playerId == sioId)
                        continue;

                    mpp = TASK_DATA(mppTasks[playerId]);
                    boxToPlayerX = SQUARE(mpp->pos.x - I(gPlayer.qWorldX));
                    boxToPlayerY = SQUARE(mpp->pos.y - I(gPlayer.qWorldY));

                    boxToPlayerMagnitude = boxToPlayerX + boxToPlayerY;
                    if (smallestMagnitude < boxToPlayerMagnitude) {
                        smallestMagnitude = boxToPlayerMagnitude;
                        nearestPlayer = playerId;
                    }
                }

                {
                    roomEvent = CreateRoomEvent();
                    roomEvent->type = ROOMEVENT_TYPE_ITEMEFFECT_APPLIED;
                    roomEvent->effect = 4;
                    roomEvent->targetPlayer = nearestPlayer;
                }
            } break;

            case ITEM__MP_9: {
                roomEvent = CreateRoomEvent();
                roomEvent->type = ROOMEVENT_TYPE_ITEMEFFECT_APPLIED;
                roomEvent->effect = 0;
            } break;

            case ITEM__MP_10: {
                roomEvent = CreateRoomEvent();
                roomEvent->type = ROOMEVENT_TYPE_ITEMEFFECT_APPLIED;
                roomEvent->effect = 5;
            } break;
        }

        gCurTask->main = Task_Itembox4;
        itembox->unk70 = 0;
    }

    s = &itembox->sprItem;
    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;
    DisplaySprite(s);
}

void Task_Itembox3(void)
{
    ItemBox *itembox = TASK_DATA(gCurTask);
    MapEntity *me = itembox->base.me;
    Sprite *s;
    s16 worldX, worldY;

    itembox->iconOffset--;
    itembox->unk70++;

    worldX = TO_WORLD_POS(itembox->base.meX, itembox->base.regionX);
    worldY = TO_WORLD_POS(me->y, itembox->base.regionY) + itembox->iconOffset;

    if (itembox->unk70 >= 60) {
        gCurTask->main = Task_Itembox4;
        itembox->unk70 = 0;
    }

    s = &itembox->sprItem;
    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;
    DisplaySprite(s);
}

void Task_Itembox4(void)
{
    ItemBox *itembox = TASK_DATA(gCurTask);
    MapEntity *me = itembox->base.me;
    Sprite *s;
    s16 worldX, worldY;

    if (++itembox->unk70 > 30) {
        TaskDestroy(gCurTask);
        return;
    }

    worldX = TO_WORLD_POS(itembox->base.meX, itembox->base.regionX);
    worldY = TO_WORLD_POS(me->y, itembox->base.regionY) + itembox->iconOffset;

    s = &itembox->sprItem;
    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;
    DisplaySprite(s);
}

void TaskDestructor_ItemBox(Task *t)
{
    ItemBox *itembox = TASK_DATA(t);
    VramFree(itembox->s.graphics.dest);
    VramFree(itembox->sprItem.graphics.dest);
}

#else
// TODO: Integrate these!

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

#endif