#include "global.h"
#include "task.h"

#include "interactable.h"

#include "constants/animations.h"
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

    } else {
        s->graphics.anim = SA2_ANIM_SPIKES;
    }
}