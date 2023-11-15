#include <raylib.h>

#include "global.h"

void
SaveMapLayouts(AppState *state)
{
    Tilemap *map = &state->paths.map;

    File *backLayer = &map->layers[LAYER_BACK];
    SaveFileData(backLayer->path, backLayer->data, backLayer->dataSize);
    
    File *frontLayer = &map->layers[LAYER_FRONT];
    SaveFileData(frontLayer->path, frontLayer->data, frontLayer->dataSize);
}
