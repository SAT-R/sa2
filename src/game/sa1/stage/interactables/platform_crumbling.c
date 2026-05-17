#include "global.h"
#include "core.h"
#include "flags.h"
#include "trig.h"
#include "malloc_vram.h"
#include "lib/m4a/m4a.h"
#include "game/shared/stage/entity.h"
#include "game/shared/stage/mp_player.h"
#include "game/shared/stage/mp_event_mgr.h"
#include "game/shared/stage/player.h"
#include "game/shared/stage/collision.h"
#include "game/sa1/stage/player_controls.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/char_states.h"
#include "constants/sa1/interactables.h"
#include "constants/sa1/songs.h"
#include "constants/zones.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ s16 unk3C;
} PlatformCrumbling;

void Task_PlatformCrumbling(void);
void Task_8025008(void);
void Task_8025190(void);
void Task_8025400(void);
void TaskDestructor_PlatformCrumbling(Task *t);

const AnimId sPlatformCrumblingAnims[NUM_LEVEL_IDS] = {
    SA1_ANIM_CRUMBLE_PLATFORM_1,
    SA1_ANIM_CRUMBLE_PLATFORM_1, //
    SA1_ANIM_CRUMBLE_PLATFORM_2_3,
    SA1_ANIM_CRUMBLE_PLATFORM_2_3, //
    SA1_ANIM_CRUMBLE_PLATFORM_2_3,
    SA1_ANIM_CRUMBLE_PLATFORM_2_3, //
    SA1_ANIM_CRUMBLE_PLATFORM_4,
    SA1_ANIM_CRUMBLE_PLATFORM_4, //
    SA1_ANIM_CRUMBLE_PLATFORM_5,
    SA1_ANIM_CRUMBLE_PLATFORM_5, //
    SA1_ANIM_CRUMBLE_PLATFORM_6_1,
    SA1_ANIM_CRUMBLE_PLATFORM_6_2, //
    SA1_ANIM_CRUMBLE_PLATFORM_6_1,
    SA1_ANIM_CRUMBLE_PLATFORM_6_1, //
    SA1_ANIM_CRUMBLE_PLATFORM_1,
    SA1_ANIM_CRUMBLE_PLATFORM_2_3, //
    SA1_ANIM_CRUMBLE_PLATFORM_2_3,
    SA1_ANIM_CRUMBLE_PLATFORM_6_2, //
};

void CreateEntity_PlatformCrumbling(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_PlatformCrumbling, sizeof(PlatformCrumbling), 0x2000, 0, TaskDestructor_PlatformCrumbling);
    PlatformCrumbling *platform = TASK_DATA(t);
    SpriteBase *base = &platform->base;
    Sprite *s = &platform->s;

    base->regionX = regionX;
    base->regionY = regionY;
    base->me = me;
    base->meX = me->x;
    base->id = id;
    SET_MAP_ENTITY_INITIALIZED(me);

    platform->unk3C = 0;

    // @BUG Loads the -2 set through SET_MAP_ENTITY_INITIALIZED
    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);
    s->graphics.dest = ALLOC_TILES(SA1_ANIM_CRUMBLE_PLATFORM);

#ifdef BUG_FIX
    // Prevent overflow
    s->graphics.anim = sPlatformCrumblingAnims[gCurrentLevel % ARRAY_COUNT(sPlatformCrumblingAnims)];
#else
    s->graphics.anim = sPlatformCrumblingAnims[gCurrentLevel];
#endif
    s->variant = 0;
    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->frameFlags = 0x2000;

    if (me->d.sData[0] != 0) {
        s->frameFlags |= 0x400;
    }

    UpdateSpriteAnimation(s);
}

