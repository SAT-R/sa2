#include "global.h"
#include "malloc_vram.h"

#include "task.h"

#include "game.h"
#include "interactable.h"
#include "sprite.h"
#include "data.h"

#include "constants/move_states.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ struct UNK_0808B3FC_UNK240 displayed;
    s16 unk3C;
} Sprite_019;

// NOTE: This does not only have 2 entries, gUnknown_080D94D8 should be part of this
// array
extern u16 gUnknown_080D94D4[];

extern const struct SpriteTables *gUnknown_03002794;

extern u32 sub_800C060(struct UNK_0808B3FC_UNK240 *, s32, s32, struct SomeStruct_59E0 *);

static void Task_Interactable_019(void);

// TODO: static
extern void Task_805E35C(void);
extern void Task_805E480(void);
extern void Task_805E6A4(void);
extern void TaskDestructor_Interactable019(struct Task *);

// @TODO: Replace with tile-count from the graphics data itself
#define IA_019_NUM_TILES 32

void initSprite_Interactable_019(Interactable *ia, u16 spriteRegionX, u16 spriteRegionY,
                                 u8 spriteY)
{
    struct Task *t = TaskCreate(Task_Interactable_019, sizeof(Sprite_019), 0x2000, 0,
                                TaskDestructor_Interactable019);
    Sprite_019 *platform = TaskGetStructPtr(t);
    SpriteBase *base = &platform->base;
    struct UNK_0808B3FC_UNK240 *displayed = &platform->displayed;
    // s16 screenX, screenY;

    base->regionX = spriteRegionX;
    base->regionY = spriteRegionY;
    base->ia = ia;
    base->spriteX = ia->x;
    base->spriteY = spriteY;
    SET_SPRITE_INITIALIZED(ia);

    platform->unk3C = 0;

    // @BUG Loads the -2 set through SET_SPRITE_INITIALIZED
    displayed->unk16 = SpriteGetScreenPos(ia->x, spriteRegionX);
    displayed->unk18 = SpriteGetScreenPos(ia->y, spriteRegionY);
    displayed->unk4 = VramMalloc(IA_019_NUM_TILES);

    displayed->unkA = gUnknown_080D94D4[gCurrentLevel];

    displayed->unk20 = 0;
    displayed->unk1A = 1152;
    displayed->unk8 = 0;
    displayed->unk14 = 0;
    displayed->unk1C = 0;

    displayed->unk21 = 0xFF;
    displayed->unk22 = 0x10;
    displayed->unk25 = 0;
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
    struct UNK_0808B3FC_UNK240 *displayed = &platform->displayed;
    Interactable *ia = base->ia;
    s16 screenX, screenY;

    screenX = SpriteGetScreenPos(base->spriteX, base->regionX);
    screenY = SpriteGetScreenPos(ia->y, base->regionY);

    displayed->unk16 = screenX - gCamera.unk0;
    displayed->unk18 = screenY - gCamera.unk4;

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

    if ((screenX > gCamera.unk0 + DISPLAY_WIDTH + (CAM_REGION_WIDTH / 2)
         || (screenX < gCamera.unk0 - (CAM_REGION_WIDTH / 2))
         || (screenY > gCamera.unk4 + DISPLAY_HEIGHT + (CAM_REGION_WIDTH / 2))
         || (screenY < gCamera.unk4 - (CAM_REGION_WIDTH / 2)))
        && (IS_OUT_OF_CAM_RANGE(displayed->unk16, (s16)displayed->unk18))) {
        ia->x = base->spriteX;
        TaskDestroy(gCurTask);
    } else {
        sub_80051E8(displayed);
    }
}

