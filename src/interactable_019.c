#include "global.h"
#include "malloc_vram.h"

#include "task.h"

#include "game.h"
#include "interactable.h"
#include "sprite.h"
#include "data.h"

#include "constants/animations.h"
#include "constants/move_states.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite displayed;
    s16 unk3C;
} Sprite_019;

// @NOTE/@BUG: This only has 2 entries, so using this Interactable in
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

void initSprite_Interactable_019(Interactable *ia, u16 spriteRegionX, u16 spriteRegionY,
                                 u8 spriteY)
{
    struct Task *t = TaskCreate(Task_Interactable_019, sizeof(Sprite_019), 0x2000, 0,
                                TaskDestructor_Interactable019);
    Sprite_019 *platform = TaskGetStructPtr(t);
    SpriteBase *base = &platform->base;
    Sprite *displayed = &platform->displayed;
    // s16 screenX, screenY;

    base->regionX = spriteRegionX;
    base->regionY = spriteRegionY;
    base->ia = ia;
    base->spriteX = ia->x;
    base->spriteY = spriteY;
    SET_SPRITE_INITIALIZED(ia);

    platform->unk3C = 0;

    // @BUG Loads the -2 set through SET_SPRITE_INITIALIZED
    displayed->x = SpriteGetScreenPos(ia->x, spriteRegionX);
    displayed->y = SpriteGetScreenPos(ia->y, spriteRegionY);
    displayed->graphics.dest = VramMalloc(IA_019_NUM_TILES);

#ifdef UBFIX
    // Prevent overflow
    displayed->graphics.anim
        = sInt019_AnimationIds[gCurrentLevel % ARRAY_COUNT(sInt019_AnimationIds)];
#else
    displayed->graphics.anim = sInt019_AnimationIds[gCurrentLevel];
#endif
    displayed->variant = 0;
    displayed->unk1A = 0x480;
    displayed->graphics.size = 0;
    displayed->unk14 = 0;
    displayed->unk1C = 0;

    displayed->unk21 = 0xFF;
    displayed->unk22 = 0x10;
    displayed->focused = FALSE;
    displayed->unk10 = 0x2000;

    if (ia->d.sData[0] != 0) {
        displayed->unk10 |= 0x400;
    }

    sub_8004558(displayed);
}

void Task_Interactable_019(void)
{
    Sprite_019 *platform = TaskGetStructPtr(gCurTask);
    SpriteBase *base = &platform->base;
    Sprite *displayed = &platform->displayed;
    Interactable *ia = base->ia;
    s16 screenX, screenY;

    screenX = SpriteGetScreenPos(base->spriteX, base->regionX);
    screenY = SpriteGetScreenPos(ia->y, base->regionY);

    displayed->x = screenX - gCamera.x;
    displayed->y = screenY - gCamera.y;

    if (sub_800C060(displayed, screenX, screenY, &gPlayer) & 0x8) {
        gCurTask->main = Task_805E35C;
        platform->unk3C = 0;
    }

    if ((gGameMode >= GAME_MODE_MULTI_PLAYER)
        && ((s8)ia->x == SPRITE_STATE_UNK_MINUS_THREE)) {
        platform->unk3C = 0;
        gCurTask->main = Task_805E480;
    }

    // _0805E2C2

    if ((screenX > gCamera.x + DISPLAY_WIDTH + (CAM_REGION_WIDTH / 2)
         || (screenX < gCamera.x - (CAM_REGION_WIDTH / 2))
         || (screenY > gCamera.y + DISPLAY_HEIGHT + (CAM_REGION_WIDTH / 2))
         || (screenY < gCamera.y - (CAM_REGION_WIDTH / 2)))
        && (IS_OUT_OF_CAM_RANGE(displayed->x, (s16)displayed->y))) {
        ia->x = base->spriteX;
        TaskDestroy(gCurTask);
    } else {
        sub_80051E8(displayed);
    }
}

void Task_805E35C(void)
{
    Sprite_019 *platform = TaskGetStructPtr(gCurTask);
    Sprite *displayed = &platform->displayed;
    Interactable *ia = platform->base.ia;
    s16 screenX, screenY;

    screenX = SpriteGetScreenPos(platform->base.spriteX, platform->base.regionX);
    screenY = SpriteGetScreenPos(ia->y, platform->base.regionY);

    displayed->x = screenX - gCamera.x;
    displayed->y = screenY - gCamera.y;

    sub_800C060(displayed, screenX, screenY, &gPlayer);

    if ((gGameMode >= GAME_MODE_MULTI_PLAYER)
        && ((s8)ia->x == SPRITE_STATE_UNK_MINUS_THREE)) {
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
        && (IS_OUT_OF_CAM_RANGE(displayed->x, (s16)displayed->y))) {
        ia->x = platform->base.spriteX;
        TaskDestroy(gCurTask);
    } else {
        sub_80051E8(displayed);
    }
}