void Task_PlatformCrumbling(void)
{
    PlatformCrumbling *platform = TASK_DATA(gCurTask);
    Sprite *s = &platform->s;
    MapEntity *me = platform->base.me;
    s16 worldX, worldY;

    worldX = TO_WORLD_POS(platform->base.meX, platform->base.regionX);
    worldY = TO_WORLD_POS(me->y, platform->base.regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if ((Coll_Player_PlatformCrumbling(s, worldX, worldY, &gPlayer) & 0x8) ||
#if (GAME == GAME_SA1)
        ((gNumSingleplayerCharacters == 2) && Coll_Player_PlatformCrumbling(s, worldX, worldY, &gPartner) & 0x8)
#endif
    ) {
        gCurTask->main = Task_8025008;
        platform->unk3C = 0;
    }

    if (IS_MULTI_PLAYER && ((s8)me->x == MAP_ENTITY_STATE_MINUS_THREE)) {
        platform->unk3C = 0;
        gCurTask->main = Task_8025190;
#if (GAME == GAME_SA1)
        m4aSongNumStart(SE_CRUMBLING_PLATFORM);
#endif
    }

    if ((worldX > gCamera.x + DISPLAY_WIDTH + (CAM_REGION_WIDTH / 2) || (worldX < gCamera.x - (CAM_REGION_WIDTH / 2))
         || (worldY > gCamera.y + DISPLAY_HEIGHT + (CAM_REGION_WIDTH / 2)) || (worldY < gCamera.y - (CAM_REGION_WIDTH / 2)))
        && (IS_OUT_OF_CAM_RANGE(s->x, s->y))) {
        me->x = platform->base.meX;
        TaskDestroy(gCurTask);
    } else {
        DisplaySprite(s);
    }
}

void Task_8025008(void)
{
    PlatformCrumbling *platform = TASK_DATA(gCurTask);
    Sprite *s = &platform->s;
    MapEntity *me = platform->base.me;
    s16 worldX, worldY;

    worldX = TO_WORLD_POS(platform->base.meX, platform->base.regionX);
    worldY = TO_WORLD_POS(me->y, platform->base.regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    Coll_Player_PlatformCrumbling(s, worldX, worldY, &gPlayer);
#if (GAME == GAME_SA1)
    Coll_Player_PlatformCrumbling(s, worldX, worldY, &gPartner);
#endif

    if (IS_MULTI_PLAYER && ((s8)me->x == MAP_ENTITY_STATE_MINUS_THREE)) {
        platform->unk3C = 0;
        gCurTask->main = Task_8025190;
#if (GAME == GAME_SA1)
        m4aSongNumStart(SE_CRUMBLING_PLATFORM);
#endif
    } else if (platform->unk3C++ > 30) {
        platform->unk3C = 0;
        gCurTask->main = Task_8025190;
#if (GAME == GAME_SA1)
        m4aSongNumStart(SE_CRUMBLING_PLATFORM);

        if (IS_MULTI_PLAYER) {
            {
                RoomEvent_PlatformChange *roomEvent;
                roomEvent = CreateRoomEvent();
                roomEvent->type = ROOMEVENT_TYPE_PLATFORM_CHANGE;
                roomEvent->x = platform->base.regionX;
                roomEvent->y = platform->base.regionY;
                roomEvent->id = platform->base.id;
                roomEvent->action = 1;
            }
        }
#endif
    }

    if ((worldX > gCamera.x + DISPLAY_WIDTH + (CAM_REGION_WIDTH / 2) || (worldX < gCamera.x - (CAM_REGION_WIDTH / 2))
         || (worldY > gCamera.y + DISPLAY_HEIGHT + (CAM_REGION_WIDTH / 2)) || (worldY < gCamera.y - (CAM_REGION_WIDTH / 2)))
        && (IS_OUT_OF_CAM_RANGE(s->x, s->y))) {
        me->x = platform->base.meX;
        TaskDestroy(gCurTask);
    } else {
        DisplaySprite(s);
    }
}

void Task_8025190(void)
{
    PlatformCrumbling *platform = TASK_DATA(gCurTask);
    Sprite *s = &platform->s;
    MapEntity *me = platform->base.me;
    s16 worldX, worldY;
    s16 otherPos;
    u8 r6, x, y;
    const u16 *oam_ptr;
    const u16 *oam;

    worldX = TO_WORLD_POS(platform->base.meX, platform->base.regionX);
    worldY = TO_WORLD_POS(me->y, platform->base.regionY);

    otherPos = (gCamera.y - worldY) + DISPLAY_HEIGHT;

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;
    platform->unk3C++;

    Coll_Player_PlatformCrumbling(s, worldX, worldY, &gPlayer);
#if (GAME == GAME_SA1)
    Coll_Player_PlatformCrumbling(s, worldX, worldY, &gPartner);
#endif

    if (worldX > gCamera.x + DISPLAY_WIDTH + (CAM_REGION_WIDTH / 2) || (worldX < gCamera.x - (CAM_REGION_WIDTH / 2))) {
        if ((u16)(s->x + (CAM_REGION_WIDTH / 2)) > (u16)(DISPLAY_WIDTH + CAM_REGION_WIDTH)) {
            me->x = platform->base.meX;
            TaskDestroy(gCurTask);
            return;
        }
    }

    oam_ptr = gRefSpriteTables->oamData[s->graphics.anim];
    oam = &oam_ptr[s->dimensions->oamIndex * 3];

    r6 = 0;
    for (y = 0; y < 4; y++) {
        for (x = 0; x < 8; r6++, x++) {
            s16 r4;
            OamData *pointer;
            s16 value = -31;
            value = r6 + value + platform->unk3C;

            if (value > 0) {
                if (r6 == 0 && value == 1) {
                    if ((gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ) && gPlayer.stoodObj == s) {
                        gPlayer.moveState = ((gPlayer.moveState & (~MOVESTATE_STOOD_ON_OBJ)) | MOVESTATE_IN_AIR);
                    }
#if (GAME == GAME_SA1)
                    if (gNumSingleplayerCharacters == 2) {
                        if ((gPartner.moveState & MOVESTATE_STOOD_ON_OBJ) && (gPartner.stoodObj == s)) {
                            gPartner.moveState = ((gPartner.moveState & (~MOVESTATE_STOOD_ON_OBJ)) | MOVESTATE_IN_AIR);
                        }
                    }
#endif
                    gCurTask->main = Task_8025400;
                }

                r4 = (((((s16)value * 42) * (s16)value) << 8) >> 16);

                if (r4 > otherPos) {
                    if (r6 == 0)
                        TaskDestroy(gCurTask);
                    return;
                }
            } else {
                r4 = 0;
            }

            pointer = OamMalloc(GET_SPRITE_OAM_ORDER(s));
            if (iwram_end == pointer)
                return;

#if !EXTENDED_OAM
            pointer->all.attr0 = ((s16)(r4 + ((y * TILE_WIDTH) + s->y))) & 0xFF;

            if (s->frameFlags & SPRITE_FLAG_MASK_X_FLIP) {
                pointer->all.attr1 = ((s->x - x * TILE_WIDTH - 8) & 0x1FF) | 0x1000;
            } else {
                pointer->all.attr1 = (s->x + x * TILE_WIDTH) & 0x1FF;
            }
#else
            pointer->split.y = (r4 + ((y * TILE_WIDTH) + s->y));
            pointer->split.affineMode = 0;
            pointer->split.objMode = 0;
            pointer->split.mosaic = 0;
            pointer->split.bpp = 0;
            pointer->split.shape = 0;

            if (s->frameFlags & SPRITE_FLAG_MASK_X_FLIP) {
                pointer->split.x = (s->x - x * TILE_WIDTH - 8);
                pointer->split.matrixNum = 0x8; // x-flip, actually
            } else {
                pointer->split.x = (s->x + x * TILE_WIDTH);
            }
#endif

            pointer->all.attr2
                = (((oam[2] + s->palId) & ~0xFFF) | (SPRITE_FLAG_GET(s, PRIORITY) << 10) | (u16)(GET_TILE_NUM(s->graphics.dest) + r6));
        }
    }
}

void Task_8025400(void)
{
    PlatformCrumbling *platform = TASK_DATA(gCurTask);
    Sprite *s = &platform->s;
    MapEntity *me = platform->base.me;

    s16 worldX, worldY;
    s16 otherPos;
    u8 r6, x, y;
    const u16 *oam_ptr;
    const u16 *oam;

    worldX = TO_WORLD_POS(platform->base.meX, platform->base.regionX);
    worldY = TO_WORLD_POS(me->y, platform->base.regionY);

    otherPos = (gCamera.y - worldY) + DISPLAY_HEIGHT;

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;
    platform->unk3C++;

    if (worldX > gCamera.x + DISPLAY_WIDTH + (CAM_REGION_WIDTH / 2) || (worldX < gCamera.x - (CAM_REGION_WIDTH / 2))) {
        if ((u16)(s->x + (CAM_REGION_WIDTH / 2)) > (u16)(DISPLAY_WIDTH + CAM_REGION_WIDTH)) {
            me->x = platform->base.meX;
            TaskDestroy(gCurTask);
            return;
        }
    }

    oam_ptr = gRefSpriteTables->oamData[s->graphics.anim];
    oam = &oam_ptr[s->dimensions->oamIndex * 3];

    r6 = 0;
    for (y = 0; y < 4; y++) {
        for (x = 0; x < 8; r6++, x++) {
            s16 r4;
            OamData *pointer;
            s16 value = -31;
            value = r6 + value + platform->unk3C;

            r4 = (((((s16)value * 42) * (s16)value) << 8) >> 16);

            if (r4 > otherPos) {
                if (r6 == 0) {
                    TaskDestroy(gCurTask);
                    me->x = platform->base.meX;
                }
                return;
            }

            pointer = OamMalloc(GET_SPRITE_OAM_ORDER(s));
            if (iwram_end == pointer) {
                return;
            }

            pointer->all.attr0 = ((s16)(r4 + ((y * TILE_WIDTH) + s->y))) & 0xFF;

            if (s->frameFlags & 0x400) {
                pointer->all.attr1 = ((s->x - x * TILE_WIDTH - 8) & 0x1FF) | 0x1000;
            } else {
                pointer->all.attr1 = (s->x + x * TILE_WIDTH) & 0x1FF;
            }

            pointer->all.attr2
                = (((oam[2] + s->palId) & ~0xFFF) | ((s->frameFlags & 0x3000) >> 2) | (u16)(GET_TILE_NUM(s->graphics.dest) + r6));
        }
    }
}

void TaskDestructor_PlatformCrumbling(Task *t)
{
    PlatformCrumbling *platform = TASK_DATA(t);
    VramFree(platform->s.graphics.dest);
}