#include "core.h"
#include "game/special_stage/main.h"
#include "game/special_stage/world.h"
#include "game/special_stage/utils.h"
#include "game/special_stage/data.h"
#include "sprite.h"
#include "data/sprite_data.h"
#include "trig.h"

void *gUnknown_03005B58 = NULL;
void *gUnknown_03005B5C = NULL;

// Copied from `options.c` so contains some of that submenu logic
void sub_806CA88(Sprite *obj, s8 target, u32 size, AnimId anim, u32 frameFlags, s16 xPos, s16 yPos, u16 oamOrder, u8 variant, u8 palId)
{
    Sprite newObj;
    Sprite *s;
    s = &newObj;

    if (obj != NULL) {
        s = obj;
    }

    if (target != 0) {
        if (gUnknown_03005B58 == NULL) {
            gUnknown_03005B58 = gUnknown_03005B5C;
        }
        s->graphics.dest = gUnknown_03005B58;
    } else {
        s->graphics.dest = gUnknown_03005B5C;
    }

    s->graphics.size = 0;
    s->graphics.anim = anim;
    s->frameFlags = frameFlags;
    s->x = xPos;
    s->y = yPos;
    s->oamFlags = SPRITE_OAM_ORDER(oamOrder);
    s->qAnimDelay = 0;
    s->prevAnim = -1;
    s->variant = variant;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = palId;
    s->hitboxes[0].index = -1;

    UpdateSpriteAnimation(s);

    switch (target) {
        case RENDER_TARGET_SCREEN:
            gUnknown_03005B5C += size * TILE_SIZE_4BPP;
            // if we render to screen then the sub menu address should reset
            ResetSpecialStateScreenSubMenuVram();
            break;
        case RENDER_TARGET_SUB_MENU:
            gUnknown_03005B58 += size * TILE_SIZE_4BPP;
            break;
    }
}

// TODO: SpecialStageCollectables_UNK874 is probably it's own type
bool16 SpecialStageCalcEntityScreenPosition(struct UNK_806CB84 *a, struct SpecialStageCollectables_UNK874_2 *unk874,
                                            struct SpecialStage *stage)
{
    struct SpecialStageWorld *world;
    s32 r9;
    s32 r4;
    s16 val2, val;

#ifdef BUG_FIX
    // worldTask can sometimes be NULL when directly calling Special Stage code
    if (stage->worldTask == NULL) {
        return FALSE;
    }
#endif

    world = TASK_DATA(stage->worldTask);

    {
        u16 deg = -stage->cameraRotX & ONE_CYCLE;
        s32 r2 = SIN(deg) * 4;
        s32 r5 = COS(deg) * 4;
        s32 temp_r4 = (-unk874->unk0 + stage->q16CameraX);
        s32 r3 = (-unk874->unk4 + stage->q16CameraY);
        r9 = ((I(r2) * I(r3)) + (I(r5) * I(temp_r4))) >> 2;
        r4 = ((I(-r2) * I(temp_r4)) + (I(r5) * I(r3))) >> 1;
    }

    {
        s32 unk590 = stage->unk94[DISPLAY_HEIGHT - 1][1];
        s32 unk94 = stage->unk94[stage->horizonHeight][1];

        if (r4 <= unk590 || r4 >= unk94) {
            return FALSE;
        }
    }

    val2 = stage->viewDistance;
    val = stage->unk5D3;

    while (val2 != 0) {
        if (val >= DISPLAY_HEIGHT) {
            val -= val2 >> 1;
        } else if (val < stage->horizonHeight) {
            val += val2 >> 1;
        } else if (stage->unk94[val][1] > r4) {
            val += val2 >> 1;
        } else if (stage->unk94[val][1] < r4) {
            val -= val2 >> 1;
        } else {
            val = val2;
            break;
        }
        val2 >>= 1;
    }

