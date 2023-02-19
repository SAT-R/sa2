#include "global.h"
#include "task.h"

#include "interactable.h"

#include "constants/animations.h"
#include "constants/move_states.h"
#include "constants/songs.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ s32 unk3C;
    /* 0x3C */ s32 unk40;
} Sprite_Spikes; /* size: 0x44 */

const u16 sSpikesOfZone[NUM_COURSE_ZONES + 1] = {
    [ZONE_1] = SA2_ANIM_SPIKES, // NOTE: Comment tells formatter to keep this as-is!
    [ZONE_2] = SA2_ANIM_SPIKES,
    [ZONE_3] = SA2_ANIM_SPIKES_MUS_PLA,
    [ZONE_4] = SA2_ANIM_SPIKES,
    [ZONE_5] = SA2_ANIM_SPIKES,
    [ZONE_6] = SA2_ANIM_SPIKES_TEC_BAS,
    [ZONE_7] = SA2_ANIM_SPIKES,
    [ZONE_FINAL] = 0,
};

extern void sub_805F810(void);
extern void sub_805F928(void);
extern bool32 sub_80601F8(Sprite *, Interactable *, Sprite_Spikes *, Player *);
extern bool32 sub_8060440(Sprite *, Interactable *, Sprite_Spikes *, Player *);

void initSprite_Interactable_Spikes_Up(Interactable *ia, u16 spriteRegionX,
                                       u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(sub_805F810, sizeof(Sprite_Spikes), 0x2000, 0, NULL);
    Sprite_Spikes *spikes = TaskGetStructPtr(t);
    Sprite *s = &spikes->s;

    spikes->unk40 = 0;
    spikes->unk3C = 0;
    spikes->base.regionX = spriteRegionX;
    spikes->base.regionY = spriteRegionY;
    spikes->base.ia = ia;
    spikes->base.spriteX = ia->x;
    spikes->base.spriteY = spriteY;

    s->x = SpriteGetScreenPos(ia->x, spriteRegionX);
    s->y = SpriteGetScreenPos(ia->y, spriteRegionY);
    SET_SPRITE_INITIALIZED(ia);

    s->graphics.dest = (void *)(OBJ_VRAM0 + 204 * TILE_SIZE_4BPP);

    s->unk1A = 0x440;
    s->graphics.size = 0;

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        s->graphics.anim = sSpikesOfZone[LEVEL_TO_ZONE(gCurrentLevel)];
    } else {
        s->graphics.anim = SA2_ANIM_SPIKES;
    }

    s->variant = 0;
    s->unk14 = 0;
    s->unk1C = 0;
    s->unk21 = 0xFF;
    s->unk22 = 0x10;
    s->focused = 0;
    s->unk28->unk0 = -1;
    s->unk10 = 0x2200;
    sub_8004558(s);
}

void initSprite_Interactable_Spikes_Down(Interactable *ia, u16 spriteRegionX,
                                         u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(sub_805F928, sizeof(Sprite_Spikes), 0x2000, 0, NULL);
    Sprite_Spikes *spikes = TaskGetStructPtr(t);
    Sprite *s = &spikes->s;

    spikes->unk40 = 0;
    spikes->unk3C = 0;
    spikes->base.regionX = spriteRegionX;
    spikes->base.regionY = spriteRegionY;
    spikes->base.ia = ia;
    spikes->base.spriteX = ia->x;
    spikes->base.spriteY = spriteY;

    s->x = SpriteGetScreenPos(ia->x, spriteRegionX);
    s->y = SpriteGetScreenPos(ia->y, spriteRegionY);
    SET_SPRITE_INITIALIZED(ia);

    s->graphics.dest = (void *)(OBJ_VRAM0 + 204 * TILE_SIZE_4BPP);

    s->unk1A = 0x440;

    s->graphics.anim = sSpikesOfZone[LEVEL_TO_ZONE(gCurrentLevel)];

    s->variant = 0;
    s->unk14 = 0;
    s->unk1C = 0;
    s->unk21 = 0xFF;
    s->unk22 = 0x10;
    s->focused = 0;
    s->unk28->unk0 = -1;
    s->unk10 = 0x2A00;
    sub_8004558(s);
}

void sub_805F810(void)
{
    Sprite_Spikes *spikes = TaskGetStructPtr(gCurTask);
    Sprite *s = &spikes->s;
    Interactable *ia = spikes->base.ia;
    s16 screenX, screenY;

    screenX = SpriteGetScreenPos(spikes->base.spriteX, spikes->base.regionX);
    screenY = SpriteGetScreenPos(ia->y, spikes->base.regionY);

    s->x = screenX - gCamera.x;
    s->y = screenY - gCamera.y;

    if (!(gUnknown_03005424 & EXTRA_STATE__GRAVITY_INVERTED)) {
        sub_80601F8(s, ia, spikes, &gPlayer);
    } else {
        sub_8060440(s, ia, spikes, &gPlayer);
    }

    if ((gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) && (ia->d.sData[0] == 0)
        && (gUnknown_030053E0 == 0)) {
        if (spikes->unk3C & 0xC0000) {
            gPlayer.moveState &= ~MOVESTATE_20;
        }

        if (spikes->unk3C & 0x10000) {
            gPlayer.moveState &= ~MOVESTATE_8;
        }
    }

    if (IS_OUT_OF_RANGE_OLD(u16, s->x, s->y, (CAM_REGION_WIDTH))) {
        ia->x = spikes->base.spriteX;
        TaskDestroy(gCurTask);
    } else {
        if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
            sub_8004558(s);
        }
        sub_80051E8(s);
    }
}