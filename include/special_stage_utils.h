#ifndef GUARD_SPECIAL_STAGE_UTILS_H
#define GUARD_SPECIAL_STAGE_UTILS_H

#include "global.h"
#include "special_stage.h"
#include "special_stage_data.h"
#include "sprite.h"

extern void *gUnknown_03005B58;
extern void *gUnknown_03005B5C;

#define ResetSpecialStateScreenSubMenuVram() ({ gUnknown_03005B58 = NULL; })

#define RENDER_TARGET_SCREEN   0
#define RENDER_TARGET_SUB_MENU 1

void sub_806CA88(Sprite *obj, s8 target, u32 size, u16 c, u32 assetId, s16 xPos,
                 s16 yPos, u16 g, u8 h, u8 focused);
void sub_806CEC4(Background *background, u32 a, u32 b, u8 assetId, u16 d, u16 e, u16 f,
                 u8 g, u16 h, u16 i);
bool16 sub_806CB84(struct UNK_806CB84 *a,
                   struct SpecialStageCollectables_UNK874_2 *unk874,
                   struct SpecialStage *stage);
void sub_806CD68(Sprite *element);
void InitSpecialStageScreenVram(void);
s16 MaxSpriteSize(const struct UNK_80DF670 *spriteConfig);

#endif
