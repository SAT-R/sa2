#include "global.h"
#include "malloc_vram.h"
#include "sprite.h"
#include "task.h"

#include "game/sa1_sa2_shared/globals.h"

#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "game/entity.h"
#include "game/interactables_1/platform_crumbling.h"

#include "data/sprite_data.h"

#include "constants/animations.h"
#include "constants/zones.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    s16 unk3C;
} Sprite_019;

// @NOTE/@BUG: This only has 2 entries, so using this MapEntity in
// anything beyond Leaf Forest Act 2 will use a wrong AnimID.
static const u16 sInt019_AnimationIds[]
    = { [LEVEL_INDEX(ZONE_1, ACT_1)] = SA2_ANIM_PLATFORM_LF_WIDE, [LEVEL_INDEX(ZONE_1, ACT_2)] = SA2_ANIM_PLATFORM_LF_WIDE };

extern const struct SpriteTables *gRefSpriteTables;

extern u32 Coll_Player_PlatformCrumbling(Sprite *, s32, s32, Player *);

static void Task_Interactable_019(void);

static void Task_805E35C(void);
static void Task_805E480(void);
static void Task_805E6A4(void);
static void TaskDestructor_Interactable019(struct Task *);

// @TODO: Replace with tile-count from the graphics data itself
#define IA_019_NUM_TILES 32

void CreateEntity_PlatformCrumbling(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(Task_Interactable_019, sizeof(Sprite_019), 0x2000, 0, TaskDestructor_Interactable019);
    Sprite_019 *platform = TASK_DATA(t);
    SpriteBase *base = &platform->base;
    Sprite *s = &platform->s;
    // s16 screenX, screenY;

    base->regionX = spriteRegionX;
    base->regionY = spriteRegionY;
    base->me = me;
    base->spriteX = me->x;
    base->id = spriteY;
    SET_MAP_ENTITY_INITIALIZED(me);

    platform->unk3C = 0;

    // @BUG Loads the -2 set through SET_MAP_ENTITY_INITIALIZED
    s->x = TO_WORLD_POS(me->x, spriteRegionX);
    s->y = TO_WORLD_POS(me->y, spriteRegionY);
    s->graphics.dest = VramMalloc(IA_019_NUM_TILES);

#ifdef BUG_FIX
    // Prevent overflow
    s->graphics.anim = sInt019_AnimationIds[gCurrentLevel % ARRAY_COUNT(sInt019_AnimationIds)];
#else
    s->graphics.anim = sInt019_AnimationIds[gCurrentLevel];
#endif
    s->variant = 0;
    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;

    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = FALSE;
    s->frameFlags = 0x2000;

    if (me->d.sData[0] != 0) {
        s->frameFlags |= 0x400;
    }

    UpdateSpriteAnimation(s);
}

void Task_Interactable_019(void)
{
    Sprite_019 *platform = TASK_DATA(gCurTask);
    SpriteBase *base = &platform->base;
    Sprite *s = &platform->s;
    MapEntity *me = base->me;
    s16 screenX, screenY;

    screenX = TO_WORLD_POS(base->spriteX, base->regionX);
    screenY = TO_WORLD_POS(me->y, base->regionY);

    s->x = screenX - gCamera.x;
    s->y = screenY - gCamera.y;

    if (Coll_Player_PlatformCrumbling(s, screenX, screenY, &gPlayer) & 0x8) {
        gCurTask->main = Task_805E35C;
        platform->unk3C = 0;
    }

    if (IS_MULTI_PLAYER && ((s8)me->x == MAP_ENTITY_STATE_MINUS_THREE)) {
        platform->unk3C = 0;
        gCurTask->main = Task_805E480;
    }

    // _0805E2C2

    if ((screenX > gCamera.x + DISPLAY_WIDTH + (CAM_REGION_WIDTH / 2) || (screenX < gCamera.x - (CAM_REGION_WIDTH / 2))
         || (screenY > gCamera.y + DISPLAY_HEIGHT + (CAM_REGION_WIDTH / 2)) || (screenY < gCamera.y - (CAM_REGION_WIDTH / 2)))
        && (IS_OUT_OF_CAM_RANGE(s->x, s->y))) {
        me->x = base->spriteX;
        TaskDestroy(gCurTask);
    } else {
        DisplaySprite(s);
    }
}

