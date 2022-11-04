#ifndef GUARD_SPECIAL_STAGE_PLAYER_H
#define GUARD_SPECIAL_STAGE_PLAYER_H

#include "global.h"
#include "special_stage.h"

// Player
struct UNK_806CF78 {
    struct SpecialStage* unk0;
    void* unk4;
    struct UNK_0808B3FC_UNK240 unk8;
    struct UNK_0808B3FC_UNK240 unk38;
    struct UNK_0808B3FC_UNK240 unk68;

    // vram stuff
    void* unk98;
    void* unk9C;
    void* unkA0;

    s16 unkA4;
    u8 unkA6;

    s32 unkA8;
    s32 unkAC;

    s16 unkB0;
    u16 unkB2;

    u16 unkB4;
    s16 unkB6;

    s16 unkB8;

    s16 unkBA;
  
    s16 unkBC;  
    s16 unkBE;

    s16 unkC0;
    u16 unkC2;

    // sprites
    const struct UNK_80DF670* unkC4;
    
    s32 unkC8;
    u32 unkCC;
    u32 unkD0;
    u32 unkD4;
    u32 unkD8;
    
    s32 unkDC;
    s32 unkE0;
    s32 unkE4;
    u32 unkE8;

    u16 unkEC;
    u16 unkEE;
    s16 unkF0;
    s16 unkF2;
    s16 unkF4;
    s16 unkF6;
    s16 unkF8;
    s16 unkFA;
    s16 unkFC;
    s16 unkFE;
    s32 unk100;
    s32 unk104;
}; /* size 0x108 */

struct Task* sub_806CF78(struct SpecialStage*);

#endif
