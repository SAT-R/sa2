#ifndef GUARD_OPTION_SCREEN_H
#define GUARD_OPTION_SCREEN_H

#include "global.h"
#include "save.h"
#include "sprite.h"

struct UNK_8063730_UNK0 {
    // playerName
    u16 unk0[6];

    // timeRecords
    struct TimeRecords unkC;
    
    struct SectorDataUnk2A4 unk284[10];

    u8 unk34C;
    u8 unk34D;
    u8 unk34E;

    u8 filler34F;

    struct SaveGameUnk2C unk350; /* size 0x8 */
};

// OptionsScreen
struct UNK_8063730 {
    // profileData
    struct UNK_8063730_UNK0 unk0;

    u8 unk358;
    u8 unk359;
    u8 unk35A;

    // language
    u8 unk35B;
    
    // isSoundTestUnlocked
    u8 unk35C;

    u8 unk35D;
    u8 unk35E;

    u8 filler35F;

    s16 unk360;
    s16 unk362;
    struct Unk_03002400 unk364;
    struct Unk_03002400 unk3A4;
    struct UNK_0808B3FC_UNK240 unk3E4;
    struct UNK_0808B3FC_UNK240 unk414[8];
    struct UNK_0808B3FC_UNK240 unk594[4];
    struct UNK_0808B3FC_UNK240 unk654[6];
    struct UNK_802D4CC_UNK270 unk774;
    s8 unk780;
    s8 unk781;
    s8 unk782;
    s8 unk783;
    s8 unk784;

    u8 filler785[3];
}; /* size 0x788 */


// CreateOptionsScreen
void sub_8063730(u16);

// CreateZoneSectionScreen
void sub_80637EC(u16, u16);

void sub_8063940_CreateProfileScreen();

// CreateProfileNameScreen
void sub_8063A00(s16);

#endif // GUARD_OPTION_SCREEN_H
