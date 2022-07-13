#include "global.h"
#include "sound_test.h"
#include "profile.h"
#include "task.h"
#include "data.h"
#include "m4a.h"

struct SoundTestScreen_UNK718 {
    u32 unk0;
    u8 filler4[4];
};

struct SoundTestScreen {
    struct OptionsScreen* optionsScreen;
    struct UNK_802D4CC_UNK270 unk4;
    struct UNK_3005B80_UNK4 unk10;

    u8 filler46[560];
    void* unk278;
    u8 filler27C[92];
    void* unk2D8;
    u8 filler2DC[1056];

    u8 unk6FC;
    u8 unk6FD[3];

    u32 unk700;
    u32 unk704;
    u8 unk708;
    u8 unk709;

    u8 filler70A;

    u8 unk70B;
    u8 unk70C;
    u8 unk70D;
    u16 unk70E;
    u16 unk710;
    u8 unk712;

    u8 filler713[5];

    void* unk718[8];
    void* unk738[8];
    u8 unk758;

    u8 filler759[3];
}; /* size 0x75C */

void sub_808AF74(void);
void sub_808B2B0(struct Task* t);
void sub_808B2F4(struct Task* t);
void sub_808A3B4(struct Task* t);

extern const u8 gUnknown_080E0C38[12];
extern const u8 gUnknown_08C8796C[140];

void CreateSoundTestScreen(struct OptionsScreen* optionsScreen) {
    struct Task* t = TaskCreate(sub_808AF74, 0x75C, 0x1800, TASK_x0004, sub_808B2B0);
    struct SoundTestScreen* soundTestScreen = TaskGetStructPtr(t, soundTestScreen);
    struct UNK_802D4CC_UNK270* unk4;
    struct UNK_3005B80_UNK4* unk10;
    u32 i;
    
    
    unk4 = &soundTestScreen->unk4;
    unk10 = &soundTestScreen->unk10;
    m4aMPlayAllStop();

    soundTestScreen->optionsScreen = optionsScreen;
    soundTestScreen->unk6FC = 0;
    soundTestScreen->unk700 = 0;
    soundTestScreen->unk704 = 0x10000;
    soundTestScreen->unk70B = 1;
    soundTestScreen->unk709 = 0;
    soundTestScreen->unk708 = 0;
    soundTestScreen->unk2D8 = &soundTestScreen->unk278;
    soundTestScreen->unk70C = 0;
    soundTestScreen->unk70D = 0;
    soundTestScreen->unk70E = 0;
    soundTestScreen->unk710 = 0;
    soundTestScreen->unk712 = 0;
    soundTestScreen->unk758 = optionsScreen->language;
        
    for (i = 0; i < 8; i++) {
        soundTestScreen->unk718[i] = NULL;
        soundTestScreen->unk738[i] = NULL;
    }

   ResetProfileScreensVram();
    sub_808B2F4(t);
    sub_808A3B4(t);
   
    unk4->unk0 = 0;
    unk4->unk2 = 2;
    unk4->unk4 = 0;
    unk4->unk6 = 0x100;
    unk4->unkA = 0;
    unk4->unk8 = 0xff;

    unk10->unk0 = 0;
    unk10->unk2 = 0;
    unk10->unkC = 1;
    unk10->unkD = 1;
    unk10->unkE = 1;
    unk10->unk1 = 0;

    unk10->unk4 = gUnknown_080E0C38;
    unk10->unk8 = gUnknown_08C8796C;

    unk10->unk34 = 0;

    gUnknown_03005B80.unk0 = unk10;
}