void Task_805E35C(void)
{
    Sprite_019 *platform = TASK_DATA(gCurTask);
    Sprite *s = &platform->s;
    MapEntity *me = platform->base.me;
    s16 screenX, screenY;

    screenX = TO_WORLD_POS(platform->base.spriteX, platform->base.regionX);
    screenY = TO_WORLD_POS(me->y, platform->base.regionY);

    s->x = screenX - gCamera.x;
    s->y = screenY - gCamera.y;

    Coll_Player_PlatformCrumbling(s, screenX, screenY, &gPlayer);

    if (IS_MULTI_PLAYER && ((s8)me->x == MAP_ENTITY_STATE_MINUS_THREE)) {
        platform->unk3C = 0;
        gCurTask->main = Task_805E480;
    } else if (platform->unk3C++ > 30) {
        platform->unk3C = 0;
        gCurTask->main = Task_805E480;
    }

    if ((screenX > gCamera.x + DISPLAY_WIDTH + (CAM_REGION_WIDTH / 2) || (screenX < gCamera.x - (CAM_REGION_WIDTH / 2))
         || (screenY > gCamera.y + DISPLAY_HEIGHT + (CAM_REGION_WIDTH / 2)) || (screenY < gCamera.y - (CAM_REGION_WIDTH / 2)))
        && (IS_OUT_OF_CAM_RANGE(s->x, s->y))) {
        me->x = platform->base.spriteX;
        TaskDestroy(gCurTask);
    } else {
        DisplaySprite(s);
    }
}

