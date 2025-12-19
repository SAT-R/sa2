#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <raylib.h>

#include "global.h"
#include "file_paths.h"

#include "../../_shared/c_header_parser/c_header_parser.h"

void SetMetaEntityValues(TokenList *tokList, void *inentities, EntityType et);

void
SetMetaEntityValues(TokenList *tokList, void *inEntities, EntityType et)
{
    int count = 0;
    for(int i = 0; i < tokList->count; i++) {
        if(i < tokList->count - 2) {
            Token *tokenPound = &tokList->tokens[i+0];
            Token *tokenName  = &tokList->tokens[i+1];
            Token *tokenID    = &tokList->tokens[i+2];

            if((tokenPound->type == POUND_DEFINE)
            && (tokenName->type == IDENTIFIER)
            && (tokenID->type == VALUE)) {
                char *prefixes[ENTITY_TYPE_COUNT] = {
                    "IA__",
                    "ITEM__",
                    "ENEMY__",
                    NULL, // There's only "rings", no other types of them
                };
                char *prefix = prefixes[et];

                switch(et) {
                    case ET_INTERACTABLE: {
                        if(TextFindIndex(tokenName->text, prefix) == 0) {
                            InteractableMetaList *entities = (InteractableMetaList*)inEntities;
                            InteractableMeta ia = {0};
                            
                            ia.name = TextReplace(tokenName->text, prefix, "");
                            ia.id   = TextToInteger(tokenID->text);

                            int delimOffset = TextFindIndex(ia.name, "__");
                            bool iaHasType  = (delimOffset >= 0);
                            if (iaHasType) {
                                ia.name[delimOffset+0] = '\0';
                                ia.name[delimOffset+1] = '\0';
                                ia.type = &ia.name[delimOffset + 2];
                            }

                            da_append(entities, &ia);
                        }
                    } break;

                    default: {
                        EntityMetaList *entities = (EntityMetaList*)inEntities;

                        if(TextFindIndex(tokenName->text, prefix) == 0) {
                            EntityMeta e = {0};

                            e.name = TextReplace(tokenName->text, prefix, "");
                            e.id   = TextToInteger(tokenID->text);
                            da_append(entities, &e);
                        }
                    } break;
                }
                
                i += 2;
                continue;
            }
        }
    }
}

