#ifndef GUARD_SPECIAL_STAGE_UTILS_H
#define GUARD_SPECIAL_STAGE_UTILS_H

#include "global.h"
#include "game/special_stage/main.h"
#include "game/special_stage/data.h"
#include "sprite.h"

extern void *gSpecialStageSubMenuVramPointer;
extern void *gSpecialStageVramPointer;

#define ResetSpecialStateScreenSubMenuVram() ({ gSpecialStageSubMenuVramPointer = NULL; })

#define RENDER_TARGET_SCREEN   0
#define RENDER_TARGET_SUB_MENU 1

void sub_806CA88(Sprite *obj, s8 target, u32 size, u16 anim, u32 frameFlags, s16 xPos, s16 yPos, u16 g, u8 h, u8 palId);
void SpecialStageDrawBackground(Background *background, u32 a, u32 b, u8 assetId, u16 d, u16 e, u16 f, u8 g, u16 scrollX, u16 scrollY);
bool16 SpecialStageCalcEntityScreenPosition(struct UNK_806CB84 *a, struct SpecialStageCollectables_UNK874_2 *unk874,
                                            struct SpecialStage *stage);
void sub_806CD68(Sprite *element);
void InitSpecialStageScreenVram(void);
s16 MaxSpriteSize(const struct UNK_80DF670 *spriteConfig);

#endif
