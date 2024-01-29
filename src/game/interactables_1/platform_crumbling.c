#include "global.h"
#include "malloc_vram.h"

#include "data.h"
#include "sprite.h"
#include "data/sprite_data.h"
#include "task.h"

#include "game/game.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "game/entity.h"
#include "game/interactables_1/platform_crumbling.h"

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
    = { [LEVEL_INDEX(ZONE_1, ACT_1)] = SA2_ANIM_PLATFORM_LF_WIDE,
        [LEVEL_INDEX(ZONE_1, ACT_2)] = SA2_ANIM_PLATFORM_LF_WIDE };

extern const struct SpriteTables *gUnknown_03002794;

extern u32 sub_800C060(Sprite *, s32, s32, Player *);

static void Task_Interactable_019(void);

static void Task_805E35C(void);
static void Task_805E480(void);
static void Task_805E6A4(void);
static void TaskDestructor_Interactable019(struct Task *);

// @TODO: Replace with tile-count from the graphics data itself
#define IA_019_NUM_TILES 32

void CreateEntity_PlatformCrumbling(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                                    u8 spriteY)
{
    struct Task *t = TaskCreate(Task_Interactable_019, sizeof(Sprite_019), 0x2000, 0,
                                TaskDestructor_Interactable019);
    Sprite_019 *platform = TASK_DATA(t);
    SpriteBase *base = &platform->base;
    Sprite *s = &platform->s;
    // s16 screenX, screenY;

    base->regionX = spriteRegionX;
    base->regionY = spriteRegionY;
    base->me = me;
    base->spriteX = me->x;
    base->spriteY = spriteY;
    SET_MAP_ENTITY_INITIALIZED(me);

    platform->unk3C = 0;

    // @BUG Loads the -2 set through SET_MAP_ENTITY_INITIALIZED
    s->x = TO_WORLD_POS(me->x, spriteRegionX);
    s->y = TO_WORLD_POS(me->y, spriteRegionY);
    s->graphics.dest = VramMalloc(IA_019_NUM_TILES);

#ifdef UB_FIX
    // Prevent overflow
    s->graphics.anim
        = sInt019_AnimationIds[gCurrentLevel % ARRAY_COUNT(sInt019_AnimationIds)];
#else
    s->graphics.anim = sInt019_AnimationIds[gCurrentLevel];
#endif
    s->variant = 0;
    s->unk1A = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->timeUntilNextFrame = 0;

    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = FALSE;
    s->unk10 = 0x2000;

    if (me->d.sData[0] != 0) {
        s->unk10 |= 0x400;
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

    if (sub_800C060(s, screenX, screenY, &gPlayer) & 0x8) {
        gCurTask->main = Task_805E35C;
        platform->unk3C = 0;
    }

    if (IS_MULTI_PLAYER && ((s8)me->x == MAP_ENTITY_STATE_MINUS_THREE)) {
        platform->unk3C = 0;
        gCurTask->main = Task_805E480;
    }

    // _0805E2C2

    if ((screenX > gCamera.x + DISPLAY_WIDTH + (CAM_REGION_WIDTH / 2)
         || (screenX < gCamera.x - (CAM_REGION_WIDTH / 2))
         || (screenY > gCamera.y + DISPLAY_HEIGHT + (CAM_REGION_WIDTH / 2))
         || (screenY < gCamera.y - (CAM_REGION_WIDTH / 2)))
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

    sub_800C060(s, screenX, screenY, &gPlayer);

    if (IS_MULTI_PLAYER && ((s8)me->x == MAP_ENTITY_STATE_MINUS_THREE)) {
        platform->unk3C = 0;
        gCurTask->main = Task_805E480;
    } else if (platform->unk3C++ > 30) {
        platform->unk3C = 0;
        gCurTask->main = Task_805E480;
    }

    if ((screenX > gCamera.x + DISPLAY_WIDTH + (CAM_REGION_WIDTH / 2)
         || (screenX < gCamera.x - (CAM_REGION_WIDTH / 2))
         || (screenY > gCamera.y + DISPLAY_HEIGHT + (CAM_REGION_WIDTH / 2))
         || (screenY < gCamera.y - (CAM_REGION_WIDTH / 2)))
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
    u16 *oam_ptr;
    u16 *oam;

    screenX = TO_WORLD_POS(platform->base.spriteX, platform->base.regionX);
    screenY = TO_WORLD_POS(me->y, platform->base.regionY);

    otherPos = (gCamera.y - screenY) + DISPLAY_HEIGHT;

    s->x = screenX - gCamera.x;
    s->y = screenY - gCamera.y;
    platform->unk3C++;

    sub_800C060(s, screenX, screenY, &gPlayer);

    if (screenX > gCamera.x + DISPLAY_WIDTH + (CAM_REGION_WIDTH / 2)
        || (screenX < gCamera.x - (CAM_REGION_WIDTH / 2))) {
        if ((u16)(s->x + (CAM_REGION_WIDTH / 2))
            > (u16)(DISPLAY_WIDTH + CAM_REGION_WIDTH)) {
            me->x = platform->base.spriteX;
            TaskDestroy(gCurTask);
            return;
        }
    }
    // _0805E52C
    oam_ptr = gUnknown_03002794->oamData[s->graphics.anim];
    oam = &oam_ptr[s->dimensions->oamIndex * 3];

    // _0805E54C
    r6 = 0;
    for (y = 0; y < 4; y++) {
        for (x = 0; x < 8; r6++, x++) {
            s16 r4;
            OamData *pointer;
            s16 value = -31;
            value = r6 + value + platform->unk3C;

            if (value > 0) {
                if (r6 == 0 && value == 1) {
                    if ((gPlayer.moveState & MOVESTATE_8) && gPlayer.unk3C == s) {
                        gPlayer.moveState
                            = ((gPlayer.moveState & (~MOVESTATE_8)) | MOVESTATE_IN_AIR);
                    }

                    gCurTask->main = Task_805E6A4;
                }
                // _0805E590
                r4 = (((((s16)value * 42) * (s16)value) << 8) >> 16);

                if (r4 > otherPos) {
                    if (r6 == 0)
                        TaskDestroy(gCurTask);
                    return;
                }
            } else {
                // _0805E5CC
                r4 = 0;
            }
            // _0805E5CE
            pointer = OamMalloc(GET_SPRITE_OAM_ORDER(s));
            if (iwram_end == pointer)
                return;

            pointer->all.attr0 = ((s16)(r4 + ((y * TILE_WIDTH) + s->y))) & 0xFF;

            if (s->unk10 & 0x400) {
                pointer->all.attr1 = ((s->x - x * TILE_WIDTH - 8) & 0x1FF) | 0x1000;
            } else {
                // _0805E62C
                pointer->all.attr1 = (s->x + x * TILE_WIDTH) & 0x1FF;
            }

            pointer->all.attr2
                = (((oam[2] + s->palId) & ~0xFFF) | ((s->unk10 & 0x3000) >> 2)
                   | (u16)(((u32)(s->graphics.dest - OBJ_VRAM0) >> 5)
                           + r6)); // (>> 5) = offset -> tilecount?
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
    u16 *oam_ptr;
    u16 *oam;

    screenX = TO_WORLD_POS(platform->base.spriteX, platform->base.regionX);
    screenY = TO_WORLD_POS(me->y, platform->base.regionY);

    otherPos = (gCamera.y - screenY) + DISPLAY_HEIGHT;

    s->x = screenX - gCamera.x;
    s->y = screenY - gCamera.y;
    platform->unk3C++;

    if (screenX > gCamera.x + DISPLAY_WIDTH + (CAM_REGION_WIDTH / 2)
        || (screenX < gCamera.x - (CAM_REGION_WIDTH / 2))) {
        if ((u16)(s->x + (CAM_REGION_WIDTH / 2))
            > (u16)(DISPLAY_WIDTH + CAM_REGION_WIDTH)) {
            me->x = platform->base.spriteX;
            TaskDestroy(gCurTask);
            return;
        }
    }

    oam_ptr = gUnknown_03002794->oamData[s->graphics.anim];
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
                    me->x = platform->base.spriteX;
                }
                return;
            }

            pointer = OamMalloc((s->unk1A & 0x7C0) >> 6);
            if (iwram_end == pointer) {
                return;
            }

            pointer->all.attr0 = ((s16)(r4 + ((y * TILE_WIDTH) + s->y))) & 0xFF;

            if (s->unk10 & 0x400) {
                pointer->all.attr1 = ((s->x - x * TILE_WIDTH - 8) & 0x1FF) | 0x1000;
            } else {
                pointer->all.attr1 = (s->x + x * TILE_WIDTH) & 0x1FF;
            }

            pointer->all.attr2
                = (((oam[2] + s->palId) & ~0xFFF) | ((s->unk10 & 0x3000) >> 2)
                   | (u16)(((u32)(s->graphics.dest - OBJ_VRAM0) >> 5)
                           + r6)); // (>> 5) = offset -> tilecount?
        }
    }
}

void TaskDestructor_Interactable019(struct Task *t)
{
    Sprite_019 *platform = TASK_DATA(t);
    VramFree(platform->s.graphics.dest);
}