    {
        s32 r2 = (-(stage->unk94[val][0] >> 1) * 9) >> 3;
        s32 r8 = (+(stage->unk94[val][0] >> 1) * 9) >> 3;

        if (r9 <= r2 || r9 >= r8) {
            return FALSE;
        }
        a->unkA = val;
        a->screenY = (a->unkA - unk874->unkE) - (Q_16_16(unk874->unk12) / world->qPerspectiveTable[val]);
        a->unk8 = ((DISPLAY_WIDTH / 2) - ((r9 * ((DISPLAY_WIDTH / 2) + 15)) / r8));
        a->screenX = a->unk8 - unk874->unkC;
        if (unk874->unk8 != 0) {
            a->unk6 = (((unk874->unk8 * 8) / world->qPerspectiveTable[val]) * 9) >> 2;
        } else {
            a->unk6 = 0;
        }

        a->unkC = I(world->qPerspectiveTable[val]); // scaleX?
        a->unk12 = a->unkC; // scaleY?

        a->unk10 = 0;
        a->unkE = 0;
    }

    return TRUE;
}

void sub_806CD68(Sprite *s)
{
    const u16 *oamTemplate;
    OamData *oam;
    u32 sx, sy;
    u16 sprHeight;
    u16 sprWidth;
    s16 numSubframes;

    s16 i;
    const SpriteOffset *sprDims = s->dimensions;

    s->numSubFrames = sprDims->numSubframes;
    sprWidth = sprDims->width;
    sprHeight = sprDims->height;
    sx = (s16)s->x - (sprWidth / 2);
    sy = (s16)s->y - (sprHeight / 2);

    numSubframes = sprDims->numSubframes;
    for (i = 0; i < numSubframes; i++) {
        u32 x;
        oamTemplate = gRefSpriteTables->oamData[s->graphics.anim];

        oam = OamMalloc(GET_SPRITE_OAM_ORDER(s));
        if (oam == iwram_end) {
            return;
        }

        if (i == 0) {
            s->oamBaseIndex = gOamFreeIndex - 1;
        }

        DmaCopy16(3, &oamTemplate[(sprDims->oamIndex + i) * OAM_DATA_COUNT_NO_AFFINE], oam, OAM_DATA_SIZE_NO_AFFINE);
#if !EXTENDED_OAM
        x = oam->all.attr1 & 0x1FF;
        oam->all.attr0 = (sy + (oam->all.attr0 & 0xff)) & 0xff;
        oam->all.attr0 |= 0x300;
        oam->all.attr1 &= 0xfe00;
        oam->all.attr1 |= (SPRITE_FLAG_GET(s, ROT_SCALE) << 9);
        oam->all.attr1 |= ((sx + x) & 0x1ff);
        oam->all.attr2 += s->palId << 12;
        oam->all.attr2 |= (SPRITE_FLAG_GET(s, PRIORITY) << 10);
        oam->all.attr2 += GET_TILE_NUM(s->graphics.dest);
#else
        x = oam->split.x;
        oam->split.y += sy;
        oam->split.mosaic = 1;
        oam->split.bpp = 1;
        oam->split.matrixNum = SPRITE_FLAG_GET(s, ROT_SCALE);
        oam->split.x = sx + x;
        oam->split.paletteNum += s->palId;
        oam->split.priority = SPRITE_FLAG_GET(s, PRIORITY);
        oam->split.tileNum += GET_TILE_NUM(s->graphics.dest);
#endif
    }
}

void InitSpecialStageScreenVram(void)
{
    gUnknown_03005B5C = (void *)OBJ_VRAM0;
    gUnknown_03005B58 = NULL;
}

void SpecialStageDrawBackground(Background *background, u32 a, u32 b, u8 tilemapId, u16 d, u16 e, u16 palOffset, u8 bg_id, u16 scrollX,
                                u16 scrollY)
{
    background->graphics.dest = (void *)BG_CHAR_ADDR(a);
    background->graphics.anim = 0;
    background->layoutVram = (void *)BG_SCREEN_ADDR(b);
    background->unk18 = 0;
    background->unk1A = 0;
    background->tilemapId = tilemapId;
    background->unk1E = 0;
    background->unk20 = 0;
    background->unk22 = 0;
    background->unk24 = 0;
    background->targetTilesX = d;
    background->targetTilesY = e;
    background->paletteOffset = palOffset;
    background->animFrameCounter = 0;
    background->animDelayCounter = 0;
    background->flags = (bg_id);
    background->scrollX = scrollX;
    background->scrollY = scrollY;
    DrawBackground(background);
}

s16 MaxSpriteSize(const struct UNK_80DF670 *spriteConfig)
{
    s16 result = 0;

    while (spriteConfig->anim != (u16)-1) {
        if (result < spriteConfig->size) {
            result = spriteConfig->size;
        }
        spriteConfig++;
    }

    return result;
}
