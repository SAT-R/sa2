#include "global.h"
#include "main.h"
#include "game.h"
#include "sprite.h"
#include "transition.h"
#include "task.h"
#include "cut_scenes.h"
#include "malloc_vram.h"

struct ResultsCutScene {
    struct SomeStruct_59E0 *unk0;
    struct UNK_0808B3FC_UNK240 unk4;
    struct UNK_0808B3FC_UNK240 unk34;
    struct UNK_802D4CC_UNK270 unk64;
    u16 unk70;
    u16 unk72;
    u16 unk74;
    u16 unk76;
    u16 unk78;
    u8 unk7A;
    u8 unk7B;
    u8 unk7C;
};

extern const TaskMain gUnknown_080E1208[3];
extern const u16 gUnknown_080E1214[3][2];
extern const u16 gUnknown_080E1220[3][2];

extern const u32 gUnknown_080E11E4[3][3];

void sub_808E890(void);

// void CreateCourseResultsCutScene(u32 mode)
// {
//     u16 unk1214[3][2];
//     u16 unk1220[3][2];
//     TaskMain mains[3];
//     struct Task *t;
//     struct ResultsCutScene *scene;
//     struct UNK_0808B3FC_UNK240 *element;
//     memcpy(gUnknown_080E1208, mains, 6);
//     memcpy(gUnknown_080E1214, unk1214, 6);
//     memcpy(gUnknown_080E1220, unk1220, 6);

//     t = TaskCreate(mains[mode], 0x80, 0x5000, 0, sub_808E890);

//     scene->unk70 = unk1214[mode][0];
//     scene->unk72 = unk1214[mode][1];

//     scene->unk74 = unk1220[mode][0];
//     scene->unk76 = unk1220[mode][1];

//     scene->unk0 = &gPlayer;

//     element = &scene->unk4;

//     element->unk4 = VramMalloc(gUnknown_080E11E4[mode][0]);
//     element->unkA = gUnknown_080E11E4[mode][1];
//     element->unk20 = gUnknown_080E11E4[mode][2];
// }
