#include <stdlib.h>
#include <string.h>
#include <raylib.h>
#include "global.h"

Texture2D
GetEntityTextureById(AppState *state, EntityType etype, unsigned char id)
{
    Texture2D result = {0};

    switch(etype)
    {
    case EntInteractable: {
        InteractableMetaList *ias = &state->paths.interactables;
        
        if(id < ias->count) {
            InteractableMeta *ia = &ias->elements[id];

            result = ia->texture;
        }
    } break;

    case EntItem: {
        ItemMetaList *items = &state->paths.items;
        
        if(id == 0) {
            result = items->oneUpIcons.elements[state->paths.characters.selected];
        } else if(id < items->items.count) {
            result = items->items.elements[id].texture;            
        } else {
            result = items->txItembox;
        }
    } break;

    case EntEnemy: {
        EntityMetaList *enemies = &state->paths.enemies;

        if(id < enemies->count) {
            result = enemies->elements[id].texture;
        }
    } break;

    case EntRing: {
        result = state->paths.ring.texture;
    } break;
    }

    return result;
}

static inline void
LoadCharacterTextures(Game game, char *gameRoot, CharacterList *chars)
{
    for(int c = 0; c < chars->count; c++) {
        Character *character = &chars->elements[c];
        int frame = 0;
        const char *animPath = TextFormat("%s/graphics/sa%d/obj_tiles/4bpp/anim_%04d/f%03d.png",
                                          gameRoot, game, character->animIdle, frame);
        character->texture = LoadTexture(animPath);
    }
}

static inline void
LoadEntityTextures(Game game, char *gameRoot, EntityMetaList *ents)
{
    for(int c = 0; c < ents->count; c++) {
        EntityMeta *ent = &ents->elements[c];
        int frame = 0;
        const char *animPath = TextFormat("%s/graphics/sa%d/obj_tiles/4bpp/anim_%04d/f%03d.png",
                                          gameRoot, game, ent->anim, frame);
        ent->texture = LoadTexture(animPath);
    }
}

static inline void
LoadInteractableTextures(Game game, char *gameRoot, InteractableMetaList *ias)
{
    for(int c = 0; c < ias->count; c++) {
        InteractableMeta *ia = &ias->elements[c];
        int frame = 0;
        const char *animPath = TextFormat("%s/graphics/sa%d/obj_tiles/4bpp/anim_%04d/f%03d.png",
                                          gameRoot, game, ia->anim, frame);
        ia->texture = LoadTexture(animPath);
    }
}

static inline void
LoadRingTexture(Game game, char *gameRoot, EntityMeta *ring)
{
    int frame = 0;
    const char *animPath = TextFormat("%s/graphics/sa%d/obj_tiles/4bpp/anim_%04d/f%03d.png",
                                        gameRoot, game, ring->anim, frame);
    ring->texture = LoadTexture(animPath);
    
}

static inline void
LoadItemTextures(Game game, char *gameRoot, ItemMetaList *items, short numCharacters)
{
    const char *pathFormat = "%s/graphics/sa%d/obj_tiles/4bpp/anim_%04d/f%03d.png";

    // Itembox
    unsigned short animId = items->animItembox;
    const char *itemboxPath   = TextFormat(pathFormat, gameRoot, game, animId, 0);
    items->txItembox = LoadTexture(itemboxPath);

    // 1-Up icons
    for(int c = 0; c < numCharacters; c++) {
        unsigned short animId = items->animItemType;
        const char *iconPath = TextFormat(pathFormat, gameRoot, game, animId, c);
        Texture tx1Up  = LoadTexture(iconPath);

        da_append(&items->oneUpIcons, &tx1Up);
    }

    // Load all items
    for(int i = 0; i < items->items.count; i++) {
        EntityMeta *ent = &items->items.elements[i];

        if(i == 0) {
            if(items->oneUpIcons.count > 0) {
                ent->texture = items->oneUpIcons.elements[0];
            }
        } else {
            const char *animPath = TextFormat(pathFormat, gameRoot, game, items->animItemType, (i - 1) + numCharacters);
            ent->texture = LoadTexture(animPath);
        }
    }
}

void
LoadAllEntityTextures(Game game, char *gamePath, FileInfo *paths)
{
    LoadCharacterTextures(game, gamePath, &paths->characters);
    LoadInteractableTextures(game, gamePath, &paths->interactables);
    LoadEntityTextures(game, gamePath, &paths->enemies);
    LoadItemTextures(game, gamePath,   &paths->items, paths->characters.count);
    LoadRingTexture(game, gamePath,    &paths->ring);
}

