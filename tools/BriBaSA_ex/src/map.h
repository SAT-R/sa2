#ifndef GUARD_BRIBASA_EX_MAP_H
#define GUARD_BRIBASA_EX_MAP_H

extern Texture2D CreateMetatileAtlas(AppState *state, int numMetatiles);
extern inline int GetMetatileIndex(AppState *state, int x, int y, MetatileLayer layer);
extern Vector2i GetMetatilePointBelowMouse(StageMap *map, Rectangle recMap);
extern bool IsMouseOnSpawn(StageMap *map, CharacterList *chars);

#endif // GUARD_BRIBASA_EX_MAP_H