void
LoadEntityNamesAndIDs(AppState *state)
{
    MemArena arena;
    memArenaInit(&arena);
    
    TokenList tokensGame    = tokenize(&arena, state->paths.characters_h);
    TokenList tokensAnims   = tokenize(&arena, state->paths.animations_h);
    TokenList tokensIAs     = tokenize(&arena, state->paths.interactables_h);
    TokenList tokensItems   = tokenize(&arena, state->paths.items_h);
    TokenList tokensEnemies = tokenize(&arena, state->paths.enemies_h);
    

    // Find entity names and IDs
    SetMetaEntityValues(&tokensIAs,     &state->paths.interactables, ET_INTERACTABLE);
    SetMetaEntityValues(&tokensItems,   &state->paths.items.items,   ET_ITEM);
    SetMetaEntityValues(&tokensEnemies, &state->paths.enemies,       ET_ENEMY);


    // Find all character IDs
    int numCharacters = 0;
    int numCharactersFromTokens = 0;
    for(int i = 0; i < tokensGame.count; i++) {
        if(i < tokensGame.count - 2) {
            Token *tokenPound = &tokensGame.tokens[i+0];
            Token *tokenName  = &tokensGame.tokens[i+1];
            Token *tokenID    = &tokensGame.tokens[i+2];

            if((tokenPound->type == POUND_DEFINE)
            && (tokenName->type == IDENTIFIER)
            && (tokenID->type == VALUE)) {
                if(TextIsEqual(tokenName->text, "NUM_CHARACTERS")) {
                    numCharactersFromTokens = TextToInteger(tokenID->text);
                    break;
                } else if(TextFindIndex(tokenName->text, "CHARACTER_") == 0) {
                    Character character = {0};
                    character.name = TextReplace(tokenName->text, "CHARACTER_", "");
                    character.id   = TextToInteger(tokenID->text);

                    da_append(&state->paths.characters, &character);
                    numCharacters++;
                }
            }
        }
    }

    if(numCharacters && (numCharacters == numCharactersFromTokens)) {
        // We found all characters, search for their animations

        FileInfo *paths           = &state->paths;
        InteractableMetaList *ias = &paths->interactables;
        EntityMetaList *enemies   = &paths->enemies;
        ItemMetaList *items       = &paths->items;
        EntityMeta *ring          = &paths->ring;
        CharacterList *chars = &paths->characters;

        // Find animation IDs
        // TODO: Maybe we should just prefix them with ANIM_, not something game-specific?
        unsigned short animBeforeCountdown = 0;
        int foundIdleAnims  = 0;
        int foundEnemyAnims = 0;
        int foundIAAnims = 0;
        for(int i = 0; i < tokensAnims.count - 2; i++) {
            Token *tokenPound = &tokensAnims.tokens[i+0];
            Token *tokenName  = &tokensAnims.tokens[i+1];
            Token *tokenID    = &tokensAnims.tokens[i+2];
                
            if((tokenPound->type == POUND_DEFINE)
            && (tokenName->type == IDENTIFIER)
            && (tokenID->type == VALUE)) {
                const char *animPrefix = TextFormat("SA%d_ANIM_", state->game);
                int index = TextFindIndex(tokenName->text, animPrefix);
                if(index == 0) {
                    // NOTE: These are only in SA2, so we can just do it explicitly
                    if((state->game == GAME_SA2)
                        && TextIsEqual(tokenName->text, "SA2_CHAR_ANIM_BEFORE_COUNTDOWN")) {
                        animBeforeCountdown = TextToInteger(tokenID->text);
                        i += 2;
                        continue;
                    }

                    // Character Idle Anims
                    if(foundIdleAnims < numCharacters) {
                        char *charName = chars->elements[foundIdleAnims].name;

                        if(TextIsEqual(tokenName->text, TextFormat("SA%d_ANIM_%s_IDLE", state->game, charName))) {
                            chars->elements[foundIdleAnims].animIdle = TextToInteger(tokenID->text);
                            foundIdleAnims++;
                            i += 2;
                            continue;
                        }
                    }

                    if(TextIsEqual(tokenName->text, TextFormat("SA%d_ANIM_ITEMBOX", state->game))) {
                        items->animItembox = TextToInteger(tokenID->text);
                    } else if(TextIsEqual(tokenName->text, TextFormat("SA%d_ANIM_ITEMBOX_TYPE", state->game))) {
                        items->animItemType = TextToInteger(tokenID->text);
                    } else if(TextIsEqual(tokenName->text, TextFormat("SA%d_ANIM_RING", state->game))) {
                        ring->anim = TextToInteger(tokenID->text);
                    } else if(foundEnemyAnims < enemies->count) {
                        for(int ei = 0; ei < enemies->count; ei++) {
                            unsigned short id = enemies->elements[ei].id;
                            EntityMeta *enemy = &enemies->elements[id];
                            const char *format = TextFormat("SA%d_ANIM_%s", state->game, enemy->name);

                            if(TextIsEqual((char *)tokenName->text, format)) {                    
                                enemy->anim = TextToInteger(tokenID->text);

                                foundEnemyAnims++;
                                break;
                            }
                        }
                    } else if(foundIAAnims < ias->count) {
                        for(int ii = 0; ii < ias->count; ii++) {
                            unsigned short id    = ias->elements[ii].id;
                            InteractableMeta *ia = &ias->elements[id];
                            const char *format   = TextFormat("SA%d_ANIM_%s", state->game, ia->name);

                            if(TextIsEqual((char *)tokenName->text, format)) {
                                do {
                                    ia->anim = TextToInteger(tokenID->text);

                                    foundIAAnims++;

                                } while((++ii < ias->count) && TextIsEqual(ia->name, (ia+1)->name) && ++ia);
                                ii--;

                                
                                break;
                            }
                        }
                    }
                }

                i += 2;
            }
        }

        // Set "Before countdown" animation (will be the idle anim for games != SA2.)
        // To visually test the stage startup
        for(int c = 0; c < numCharacters; c++) {
            chars->elements[c].animGettingReady = chars->elements[c].animIdle + animBeforeCountdown;
        }
    } else {
        if(numCharacters == 0) {
            printf("ERROR: Either NUM_CHARACTERS is not defined or not in\n"
                   "'%s'", state->paths.characters_h);
        } else if(numCharactersFromTokens == 0) {
            printf("ERROR: Did not find any 'CHARACTER_XYZ' values in\n"
                   "       '%s'", state->paths.characters_h);
        } else {
            printf("ERROR: Number of found player characters (%d) does not match NUM_CHARACTERS (%d).\n"
                   "       Please make sure NUM_CHARACTERS is defined after the individual characters.\n"
                   "       (Searched in '%s')\n",
                numCharacters, numCharactersFromTokens, state->paths.characters_h);
        }
    }
}

