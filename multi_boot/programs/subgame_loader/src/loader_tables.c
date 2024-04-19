#include "global.h"
#include "loader_tables.h"

void *const gUnknown_0203C280[] = {
    PROGRAM_WORK_BUFFER,
    PROGRAM_WORK_BUFFER + 0x8000,
    PROGRAM_WORK_BUFFER + 0x10000, // combined and uncompressed into ewram (code)

    PROGRAM_WORK_BUFFER, // bg tileset for map

    // sprite tiles, 1 is chosen and uncompressed into PROGRAM_WORK_BUFFER
    RECV_BUFFER,
    RECV_BUFFER,
    RECV_BUFFER,

    // more text tiles, loaded directly into OBJ_VRAM0
    RECV_BUFFER,

    // tilemaps are then finally left here
    RECV_BUFFER,
};
