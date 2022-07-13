#ifndef GUARD_UI_H
#define GUARD_UI_H

#include "global.h"
#include "sprite.h"

struct UNK_080D95E8 {
    u16 unk0;
    u16 unk2;
    u16 unk4;
};

struct UNK_806B908 {
    u32 unk0;
    u16 unk4;
    u16 unk6;
};

void sub_806B854(struct Unk_03002400*, u32, u32, u8, u16, u16, u16, u8, u16, u16);
s32 MaxSpriteSize(const struct UNK_080D95E8*, s8);
struct UNK_806B908 sub_806B908(u16);
bool16 sub_806B9C8(u16);
bool16 sub_806BA14(s16, u16);
bool16 sub_806B988(u16*);

#endif