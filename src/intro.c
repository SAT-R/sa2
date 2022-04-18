#include "global.h"
#include "intro.h"
#include "flags.h"
#include "task.h"
#include "m4a.h"

extern struct UNK_3005B80 gUnknown_03005B80;

extern u8 gUnknown_080E0EF4[0x160];
extern u8 gUnknown_080E1054[10];

void sub_808D598(void);
void sub_808B768(struct UNK_0808B3FC*);
void sub_802D4CC(struct UNK_0808B3FC_UNK270*);

void sub_808B3FC_CreateIntro(void) {
    struct Task* t;
    struct UNK_0808B3FC* introConfig;
    struct UNK_0808B3FC_UNK270* config270;
    struct UNK_0808B3FC_UNK27C* config27C;
    s32 i, val, res;
    u16 unknownWaveAttr;

    t = TaskCreate(sub_808D598, sizeof(struct UNK_0808B3FC), 0x1000, 0, NULL);
    introConfig = TaskGetStructPtr(t, introConfig);

    introConfig->unkF34 = 0x200;
    introConfig->unkF36 = 0x100;
    introConfig->unkF38 = 2;
    
    introConfig->unkF42 = 0;
    introConfig->unkF40 = 0;
    
    introConfig->unkF3E = 0;
    introConfig->unkF3A = 0x20;
    
    introConfig->unkF3C = 0;
    introConfig->unkF3D = 1;

    // Generate the wave effects
    for (i = 0; i < 0xA0; i++) {
        res = Div(0x10000, (i + 1) * 8);
        unknownWaveAttr = introConfig->unkF34;
        
        val = ((s16)res * unknownWaveAttr) >> 8;
        introConfig->unk2B4[i] = val;
        introConfig->unkDF4[i] = Div(0x10000, val);
    };

    config270 = &introConfig->unk270;
    config270->unk0 = 1;
    config270->unk4 = 0;
    config270->unk2 = 2;
    config270->unk6 = 0x100;
    config270->unk8 = 0x3FBF;
    config270->unkA = 0;

    config27C = &introConfig->unk27C;
    config27C->unk0 = 0;
    config27C->unk2 = 0;
    config27C->unk34 = introConfig->unkF38;
    config27C->unk1 = 0xE;
    config27C->unk4 = gUnknown_080E1054;
    config27C->unk8 = gUnknown_080E0EF4;
    config27C->unk36 = 0;
    
    gUnknown_03005B80.unk0 = config27C;
    gUnknown_03005B80.unk4 = introConfig;
    
    sub_808B768(introConfig);
    m4aSongNumStart(1);
    gFlags |= 0x8000;
    
    sub_802D4CC(config270);
}
