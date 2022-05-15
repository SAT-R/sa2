#include "global.h"
#include "profile.h"
#include "m4a.h"
#include "task.h"
#include "input.h"
#include "constants/songs.h"

extern void* gUnknown_03005B50;
extern u32 gUnknown_03005B54;
struct UNK_8063730 {
    u8 filler0[0x358];
    u8 unk358;
    u8 unk359[7];
    u16 unk360;
    u8 filler362[0X41E];
    u8 unk780;
    u8 unk781;
    u8 unk782;
    u8 unk783;
    u8 filler784[4];
}; /* size 0x788 */

// CharacterSelection stuff
extern void sub_806A75C(void);
extern void sub_806A758(struct Task*);
extern void sub_8063B38(struct UNK_8063730*);

// CreateOptionsScreen
void sub_8063730(u16 p1) {
    struct Task* t;
    struct UNK_8063730* optionsScreen;
    s16 i;


    m4aSongNumStart(9);

    t = TaskCreate(sub_806A75C, 0x788, 0x1000, 4, sub_806A758);
    optionsScreen = TaskGetStructPtr(t, optionsScreen);

    sub_8063B38(optionsScreen);

    optionsScreen->unk358 = p1;
    optionsScreen->unk360 = 0;
    optionsScreen->unk781 = 0;
    optionsScreen->unk783 = 0;
    optionsScreen->unk780 = 0;
    optionsScreen->unk782 = 0xFF;

    gUnknown_03005B50 = (void*)OBJ_VRAM0;
    gUnknown_03005B54 = 0;

    for (i = 0; i < 10; i++) {
        gKeysFirstRepeatIntervals[i] = 20;
        gKeysContinuedRepeatIntervals[i] = 8;
    }
}
