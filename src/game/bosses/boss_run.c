#include "sakit/globals.h"

#include "game/stage/player.h"
#include "game/stage/camera.h"

#include "game/cheese.h"

void sub_8049D1C(struct Task *);
void sub_80499D8(void);

typedef struct {
    u16 unk0;
    u16 unk2;
    u8 unk4;
    u8 unk5;
    u8 unk6;
} UNK_80498CC;

extern const u16 gUnknown_080D87E6[][2];

void sub_80498CC(u8 bossNum)
{
    struct Task *t = TaskCreate(sub_80499D8, 8, 0x4000, 0, sub_8049D1C);
    UNK_80498CC *unk8CC = TASK_DATA(t);
    unk8CC->unk4 = bossNum;
    unk8CC->unk5 = 0;
    unk8CC->unk6 = 0;
    unk8CC->unk0 = gUnknown_080D5964[unk8CC->unk4][0];
    unk8CC->unk2 = gUnknown_080D5964[unk8CC->unk4][1];

    gUnknown_03005440 = gUnknown_080D5964[unk8CC->unk4][0];
    gUnknown_030054BC = gUnknown_080D5964[unk8CC->unk4][1];

    if (bossNum != 0) {
        s32 x, y;
        Cheese *cheese;
        Player_DisableInputAndBossTimer();

        gPlayer.speedGroundX = 0x500;

        // ???
        x = gUnknown_080D87E6[bossNum - 1][0] - I(gPlayer.x);
        y = gUnknown_080D87E6[bossNum][1] - I(gPlayer.y);
        gPlayer.x += Q(x);
        gPlayer.y += Q(y);

        gCamera.x += x - 0x78;
        gCamera.y += y - 0x78;

        gCamera.unk20 += x - 0x78;
        gCamera.unk24 += y - 0x78;
        gCamera.unk10 += x - 0x78;
        gCamera.unk14 += y - 0x78;

        cheese = gCheese;
        if (cheese != NULL) {
            cheese->posX += Q(x);
            cheese->posY += Q(y);
        }
        unk8CC->unk4--;
    }
}
