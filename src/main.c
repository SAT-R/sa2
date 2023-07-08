#include "core.h"
#include "game/init.h"

void whatisanop(int a) {};

void AgbMain(void)
{
    whatisanop(12345);

    GameInit();
    GameStart();
    GameLoop();
}