void
ParseOrCreateMetadataTxt(AppState *state, Tilemap* tm)
{
    StageMap *map = &state->map;
    char *mapPath = tm->dir;

    MemArena arena;
    memArenaInit(&arena);

    char *metadataTxtPath = allocPath(tm->dir, "metadata.txt");

    if(metadataTxtPath && FileExists(metadataTxtPath)) {
        TokenList tokens = tokenize(&arena, metadataTxtPath);

        for(int i = 0; i < tokens.count; i++) {
            if(i < tokens.count - 6) {
                Token *tokenName   = &tokens.tokens[i+0];
                Token *tokenEq     = &tokens.tokens[i+1];
                Token *tokenCurlyO = &tokens.tokens[i+2];
                Token *tokenValL   = &tokens.tokens[i+3];
                Token *tokenComma  = &tokens.tokens[i+4];
                Token *tokenValR   = &tokens.tokens[i+5];
                Token *tokenCurlyC = &tokens.tokens[i+6];

                if((tokenName->type  == UNKNOWN || tokenName->type   == IDENTIFIER)
                && tokenEq->type     == EQUALS
                && tokenCurlyO->type == L_CURLY_PAREN
                && tokenValL->type   == VALUE
                && tokenComma->type  == COMMA
                && tokenValR->type   == VALUE
                && tokenCurlyC->type == R_CURLY_PAREN) {
                    if(TextIsEqual(tokenName->text, "tilemap_dim")) {
                        tm->xTiles = TextToInteger(tokenValL->text);
                        tm->yTiles = TextToInteger(tokenValR->text);
                        i += 7-1;
                    } else if(TextIsEqual(tokenName->text, "map_dim")) {
                        map->width  = TextToInteger(tokenValL->text);
                        map->height = TextToInteger(tokenValR->text);
                        i += 7-1;
                    } else if(TextIsEqual(tokenName->text, "spawn_pos")) {
                        map->spawnX  = TextToInteger(tokenValL->text);
                        map->spawnY = TextToInteger(tokenValR->text);
                        i += 7-1;
                    }
                }
            }
        }
    } else {
        // Create metadata.txt file
        char *headerPath = allocPath(tm->dir, "header.c");

        if(FileExists(headerPath)) {
            TokenList tokens = tokenize(&arena, headerPath);

            state->paths.map.xTiles = TILES_PER_METATILE;
            state->paths.map.yTiles = TILES_PER_METATILE;
            state->map.spawnX = 0;
            state->map.spawnY = 0;

            if(tokens.count >= 3) {
                for(int ii = 0; ii < tokens.count-2; ii++) {
                    Token *token = &tokens.tokens[ii+0];
                    Token *nextToken = &tokens.tokens[ii+1];
                    Token *nextToken2 = &tokens.tokens[ii+2];

                    if(TextIsEqual(token->text, "mapWidth")
                    && nextToken->type == EQUALS
                    && nextToken2->type == VALUE) {
                        map->width = atoi(nextToken2->text);
                    }
            
                    if(TextIsEqual(token->text, "mapHeight")
                    && nextToken->type == EQUALS
                    && nextToken2->type == VALUE) {
                        map->height = atoi(nextToken2->text);
                
                        // Found both values, so output them
                        FILE *meta = fopen(metadataTxtPath, "w");
                        if(meta) {
                            fprintf(meta, "tilemap_dim = {%d,%d}\n", state->paths.map.xTiles, state->paths.map.yTiles);
                            fprintf(meta, "map_dim     = {%d,%d}\n", map->width, map->height);
                            fprintf(meta, "spawn_pos   = {%d,%d}\n", state->map.spawnX, state->map.spawnY);
                            fclose( meta);
                        }
                    }
                }
            } else {
                // Log an error?
            }
        } else {
            // Log an error?
        }

        if(headerPath) {
            free(headerPath);
        }
    }

    if(metadataTxtPath) {
        free(metadataTxtPath);
    }
}