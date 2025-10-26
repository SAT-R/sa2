#ifndef GUARD_SCREEN_MASK_H
#define GUARD_SCREEN_MASK_H

#include "global.h"

void ScreenMask_Right_OriginBottom(s32 qX, u16);
void ScreenMask_Right_OriginTop(s32 qX, u16);
void ScreenMask_Lower_OriginLeft(int_vcount y, u16 angle);
void ScreenMask_Upper_OriginLeft(int_vcount y, u16 angle);
void ScreenMask_Lower_OriginRight(int_vcount y, u16 angle);
void ScreenMask_Upper_OriginRight(int_vcount y, u16 angle);

void ScreenMask_CreateShape(u16, u16 width, u16, s16 x, s16 y, u8);

#endif // GUARD_SCREEN_MASK_H