#include "core.h"
#include "game/init.h"

void AgbMain(void)
{
    GameInit();
    GameStart();
    GameLoop();
}
