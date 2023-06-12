#include "global.h"
#include "core.h"
#include "game/game.h"
#include "game/multiplayer/unknown_1.h"
#include "game/stage/entities_manager.h"

struct UNK_3005510 *sub_8019224(void)
{
    struct UNK_3005510 *result = &gUnknown_03005510[gUnknown_03005438];

    gUnknown_03005438 = (gUnknown_03005438 + 1) & 0xF;
    
    return result;
}

#if 0
void sub_8019240(union MultiSioData *msioData, u32 someId)
{
    if(gEntitiesManagerTask != NULL) {

    }
}
#endif