#ifndef GUARD_SPECIAL_STAGE_UTILS_H
#define GUARD_SPECIAL_STAGE_UTILS_H

#include "global.h"

void* gUnknown_03005B58;
void* gUnknown_03005B5C;

#define ResetSpecialStageScreenVram() ({ \
    gUnknown_03005B5C = (void*)OBJ_VRAM0; \
    gUnknown_03005B58 = NULL; \
})

#define ResetSpecialStateScreenSubMenuVram() ({ \
    gUnknown_03005B58 = NULL; \
})

#define RENDER_TARGET_SCREEN 0
#define RENDER_TARGET_SUB_MENU 1

void sub_806CA88(struct UNK_0808B3FC_UNK240* obj, s8 target, u32 size, u16 c, u32 assetId, s16 xPos, s16 yPos, u16 g, u8 h, u8 focused);
void sub_806CEC4(struct Unk_03002400* background, u32 a, u32 b, u8 assetId, u16 d, u16 e, u16 f, u8 g, u16 h, u16 i);

#endif