void Task_805E480(void)
{
    Sprite_019 *platform = TaskGetStructPtr(gCurTask);
    Sprite *displayed = &platform->displayed;
    Interactable *ia = platform->base.ia;
    s16 screenX, screenY;
    s16 otherPos;
    u8 r6, x, y;
    u16 *oam_ptr;
    u16 *oam;

    screenX = SpriteGetScreenPos(platform->base.spriteX, platform->base.regionX);
    screenY = SpriteGetScreenPos(ia->y, platform->base.regionY);

    otherPos = (gCamera.y - screenY) + DISPLAY_HEIGHT;

    displayed->x = screenX - gCamera.x;
    displayed->y = screenY - gCamera.y;
    platform->unk3C++;

    sub_800C060(displayed, screenX, screenY, &gPlayer);

    if (screenX > gCamera.x + DISPLAY_WIDTH + (CAM_REGION_WIDTH / 2)
        || (screenX < gCamera.x - (CAM_REGION_WIDTH / 2))) {
        if ((u16)(displayed->x + (CAM_REGION_WIDTH / 2))
            > (u16)(DISPLAY_WIDTH + CAM_REGION_WIDTH)) {
            ia->x = platform->base.spriteX;
            TaskDestroy(gCurTask);
            return;
        }
    }
    // _0805E52C
    oam_ptr = gUnknown_03002794->oamData[displayed->graphics.anim];
    oam = &oam_ptr[displayed->unkC->unk1 * 3];

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
                    if ((gPlayer.moveState & MOVESTATE_8)
                        && gPlayer.unk3C == displayed) {
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
            pointer = sub_80058B4((displayed->unk1A & 0x7C0) >> 6);
            if (iwram_end == pointer)
                return;

            pointer->all.attr0 = ((s16)(r4 + ((y * TILE_WIDTH) + displayed->y))) & 0xFF;

            if (displayed->unk10 & 0x400) {
                pointer->all.attr1
                    = ((displayed->x - x * TILE_WIDTH - 8) & 0x1FF) | 0x1000;
            } else {
                // _0805E62C
                pointer->all.attr1 = (displayed->x + x * TILE_WIDTH) & 0x1FF;
            }

            pointer->all.attr2
                = (((oam[2] + displayed->focused) & ~0xFFF)
                   | ((displayed->unk10 & 0x3000) >> 2)
                   | (u16)(((u32)(displayed->graphics.dest - OBJ_VRAM0) >> 5)
                           + r6)); // (>> 5) = offset -> tilecount?
        }
    }
}

void Task_805E6A4(void)
{
    Sprite_019 *platform = TaskGetStructPtr(gCurTask);
    Sprite *displayed = &platform->displayed;
    Interactable *ia = platform->base.ia;

    s16 screenX, screenY;
    s16 otherPos;
    u8 r6, x, y;
    u16 *oam_ptr;
    u16 *oam;

    screenX = SpriteGetScreenPos(platform->base.spriteX, platform->base.regionX);
    screenY = SpriteGetScreenPos(ia->y, platform->base.regionY);

    otherPos = (gCamera.y - screenY) + DISPLAY_HEIGHT;

    displayed->x = screenX - gCamera.x;
    displayed->y = screenY - gCamera.y;
    platform->unk3C++;

    if (screenX > gCamera.x + DISPLAY_WIDTH + (CAM_REGION_WIDTH / 2)
        || (screenX < gCamera.x - (CAM_REGION_WIDTH / 2))) {
        if ((u16)(displayed->x + (CAM_REGION_WIDTH / 2))
            > (u16)(DISPLAY_WIDTH + CAM_REGION_WIDTH)) {
            ia->x = platform->base.spriteX;
            TaskDestroy(gCurTask);
            return;
        }
    }

    oam_ptr = gUnknown_03002794->oamData[displayed->graphics.anim];
    oam = &oam_ptr[displayed->unkC->unk1 * 3];

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
                    ia->x = platform->base.spriteX;
                }
                return;
            }

            pointer = sub_80058B4((displayed->unk1A & 0x7C0) >> 6);
            if (iwram_end == pointer) {
                return;
            }

            pointer->all.attr0 = ((s16)(r4 + ((y * TILE_WIDTH) + displayed->y))) & 0xFF;

            if (displayed->unk10 & 0x400) {
                pointer->all.attr1
                    = ((displayed->x - x * TILE_WIDTH - 8) & 0x1FF) | 0x1000;
            } else {
                pointer->all.attr1 = (displayed->x + x * TILE_WIDTH) & 0x1FF;
            }

            pointer->all.attr2
                = (((oam[2] + displayed->focused) & ~0xFFF)
                   | ((displayed->unk10 & 0x3000) >> 2)
                   | (u16)(((u32)(displayed->graphics.dest - OBJ_VRAM0) >> 5)
                           + r6)); // (>> 5) = offset -> tilecount?
        }
    }
}

void TaskDestructor_Interactable019(struct Task *t)
{
    Sprite_019 *platform = TaskGetStructPtr(t);
    VramFree(platform->displayed.graphics.dest);
}
