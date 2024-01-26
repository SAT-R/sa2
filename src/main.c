#include "core.h"
#include "game/game.h"

void AgbMain(void)
{
    GameInit();
    GameStart();
    GameLoop();
}
