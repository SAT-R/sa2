import os

for file in os.listdir("asm"):
    if not file.startswith("enemy_"):
        continue
    
    enemy = file.replace("enemy_", "")
    enemy = enemy.replace(".s", "")
    
    if not os.path.exists(f"include/game/enemies/{enemy}.h"):
        to_write = f"""\
#ifndef GUARD_ENEMY_{enemy.upper()}_H
#define GUARD_ENEMY_{enemy.upper()}_H

#include "global.h"
#include "game/entity.h"

void CreateEntity_{enemy.capitalize()}(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                        u8 spriteY);

#endif // GUARD_ENEMY_{enemy.upper()}_H"""

        with open(f"include/game/enemies/{enemy}.h", "w") as new_file:
            new_file.write(to_write)
