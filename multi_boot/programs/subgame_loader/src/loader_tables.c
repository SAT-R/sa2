#include "global.h"
#include "sio32_multi_load.h"
#include "loader_tables.h"

void *const gSegmentLoadBuffers[] = {
    PROGRAM_WORK_BUFFER + (SIO32ML_BLOCK_SIZE * 0),
    PROGRAM_WORK_BUFFER + (SIO32ML_BLOCK_SIZE * 1),
    PROGRAM_WORK_BUFFER + (SIO32ML_BLOCK_SIZE * 2), // combined and uncompressed into ewram (code)

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