void Task_805E480(void)
{
    Sprite_019 *platform = TASK_DATA(gCurTask);
    Sprite *s = &platform->s;
    MapEntity *me = platform->base.me;
    s16 screenX, screenY;
    s16 otherPos;
    u8 r6, x, y;
    const u16 *oam_ptr;
    const u16 *oam;

    screenX = TO_WORLD_POS(platform->base.spriteX, platform->base.regionX);
    screenY = TO_WORLD_POS(me->y, platform->base.regionY);

    otherPos = (gCamera.y - screenY) + DISPLAY_HEIGHT;

    s->x = screenX - gCamera.x;
    s->y = screenY - gCamera.y;
    platform->unk3C++;

    Coll_Player_PlatformCrumbling(s, screenX, screenY, &gPlayer);

    if (screenX > gCamera.x + DISPLAY_WIDTH + (CAM_REGION_WIDTH / 2) || (screenX < gCamera.x - (CAM_REGION_WIDTH / 2))) {
        if ((u16)(s->x + (CAM_REGION_WIDTH / 2)) > (u16)(DISPLAY_WIDTH + CAM_REGION_WIDTH)) {
            me->x = platform->base.spriteX;
            TaskDestroy(gCurTask);
            return;
        }
    }

    oam_ptr = gRefSpriteTables->oamData[s->graphics.anim];
    oam = &oam_ptr[s->dimensions->oamIndex * OAM_DATA_SIZE_NO_AFFINE];

    r6 = 0;
    for (y = 0; y < 4; y++) {
        for (x = 0; x < 8; r6++, x++) {
            s16 r4;
            OamData *oamAllocated;
            s16 value = -31;
            value = r6 + value + platform->unk3C;

            if (value > 0) {
                if (r6 == 0 && value == 1) {
                    if ((gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ) && gPlayer.stoodObj == s) {
                        gPlayer.moveState = ((gPlayer.moveState & (~MOVESTATE_STOOD_ON_OBJ)) | MOVESTATE_IN_AIR);
                    }

                    gCurTask->main = Task_805E6A4;
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

            oamAllocated = OamMalloc(GET_SPRITE_OAM_ORDER(s));
            if (iwram_end == oamAllocated)
                return;

#if !EXTENDED_OAM
            oamAllocated->all.attr0 = ((s16)(r4 + ((y * TILE_WIDTH) + s->y))) & 0xFF;

            if (s->frameFlags & SPRITE_FLAG_MASK_X_FLIP) {
                oamAllocated->all.attr1 = ((s->x - x * TILE_WIDTH - 8) & 0x1FF) | 0x1000;
            } else {
                oamAllocated->all.attr1 = (s->x + x * TILE_WIDTH) & 0x1FF;
            }

            oamAllocated->all.attr2
                = (((oam[2] + s->palId) & ~0xFFF) | (SPRITE_FLAG_GET(s, PRIORITY) << 10) | (u16)(GET_TILE_NUM(s->graphics.dest) + r6));
#else
            oamAllocated->split.y = (r4 + ((y * TILE_WIDTH) + s->y));
            oamAllocated->split.affineMode = 0;
            oamAllocated->split.objMode = 0;
            oamAllocated->split.mosaic = 0;
            oamAllocated->split.bpp = 0;
            oamAllocated->split.shape = 0;

            if (s->frameFlags & SPRITE_FLAG_MASK_X_FLIP) {
                oamAllocated->split.x = (s->x - x * TILE_WIDTH - 8);
                oamAllocated->split.matrixNum = 0x8; // x-flip, actually
            } else {
                oamAllocated->split.x = (s->x + x * TILE_WIDTH);
            }

            oamAllocated->split.tileNum = GET_TILE_NUM(s->graphics.dest) + r6;
            oamAllocated->split.priority = SPRITE_FLAG_GET(s, PRIORITY);
            oamAllocated->split.paletteNum = ((oam[2] + s->palId) & 0xF000) >> 12;
#endif
        }
    }
}

void Task_805E6A4(void)
{
    Sprite_019 *platform = TASK_DATA(gCurTask);
    Sprite *s = &platform->s;
    MapEntity *me = platform->base.me;

    s16 screenX, screenY;
    s16 otherPos;
    u8 r6, x, y;
    const u16 *oam_ptr;
    const u16 *oam;

    screenX = TO_WORLD_POS(platform->base.spriteX, platform->base.regionX);
    screenY = TO_WORLD_POS(me->y, platform->base.regionY);

    otherPos = (gCamera.y - screenY) + DISPLAY_HEIGHT;

    s->x = screenX - gCamera.x;
    s->y = screenY - gCamera.y;
    platform->unk3C++;

    if (screenX > gCamera.x + DISPLAY_WIDTH + (CAM_REGION_WIDTH / 2) || (screenX < gCamera.x - (CAM_REGION_WIDTH / 2))) {
        if ((u16)(s->x + (CAM_REGION_WIDTH / 2)) > (u16)(DISPLAY_WIDTH + CAM_REGION_WIDTH)) {
            me->x = platform->base.spriteX;
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
            OamData *oamAllocated;
            s16 value = -31;
            value = r6 + value + platform->unk3C;

            r4 = I((value * 42) * value);

            if (r4 > otherPos) {
                if (r6 == 0) {
                    TaskDestroy(gCurTask);
                    me->x = platform->base.spriteX;
                }
                return;
            }

            oamAllocated = OamMalloc(GET_SPRITE_OAM_ORDER(s));
            if (iwram_end == oamAllocated) {
                return;
            }

            OAM_INIT_Y(oamAllocated, (r4 + ((y * TILE_WIDTH) + s->y)));

            if (s->frameFlags & SPRITE_FLAG(X_FLIP, 1)) {
                OAM_INIT_X(oamAllocated, (s->x - x * TILE_WIDTH - 8), TRUE);
            } else {
                OAM_INIT_X(oamAllocated, (s->x + x * TILE_WIDTH + 0), FALSE);
            }

#if !EXTENDED_OAM
            oamAllocated->all.attr2
                = (((oam[2] + s->palId) & 0xF000) | (SPRITE_FLAG_GET(s, PRIORITY) << 10) | ((GET_TILE_NUM(s->graphics.dest) + r6)));
#else
            oamAllocated->split.paletteNum = (oam[2] + s->palId) >> 12;
            oamAllocated->split.priority = SPRITE_FLAG_GET(s, PRIORITY);
            oamAllocated->split.tileNum = (GET_TILE_NUM(s->graphics.dest) + r6);
#endif
        }
    }
}

void TaskDestructor_Interactable019(struct Task *t)
{
    Sprite_019 *platform = TASK_DATA(t);
    VramFree(platform->s.graphics.dest);
}
