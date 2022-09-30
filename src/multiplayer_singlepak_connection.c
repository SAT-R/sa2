#include "global.h"
#include "main.h"
#include "game.h"
#include "multiplayer_singlepak_connection.h"
#include "multiplayer_mode_select.h"
#include "task.h"
#include "sprite.h"
#include "save.h"
#include "title_screen.h"
#include "transition.h"
#include "m4a.h"

void sub_8081200(void) {
    u8 i;
    u8* gameMode = &gGameMode;
    u8 val = 5;
    
    gUnknown_030059D8 = 0;
    gUnknown_03005844 = NULL;
    gUnknown_03005848 = 0;
    gUnknown_030059E0.unk8C = 0;
    gUnknown_03005960.unk5C = 0;
    gUnknown_0300543C = 0;
    *gameMode = val;
    gUnknown_030054DC = 0;

    for (i = 0; i < 4; i++) {
        gUnknown_030055A0[i] = NULL;
    };

    sub_801A6D8();
    gUnknown_03005424 &= ~0x1;
    gUnknown_030059E0.unk20 &= ~0x200000;
    gUnknown_030059E0.unk5C |= gUnknown_03005B38.unk0 | gUnknown_03005B38.unk2;
}
