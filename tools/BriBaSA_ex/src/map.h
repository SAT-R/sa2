#ifndef GUARD_BRIBASA_EX_MAP_H
#define GUARD_BRIBASA_EX_MAP_H

extern Texture2D CreateMetatileAtlas(AppState *state, int numMetatiles);
extern int GetMetatileIndex(StageMap *map, Tilemap* tilemap, MetatileLayer layer, int x, int y);
extern Vector2i GetMetatilePointBelowMouse(StageMap *map, Rectangle recMap);
extern bool IsMouseOnSpawn(StageMap *map, CharacterList *chars);

#endif // GUARD_BRIBASA_EX_MAP_H
