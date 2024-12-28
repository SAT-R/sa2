#include "core.h"
#include "game/game.h"

void AgbMain(void)
{
    EngineInit();
    GameInit();
    EngineMainLoop();
}
