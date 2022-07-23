#include "global.h"
#include "multiplayer.h"
#include "save.h"
#include "data.h"
#include "multi_sio.h"
#include "task.h"
#include "sprite.h"
#include "malloc_vram.h"

struct MultiplayerModeScreen {
    struct Unk_03002400 unk0;
    struct Unk_03002400 unk40;

    struct UNK_0808B3FC_UNK240 unk80;
    struct UNK_0808B3FC_UNK240 unkB0;
    struct UNK_0808B3FC_UNK240 unkE0;
    struct UNK_0808B3FC_UNK240 unk110;

    struct UNK_802D4CC_UNK270 unk140;
    u8 unk14C;
    u8 unk14D;
    u8 unk14E;
};

void sub_805A9B0(void);
void sub_805AA94(void);