void Task_805E35C(void)
{
    Sprite_019 *platform = TaskGetStructPtr(gCurTask);
    struct UNK_0808B3FC_UNK240 *displayed = &platform->displayed;
    Interactable *ia = platform->base.ia;
    s16 screenX, screenY;

    screenX = SpriteGetScreenPos(platform->base.spriteX, platform->base.regionX);
    screenY = SpriteGetScreenPos(ia->y, platform->base.regionY);

    displayed->unk16 = screenX - gCamera.unk0;
    displayed->unk18 = screenY - gCamera.unk4;

    sub_800C060(displayed, screenX, screenY, &gPlayer);

    if ((gGameMode >= GAME_MODE_MULTI_PLAYER)
        && ((s8)ia->x == SPRITE_STATE_UNK_MINUS_THREE)) {
        platform->unk3C = 0;
        gCurTask->main = Task_805E480;
    } else if (platform->unk3C++ > 30) {
        platform->unk3C = 0;
        gCurTask->main = Task_805E480;
    }

    if ((screenX > gCamera.unk0 + DISPLAY_WIDTH + (CAM_REGION_WIDTH / 2)
         || (screenX < gCamera.unk0 - (CAM_REGION_WIDTH / 2))
         || (screenY > gCamera.unk4 + DISPLAY_HEIGHT + (CAM_REGION_WIDTH / 2))
         || (screenY < gCamera.unk4 - (CAM_REGION_WIDTH / 2)))
        && (IS_OUT_OF_CAM_RANGE(displayed->unk16, (s16)displayed->unk18))) {
        ia->x = platform->base.spriteX;
        TaskDestroy(gCurTask);
    } else {
        sub_80051E8(displayed);
    }
}
#if 1
void Task_805E480(void)
{
    Sprite_019 *platform = TaskGetStructPtr(gCurTask);
    struct UNK_0808B3FC_UNK240 *displayed = &platform->displayed;
    Interactable *ia = platform->base.ia;
    s16 screenX, screenY;
    s16 otherPos;
    u8 r6, x, y;
    u16 *oam;

    screenX = SpriteGetScreenPos(platform->base.spriteX, platform->base.regionX);
    screenY = SpriteGetScreenPos(ia->y, platform->base.regionY);

    otherPos = (gCamera.unk4 - screenY) + DISPLAY_HEIGHT;

    displayed->unk16 = screenX - gCamera.unk0;
    displayed->unk18 = screenY - gCamera.unk4;
    platform->unk3C++;

    sub_800C060(displayed, screenX, screenY, &gPlayer);

    if (screenX > gCamera.unk0 + DISPLAY_WIDTH + (CAM_REGION_WIDTH / 2)
        || (screenX < gCamera.unk0 - (CAM_REGION_WIDTH / 2))) {
        if ((u16)(displayed->unk16 + (CAM_REGION_WIDTH / 2))
            > (u16)(DISPLAY_WIDTH + CAM_REGION_WIDTH)) {
            ia->x = platform->base.spriteX;
            TaskDestroy(gCurTask);
            return;
        }
    }
    // _0805E52C
    oam = &gUnknown_03002794->oamData[displayed->unkA][displayed->unkC->unk1 * 3];

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
                    if ((gPlayer.unk20 & MOVESTATE_8) && gPlayer.unk3C == displayed) {
                        gPlayer.unk20
                            = ((gPlayer.unk20 & (~MOVESTATE_8)) | MOVESTATE_IN_AIR);
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
            if (pointer == iwram_end)
                return;

#if NON_MATCHING
            pointer->split.y = (s16)(r4 + ((y * TILE_WIDTH) + displayed->unk18));
            pointer->split.affineMode = ST_OAM_AFFINE_OFF;
            pointer->split.objMode = ST_OAM_OBJ_NORMAL;
            pointer->split.mosaic = 0;
            pointer->split.bpp = ST_OAM_4BPP;
            pointer->split.shape = SPRITE_SHAPE(8x8);
#else
            pointer->all.attr0
                = ((s16)(r4 + ((y * TILE_WIDTH) + displayed->unk18))) & 0xFF;
#endif

            if (displayed->unk10 & 0x400) {
                pointer->all.attr1
                    = ((displayed->unk16 - x * TILE_WIDTH - 8) & 0x1FF) | 0x1000;
            } else {
                // _0805E62C
                pointer->all.attr1 = (displayed->unk16 + x * TILE_WIDTH) & 0x1FF;
            }

            pointer->all.attr2 = (((oam[2] + displayed->unk25) & ~0xFFF)
                                  | ((displayed->unk10 & 0x3000) >> 2)
                                  | (u16)(((u32)(displayed->unk4 - OBJ_VRAM0) >> 5)
                                          + r6)); // (>> 5) = offset -> tilecount?
        }
    }
}
#endif
#if 0 // Matches
void TaskDestructor_Interactable019(struct Task *t)
{
    Sprite_019 *platform = TaskGetStructPtr(t);
    VramFree(platform->displayed.unk4);
}
#endif
