#include "global.h"
#include "sprite.h"
#include "ui.h"
#include "save.h"

extern const u16 gUnknown_080D95D2[2];
extern const u16 gUnknown_080D95D6[8];
extern const u16 gUnknown_080D95C4[2];
extern const u16 gUnknown_080D95C8[5];
extern const u16 gUnknown_080D95A4[16];

void sub_806B854(struct Unk_03002400* unk2400, u32 a, u32 b, u8 assetId, u16 d, u16 e, u16 f, u8 g, u16 h, u16 i) {
    unk2400->unk4 = BG_CHAR_ADDR(a);
    unk2400->unkA = 0;
    unk2400->unkC = BG_SCREEN_ADDR(b);
    unk2400->unk18 = 0;
    unk2400->unk1A = 0;
    unk2400->unk1C = assetId;
    unk2400->unk1E = 0;
    unk2400->unk20 = 0;
    unk2400->unk22 = 0;
    unk2400->unk24 = 0;
    unk2400->unk26 = d;
    unk2400->unk28 = e;
    unk2400->unk2A = f;
    unk2400->unk2B = 0;
    unk2400->unk2C = 0;
    unk2400->unk2E = g;
    unk2400->unk30 = h;
    unk2400->unk32 = i;
    sub_8002A3C(unk2400);
}

// Finds the max unk4 of the item text array
s32 MaxSpriteSize(const struct UNK_080D95E8* itemText, s8 length) {
    s32 result = 0;
    s16 i;

    for (i = 0; i < length; i++, itemText++) {
        if (itemText->unk4 > result) {
            result = itemText->unk4;
        }
    }

    return result;
}

struct UNK_806B908 sub_806B908(u16 nameChar) {
    struct UNK_806B908 charTile;
    
    if (nameChar >= 0x10C) {
        charTile.unk4 = 0x3BB;
        charTile.unk6 = 0x11;
    } else {
        if ((nameChar & 0x100)) {
            charTile.unk4 = 0x3C3;
        } else {
            charTile.unk4 = 0x3BB;
        }

        charTile.unk6 = nameChar & 0xFF;   
    }

    charTile.unk0 = 4;

    return charTile;
}

bool16 sub_806B988(u16* playerName) {
    s16 i;

    for (i = 0; i < MAX_PLAYER_NAME_LENGTH; i++) {
        if (playerName[i] == PLAYER_NAME_END_CHAR) {
            return FALSE;
        }

        if (sub_806B9C8(playerName[i])) {
            return TRUE;
        }
    }

    return FALSE;
}

bool16 sub_806B9C8(u16 nameChar) {
    u16 localD95A4[16], *cursor;  
    memcpy(localD95A4, gUnknown_080D95A4, sizeof(gUnknown_080D95A4));
    
    for (cursor = localD95A4; *cursor != PLAYER_NAME_END_CHAR; cursor++) {
        if (nameChar == *cursor) {
            return FALSE;
        }
    }

    if (nameChar >= 0x10C) {
        return FALSE;
    } else {
        return TRUE;
    }
}

bool16 sub_806BA14(s16 a, u16 b) {
    u16 unk5C4[2], unk5C8[5], *cursor; 

    memcpy(unk5C4, gUnknown_080D95C4, sizeof(gUnknown_080D95C4));
    memcpy(unk5C8, gUnknown_080D95C8, sizeof(gUnknown_080D95C8));

    if (a == 1) {
        cursor = unk5C8;
    } else {
        cursor = unk5C4;
    }

    if (a == 1 && b == 2) {
        return TRUE;
    }

    for (; *cursor != PLAYER_NAME_END_CHAR; cursor++) {
        if (b >= *cursor && b <= *cursor + 4) {
            return TRUE;
        }
    }

    return FALSE;
}
