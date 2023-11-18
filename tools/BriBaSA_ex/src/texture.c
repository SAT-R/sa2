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
