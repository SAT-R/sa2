#include <stdio.h> // printf
#include <stdlib.h> // ABS
#include <math.h>   // sin
#include <string.h> // memcpy
#include <raylib.h>

#include "global.h"
#include "drawing.h"
#include "map.h"
#include "save.h"
#include "texture.h"
#include "ui.h"

/* TODO: Make including <entity>.h from game code work */

//From "game/interactables_2/music_plant/bouncy_chain.h"
#define NUM_BOUNCY_CHAIN_ELEMS 6

// From light_bridge.h
#define BRIDGE_SEGMENT_WIDTH 12
#define BRIDGE_WIDTH         (28 * TILE_WIDTH)
#define BRIDGE_TYPE_STRAIGHT 0
#define BRIDGE_TYPE_CURVED   1


#include "../../../include/constants/interactables.h"
#include "../../../include/constants/zones.h"

static void DrawEntInteractableSA2(AppState *state, int x, int y, int kind, char data[4]);
static inline bool DrawOnOffButton(UiContext *ui, UiIdent *id, Rectangle rec, char *text, bool cond);
static inline void DrawMetatile(Texture2D txAtlas, int x, int y, int metatileIndex, Color tint);
static inline void DrawMetatileScaled(Texture2D txAtlas, int x, int y, float scale, int metatileIndex, Color tint);
static inline void DrawMetatilePreviewButton(UiContext *ui, UiHeader *header, AppState *state, int x, int y, Texture2D txAtlas);
static void DrawSaveButton(AppState *state, int x, int y);
static void DrawUIWindow(UiContext *ui, UIWindow *window);


#define DRAW_ENTITY_RECT_CUSTOM_DIM(_x, _y, _offsetX, _offsetY, _width, _height, _tint)                                       \
{                                                                                                         \
    int rx = _x + _offsetX;                                                                     \
    int ry = _y + _offsetY;                                                                     \
                                                                                                          \
    DrawRectangle(rx, ry, _width, _height, UI_COLOR_TRANSLUCENT);    \
    DrawRectangleLines(rx, ry, _width, _height, _tint);              \
}

#define DRAW_ENTITY_RECT(_x, _y, _data, _boundingDim, _tint)                                                     \
{                                                                                                         \
    DRAW_ENTITY_RECT_CUSTOM_DIM(_x, _y, (_data[0] * TILE_DIM), (_data[1] * TILE_DIM),                       \
        ((unsigned)_data[2] * _boundingDim), _data[3] * TILE_DIM, _tint);                                 \
}

#define DRAWIA_FLAG_DRAW_TEXTURE       0x1
#define DRAWIA_FLAG_DRAW_BOUNDING_BOX  0x2
#define DRAWIA_FLAG_DRAW_MIDDLE_CIRCLE 0x4
#define DRAWIA_FLAG_FLIP_X             0x10
#define DRAWIA_FLAG_FLIP_Y             0x20
#define DRAWIA_FLAG_MIRROR_X           0x40
#define DRAWIA_FLAG_MIRROR_Y           0x80

bool
DrawAndHandleCloseButton(AppState *state)
{
    Rectangle recCloseBtn = {state->windowWidth - UI_APP_CLOSE_BUTTON_DIM, 0, UI_APP_CLOSE_BUTTON_DIM, UI_APP_CLOSE_BUTTON_DIM};

    bool clicked = DrawButtonColored(recCloseBtn, "X", UI_APP_CLOSE_BUTTON_DIM,
        UI_COLOR_BUTTON_OFF, UI_COLOR_BUTTON_OFF_HOVER, UI_COLOR_BUTTON_OFF_PRESSED, UI_COLOR_BUTTON_OFF_TEXT);

    if(clicked && state->unsavedChangesExist) {
        UIWindow *window = &state->ui.windows.elements[UIWND_ID_UNSAVED_CHANGES];
        window->flags |= UIWND_FLAG_IS_VISIBLE;
    }

    return clicked;
}

void DrawEntInteractable(AppState *state, int x, int y, int kind, char data[5])
{
    switch(state->game) {
    case SA1: {
        // TODO
        //DrawEntInteractableSA1(state, x, y, kind, data);
    } break;

    case SA2: {
        DrawEntInteractableSA2(state, x, y, kind, data);
    } break;

    case SA3: {
        // TODO
        //DrawEntInteractableSA3(state, x, y, kind, data);
    } break;
    }
}

static void
DrawEntInteractableSA2(AppState *state, int x, int y, int kind, char data[4])
{
    InteractableMeta *ia = &state->paths.interactables.elements[kind];

    unsigned int flags = 0;
    Color boundingTint;

    int offsetX = -(ia->texture.width / 2);
    int offsetY = -ia->texture.height;
    int boundingWidth = TILE_DIM;

    switch(kind) {
    case IA__TOGGLE_PLAYER_LAYER__FOREGROUND: {
        boundingTint = RED;
        flags |= DRAWIA_FLAG_DRAW_BOUNDING_BOX;
    } break;

    case IA__TOGGLE_PLAYER_LAYER__BACKGROUND: {
        boundingTint = GREEN;
        flags |= DRAWIA_FLAG_DRAW_BOUNDING_BOX;
    } break;

    case IA__GRIND_RAIL__START_GROUND:
    case IA__GRIND_RAIL__START_AIR:
    case IA__GRIND_RAIL__END_GROUND:
    case IA__GRIND_RAIL__END_FORCED_JUMP:
    case IA__GRIND_RAIL__END_ALTERNATE:
    case IA__GRIND_RAIL__END_AIR:
    case IA__GRIND_RAIL__END_GROUND_LEFT:
    case IA__GRIND_RAIL__END_AIR_LEFT: {
        boundingTint = DARKBLUE;
        flags |= DRAWIA_FLAG_DRAW_BOUNDING_BOX;
        flags |= DRAWIA_FLAG_DRAW_MIDDLE_CIRCLE;
    } break;
        
    case IA__HOOK_RAIL__UNUSED:
    case IA__HOOK_RAIL__START:
    case IA__HOOK_RAIL__END: {
        flags |= DRAWIA_FLAG_DRAW_BOUNDING_BOX;
    } break;

    case IA__BOUNCY_BAR: {
        offsetX -= (ia->texture.width / 2);
        offsetY += (ia->texture.height / 2);

        if(data[0]) {
            flags |= DRAWIA_FLAG_FLIP_X;
        }
        flags |= DRAWIA_FLAG_DRAW_TEXTURE;
    } break;

    case IA__CHECKPOINT: {
        offsetX = -(ia->texture.width / 4);
        offsetY = -(ia->texture.height / 4);
        flags |= DRAWIA_FLAG_DRAW_TEXTURE;
    } break;

    case IA__CEILING_SLOPE__A: {
        flags |= DRAWIA_FLAG_DRAW_BOUNDING_BOX;
    } break;
        
    case IA__WINDUP_STICK: {
        boundingTint = PINK;
        flags |= DRAWIA_FLAG_DRAW_BOUNDING_BOX;
    } break;

#if 0
    // NOTE: The frame for the bouncy chain elements is in
    //       variant 15 of NOTE_BLOCK, for some reason.
    case IA__BOUNCY_CHAIN: {
        for(int i = 0; i < NUM_BOUNCY_CHAIN_ELEMS; i++) {

        }
    } break;
#endif
    case IA__LIGHT_BRIDGE: {

        if(data[0] == BRIDGE_TYPE_STRAIGHT) {
            boundingTint = GREEN;

            int offX = -(BRIDGE_WIDTH / 2);
            int offY = -8;
            boundingWidth = BRIDGE_WIDTH;


            DRAW_ENTITY_RECT_CUSTOM_DIM(x, y, offX, offY, BRIDGE_WIDTH, 16, GREEN);
        }

        flags |= DRAWIA_FLAG_DRAW_TEXTURE;
    } break;
        
    default: {
        flags |= DRAWIA_FLAG_DRAW_TEXTURE;
    } break;
    }

    if(flags & DRAWIA_FLAG_DRAW_TEXTURE) {
        DrawTexture(ia->texture, x + offsetX, y + offsetY, WHITE);
    }
    
    if(flags & DRAWIA_FLAG_DRAW_BOUNDING_BOX) {
        DRAW_ENTITY_RECT(x, y, data, boundingWidth, boundingTint);
    }

    if(flags & DRAWIA_FLAG_DRAW_MIDDLE_CIRCLE) {
        DrawCircle(x, y, 5, PINK);
        DrawCircleLines(x, y, 5.5, boundingTint);
    }
}

void
DrawEntItem(AppState *state, int x, int y, int index)
{
    ItemMetaList *items = &state->paths.items;

    Rectangle rec = GetEntityOffsetRect(state, ET_ITEM, x, y, index, NULL);

    DrawTexture(items->txItembox, rec.x, rec.y, WHITE);

    Texture tx = GetEntityTextureById(state, EntItem, index);
    DrawTexture(tx, rec.x + (tx.width / 2), rec.y + (tx.height / 2), WHITE);
}

void
DrawEntEnemy(AppState *state, int x, int y, int index, char data[5])
{
    EntityMeta *enemy = &state->paths.enemies.elements[index];
    
    Rectangle rec = GetEntityOffsetRect(state, ET_ENEMY, x, y, index, data);

    DrawTexture(enemy->texture, rec.x, rec.y, WHITE);
}

void
DrawEntRing(AppState *state, int x, int y)
{
    EntityMeta *ring = &state->paths.ring;

    Rectangle rec = GetEntityOffsetRect(state, ET_RING, x, y, 0, NULL);

    DrawTextureRec(ring->texture,
                   CLITERAL(Rectangle){0, 0, rec.width, rec.height},
                   CLITERAL(Vector2){rec.x, rec.y},
                   WHITE);
}

void DrawSpawnPosCharacter(AppState *state, Rectangle recMap)
{
    int selectedChar = state->paths.characters.selected;
    Texture2D *txChar = &state->paths.characters.elements[selectedChar].texture;
    int sx = recMap.x + state->map.spawnX - state->map.camera.x - (txChar->width * 0.5);;
    int sy = recMap.y + state->map.spawnY - state->map.camera.y - (txChar->height * 0.5);

    DrawTexturePro(*txChar, CLITERAL(Rectangle){0, 0,  -txChar->width, txChar->height},
                            CLITERAL(Rectangle){sx, sy,  txChar->width, txChar->height},
                            CLITERAL(Vector2){0.0, 0.0}, 0.0, WHITE);
}

inline Rectangle
GetEntityOffsetRect(AppState *state, EntityType etype, int x, int y, int kind, char data[5])
{
    Rectangle rec = {x,y,0,0};

    switch(etype) {
    case ET_INTERACTABLE: {
        InteractableMeta *ia = &state->paths.interactables.elements[kind];

        unsigned int flags = 0;

        int offsetX = -(ia->texture.width / 2);
        int offsetY = -ia->texture.height;
        int boundingWidth = TILE_DIM;

        switch(kind) {
        case IA__TOGGLE_PLAYER_LAYER__FOREGROUND: {
            flags |= DRAWIA_FLAG_DRAW_BOUNDING_BOX;
        } break;

        case IA__TOGGLE_PLAYER_LAYER__BACKGROUND: {
            flags |= DRAWIA_FLAG_DRAW_BOUNDING_BOX;
        } break;

        case IA__GRIND_RAIL__START_GROUND:
        case IA__GRIND_RAIL__START_AIR:
        case IA__GRIND_RAIL__END_GROUND:
        case IA__GRIND_RAIL__END_FORCED_JUMP:
        case IA__GRIND_RAIL__END_ALTERNATE:
        case IA__GRIND_RAIL__END_AIR:
        case IA__GRIND_RAIL__END_GROUND_LEFT:
        case IA__GRIND_RAIL__END_AIR_LEFT: {
            flags |= DRAWIA_FLAG_DRAW_BOUNDING_BOX;
        } break;
        
        case IA__HOOK_RAIL__UNUSED:
        case IA__HOOK_RAIL__START:
        case IA__HOOK_RAIL__END: {
            flags |= DRAWIA_FLAG_DRAW_BOUNDING_BOX;
        }
        case IA__BOUNCY_BAR: {
            offsetX = -ia->texture.width;
            offsetY = -(ia->texture.height / 2);
        } break;

        case IA__CHECKPOINT: {
            offsetX = -(ia->texture.width / 4);
            offsetY = -(ia->texture.height / 4);
        } break;
        
        case IA__CEILING_SLOPE__A: {
            flags |= DRAWIA_FLAG_DRAW_BOUNDING_BOX;
        } break;
        
        case IA__WINDUP_STICK: {
            flags |= DRAWIA_FLAG_DRAW_BOUNDING_BOX;
        } break;

        case IA__LIGHT_BRIDGE: {
            if(data[0] == BRIDGE_TYPE_STRAIGHT) {
                offsetX = -(BRIDGE_WIDTH / 2);
                offsetY = -8;
                boundingWidth = BRIDGE_WIDTH;
            }

        } break;

        }

    
        if(flags & DRAWIA_FLAG_DRAW_BOUNDING_BOX) {
            rec.width  = data[2] * boundingWidth;
            rec.height = data[3] * TILE_DIM;
            rec.x = x +  (data[0] * TILE_DIM);
            rec.y = y +  (data[1] * TILE_DIM);
        } else {
            rec.width  = ia->texture.width;
            rec.height = ia->texture.height;
            rec.x = x + offsetX;
            rec.y = y + offsetY;
        }
    } break;

    case ET_ITEM: {
        rec.width  = state->paths.items.txItembox.width;
        rec.height = state->paths.items.txItembox.height;

        rec.x -= rec.width / 2;
        rec.y -= rec.height - 3; // TODO: Where do these 3 pixels come from?
    } break;

    case ET_ENEMY: {
        EntityMeta *enemy = &state->paths.enemies.elements[kind];
        rec.width  = enemy->texture.width;
        rec.height = enemy->texture.height;

        rec.x -= rec.width / 2;
        rec.y -= rec.height;
    } break;

    case ET_RING: {
        rec.width  = state->paths.ring.texture.width;
        rec.height = state->paths.ring.texture.height;

        rec.x -= rec.width/2;
        rec.y -= rec.height;
    } break;
    }

    return rec;
}

#define SPAWN_POPUP_DIM 128.0
void
DrawMapSprites(AppState *state, Rectangle recMap)
{
    FileInfo *paths = &state->paths;

    Rectangle recSpawn = {
        recMap.x - SPAWN_POPUP_DIM,
        recMap.y - SPAWN_POPUP_DIM,
        recMap.width  + 2*SPAWN_POPUP_DIM,
        recMap.height + 2*SPAWN_POPUP_DIM
    };

    BeginScissorMode(recMap.x, recMap.y, recMap.width, recMap.height);
        DrawSpawnPosCharacter(state, recMap);

        EditorEntities *entities = &state->map.entities;
        for(int i = 0; i < state->map.entities.count; i++) {
            EditorEntity *ent = &entities->elements[i];

            int screenX = (recMap.x + ent->worldX) - state->map.camera.x;
            int screenY = (recMap.y + ent->worldY) - state->map.camera.y;

            if(CheckCollisionPointRec(CLITERAL(Vector2){screenX, screenY}, recSpawn)) {
                Texture2D txEnt = GetEntityTextureById(state, ent->etype, ent->kind);
                Rectangle recUi = GetEntityOffsetRect(state, ent->etype, screenX, screenY, ent->kind, ent->data);

                bool clickedEnt = UiElement(&state->uiCtx, (UiIdent*)&ent->ui, recUi.x, recUi.y, recUi.width, recUi.height, NULL);

                if(clickedEnt) {
                    state->map.entities.active = ent;
                }

                switch(ent->etype) {
                case ET_INTERACTABLE: {
                    DrawEntInteractable(state, screenX, screenY, ent->kind, ent->data);
                } break;
                    
                case ET_ITEM: {
                    DrawEntItem(state, screenX, screenY, ent->kind);
                } break;
                    
                case ET_ENEMY: {
                    DrawEntEnemy(state, screenX, screenY, ent->kind, ent->data);
                } break;
                    
                case ET_RING: {
                    DrawEntRing(state, screenX, screenY);
                } break;

                }

                if(state->map.entities.active == ent) {
                    Color tint = GREEN;
                    tint.a *= fabs(sin(GetTime() * 2)) * 0.8;
                    DrawRectangle(recUi.x-1, recUi.y-1, recUi.width+2, recUi.height+2, tint);
                    DrawRectangleLines(recUi.x-1, recUi.y-1, recUi.width+2, recUi.height+2, BLACK);
                }
            }
        }
    EndScissorMode();
}

void
Debug_DrawAllEntityTextures(AppState *state)
{
    /* TEMP Test-Code */
    int testX = 200;
    int testY = 120;
    char data[5] = {0};

    int iaCount = state->paths.interactables.count;
    for(int iaIndex = 0; iaIndex < iaCount; iaIndex++) {
        DrawEntInteractable(state,
            testX + 40*(iaIndex % 32), testY + 40*(iaIndex / 32),
            iaIndex, data);
    }
    testY += 42*(iaCount/32 + 1);

    for(int item = 0; item < state->paths.items.items.count; item++) {
        DrawEntItem(state, testX + 32*item, testY, item);
    }
    testY += 32;
            
    for(int enemy = 0; enemy < state->paths.enemies.count; enemy++) {
        DrawEntEnemy(state, testX + 32*enemy, testY, enemy, data);
    }
    testY += 32;
            
    DrawEntRing(state, testX, testY);
}

bool
DrawButtonColored(Rectangle rec, char *text, int fontSize, Color idleTint, Color hotTint, Color activeTint, Color textTint)
{
    bool wasReleased = false;

    BeginScissorMode(rec.x, rec.y, rec.width, rec.height);
        if(IS_MOUSE_ON_RECT(rec)) {
            if(IsMouseButtonDown(MOUSE_BUTTON_LEFT)) {
                DrawRectangleRec(rec, activeTint);
            } else {
                DrawRectangleRec(rec, hotTint);
            }

            if(IsMouseButtonReleased(MOUSE_BUTTON_LEFT)) {
                wasReleased = true;
            }
        } else {
            DrawRectangleRec(rec, idleTint);
        }

        DrawText(text, rec.x + 1, rec.y + 1, fontSize, textTint);
    EndScissorMode();

    return wasReleased;
}

// Colors the button depending on 'cond' param
//  false: red
//  true:  green
static inline bool
DrawOnOffButton(UiContext *ui, UiIdent *id, Rectangle rec, char *text, bool cond)
{
    Color tintNeutral = (cond) ? UI_COLOR_BUTTON_ON         : UI_COLOR_BUTTON_OFF;
    Color tintHover   = (cond) ? UI_COLOR_BUTTON_ON_HOVER   : UI_COLOR_BUTTON_OFF_HOVER;
    Color tintPress   = (cond) ? UI_COLOR_BUTTON_ON_PRESSED : UI_COLOR_BUTTON_OFF_PRESSED;
    Color tintText    = (cond) ? UI_COLOR_BUTTON_ON_TEXT    : UI_COLOR_BUTTON_OFF_TEXT;

    id->btn.idleTint   = tintNeutral;
    id->btn.hotTint    = tintHover;
    id->btn.activeTint = tintPress;
    id->btn.textTint   = tintText;

    return UiElement(ui,id,rec.x, rec.y, rec.width, rec.height, text);
}

static inline void
DrawMetatile(Texture2D txAtlas, int x, int y, int metatileIndex, Color tint)
{
    Rectangle recSrc = {
        (metatileIndex % ATLAS_WIDTH) * METATILE_DIM,
        (metatileIndex / ATLAS_WIDTH) * METATILE_DIM,
        METATILE_DIM, METATILE_DIM,
    };

    DrawTextureRec(txAtlas, recSrc, CLITERAL(Vector2){x, y}, tint);
}

static inline void
DrawMetatileScaled(Texture2D txAtlas, int x, int y, float scale, int metatileIndex, Color tint)
{
    Rectangle recSrc = {
        (metatileIndex % ATLAS_WIDTH) * METATILE_DIM,
        (metatileIndex / ATLAS_WIDTH) * METATILE_DIM,
        METATILE_DIM, METATILE_DIM,
    };
    
    DrawTexturePro(txAtlas, recSrc, CLITERAL(Rectangle){x, y, scale*METATILE_DIM, scale*METATILE_DIM}, CLITERAL(Vector2){0, 0}, 0.0, tint);
}

static inline
void DrawMetatilePreviewButton(UiContext *ui, UiHeader *header, AppState *state, int x, int y, Texture2D txAtlas)
{
    const char *previewState = (state->ui.isMtPreviewMerged) ? "Merged" : "Split";
    char *btnTextMetatilePreview = (char*)TextFormat("Preview: %s", previewState);
    bool previewBtnPressed = UiElement(ui, &header->btnPreview, x, y, 170, 20, btnTextMetatilePreview);
    
    if(previewBtnPressed) {
        state->ui.isMtPreviewMerged = !state->ui.isMtPreviewMerged;
    }

    int mtBackX     = x+180;
    int mtBackY     = 0;
    int mtFrontX    = mtBackX;
    int mtFrontY    = mtBackY;

    bool isPreviewMerged = state->ui.isMtPreviewMerged;
    if(!isPreviewMerged) {
        mtFrontX      = mtBackX + METATILE_DIM + 1;
        mtFrontY      = mtBackY;
    }

    // Pos and dimensions of the background
    Rectangle recBack  = {0};
    Rectangle recFront = {0};
    Color bgTintBack  = UI_COLOR_BUTTON_PREVIEW_BACK;
    Color bgTintFront = UI_COLOR_BUTTON_PREVIEW_FRONT;

    if(isPreviewMerged) {
        recBack = CLITERAL(Rectangle){
            mtBackX - 1,
            mtBackY,
            METATILE_DIM + 3,
            METATILE_DIM
        };

        recFront = recBack;

        // Mix both previews' background colors
        bgTintBack.r = (bgTintBack.r + bgTintFront.r) * 2 / 3;
        bgTintBack.g = (bgTintBack.g + bgTintFront.g) * 2 / 3;
        bgTintBack.b = (bgTintBack.b + bgTintFront.b) * 2 / 3;

        DrawRectangle(recBack.x,   recBack.y,  recBack.width,  recBack.height, bgTintBack);
    } else {
        recBack = CLITERAL(Rectangle){
            mtBackX - 1,
            mtBackY,
            METATILE_DIM + 3,
            METATILE_DIM
        };
        
        recFront = CLITERAL(Rectangle){
            mtFrontX - 1,
            mtFrontY,
            METATILE_DIM + 3,
            METATILE_DIM
        };
        
        DrawRectangle(recBack.x,   recBack.y,  recBack.width,  recBack.height, bgTintBack);
        DrawRectangle(recFront.x, recFront.y, recFront.width, recFront.height, bgTintFront);
    }

    int mtIndexFront = state->map.selectedMetatileIndexFront;
    int mtIndexBack  = state->map.selectedMetatileIndexBack ;

    DrawMetatile(txAtlas, mtBackX, mtBackY, mtIndexBack, WHITE);
    DrawMetatile(txAtlas, mtFrontX, mtFrontY, mtIndexFront, WHITE);
}

static MapRegions
ConvertEditorEntitiesToMapRegions(EditorEntities entities, EntityType etype, int regionsX, int regionsY)
{
    MapRegions regions = {0};
    regions.map_regions_x = regionsX;
    regions.map_regions_y = regionsY;

    // Make sure all entities fit in the region boundaries we expect,
    // and expand if necessary
    for(int eid = 0; eid < entities.count; eid++) {
        EditorEntity *ent = &entities.elements[eid];

        int rx = WORLD_TO_REGION(ent->worldX);
        int ry = WORLD_TO_REGION(ent->worldY);

        if(rx >= regionsX) {
            regions.map_regions_x = regionsX = rx+1;

            printf("Entity Map Region X (%d) is outside horizontal Map Region count (%d).\n"
                   "Expanded to (%d).\n",
                    rx, regionsX, (rx+1));
        }
        
        if(ry >= regionsY) {
            regions.map_regions_y = regionsY = ry+1;

            printf("Entity Map Region Y (%d) is outside vertical Map Region count (%d).\n"
                   "Expanded to (%d).\n",
                    ry, regionsY, (ry+1));
        }
    }

    // Fill regions
    int numRegions  = regionsX * regionsY;
    regions.regions = calloc(numRegions * sizeof(*regions.regions), 1);
    if(regions.regions) {
        for(int eid = 0; eid < entities.count; eid++) {
            EditorEntity *ent = &entities.elements[eid];

            if(ent->etype != etype)
                continue;

            int rx = WORLD_TO_REGION(ent->worldX);
            int ry = WORLD_TO_REGION(ent->worldY);
            int ri = ry * regionsX + rx;

            EntityData edat = {0};
            switch(etype) {
            case ET_RING: {
                edat.x = WORLD_TO_ENTITY_POS(ent->worldX);
                edat.y = WORLD_TO_ENTITY_POS(ent->worldY);
            } break;

            case ET_ITEM: {
                edat.x    = WORLD_TO_ENTITY_POS(ent->worldX);
                edat.y    = WORLD_TO_ENTITY_POS(ent->worldY);
                edat.kind = ent->kind;
            } break;
                
            case ET_INTERACTABLE:
            case ET_ENEMY: {
                edat.x    = WORLD_TO_ENTITY_POS(ent->worldX);
                edat.y    = WORLD_TO_ENTITY_POS(ent->worldY);
                edat.kind = ent->kind;
                memcpy(edat.data, ent->data, sizeof(edat.data));
            } break;
            }

            da_append_to(&regions.regions[ri], &edat, list);
        }
    }

    return regions;
}

static void
SaveMapEntities(AppState *state)
{
    EntityType etype = ET_INTERACTABLE;
    int regionsX = state->map.entities.numRegions[etype].x;
    int regionsY = state->map.entities.numRegions[etype].y;
    MapRegions regions = ConvertEditorEntitiesToMapRegions(state->map.entities, etype, regionsX, regionsY);
    ConvertMapRegionsToCsv(regions, state->paths.entityCSVs.interactables, state->paths.interactables_h, state->game, etype);

    etype = ET_ITEM;
    regionsX = state->map.entities.numRegions[etype].x;
    regionsY = state->map.entities.numRegions[etype].y;
    regions = ConvertEditorEntitiesToMapRegions(state->map.entities, etype, regionsX, regionsY);
    ConvertMapRegionsToCsv(regions, state->paths.entityCSVs.items, state->paths.items_h, state->game, etype);
    
    etype = ET_ENEMY;
    regionsX = state->map.entities.numRegions[etype].x;
    regionsY = state->map.entities.numRegions[etype].y;
    regions = ConvertEditorEntitiesToMapRegions(state->map.entities, etype, regionsX, regionsY);
    ConvertMapRegionsToCsv(regions, state->paths.entityCSVs.enemies, state->paths.enemies_h, state->game, etype);
    
    etype = ET_RING;
    regionsX = state->map.entities.numRegions[etype].x;
    regionsY = state->map.entities.numRegions[etype].y;
    regions = ConvertEditorEntitiesToMapRegions(state->map.entities, etype, regionsX, regionsY);
    ConvertMapRegionsToCsv(regions, state->paths.entityCSVs.rings, NULL, state->game, etype);
}

static void
DrawSaveButton(AppState *state, int x, int y)
{
    // Save button
    Rectangle recBtn = CLITERAL(Rectangle){x, y, 110, 20};

    Color tint      = (state->unsavedChangesExist) ? UI_COLOR_BUTTON_SAVE_WARN         : UI_COLOR_BUTTON_SAVE;
    Color hoverTint = (state->unsavedChangesExist) ? UI_COLOR_BUTTON_SAVE_WARN_HOVER   : UI_COLOR_BUTTON_SAVE_HOVER;
    Color pressTint = (state->unsavedChangesExist) ? UI_COLOR_BUTTON_SAVE_WARN_PRESSED : UI_COLOR_BUTTON_SAVE_PRESSED;
    Color textTint  = (state->unsavedChangesExist) ? UI_COLOR_BUTTON_SAVE_WARN_TEXT    : UI_COLOR_BUTTON_SAVE_TEXT;

    state->uiHeader.btnSaveMap.btn.idleTint   = tint;
    state->uiHeader.btnSaveMap.btn.hotTint    = hoverTint;
    state->uiHeader.btnSaveMap.btn.activeTint = pressTint;
    state->uiHeader.btnSaveMap.btn.textTint   = textTint;

    bool saveButtonPressed = UiElement(&state->uiCtx, &state->uiHeader.btnSaveMap, x, y, 110, 20, NULL);
    if(saveButtonPressed) {
        state->ignoreUnsavedChanges = true;
        state->unsavedChangesExist  = false;
        SaveMapLayouts(state);

        SaveMapEntities(state);
    }
}

void DrawActiveEntityInfo(AppState *state, int x, int y)
{
    InteractableMetaList *ias = &state->paths.interactables;
    ItemMetaList *items     = &state->paths.items;
    EntityMetaList *enemies = &state->paths.enemies;
    EditorEntity *ent = state->map.entities.active;
    UiContext *uiCtx = &state->uiCtx;

    if(!ent) {
        return;
    }

    const char *entTypes[ENTITY_TYPE_COUNT] = {
        "Interactable",
        "Item",
        "Enemy",
        "Ring"
    };

    int fontSize = 20;
    int posX = x;
    int posY = y;
    const char *txtId  = TextFormat("%s", entTypes[ent->etype]);
    DrawText(txtId,  posX, posY, fontSize, UI_COLOR_TEXT);
    posY += fontSize + 2;
    fontSize = 10;

    bool minusClicked = false;
    bool plusClicked = false;
    if(ent->etype != ET_RING) {
        bool minusClicked = UiElement(uiCtx, &state->uiHeader.btnEntityMinus, posX, posY, fontSize, fontSize, NULL);
        bool plusClicked  = UiElement(uiCtx, &state->uiHeader.btnEntityPlus,  posX+fontSize, posY, fontSize, fontSize, NULL);

        if(minusClicked) {ent->kind--; state->unsavedChangesExist = true; }
        if(plusClicked)  {ent->kind++; state->unsavedChangesExist = true; }
    }

    char *txtName = NULL;
    char *data = NULL;
    switch(ent->etype) {
    case ET_ITEM: {
        ent->kind %= items->items.count;

        txtName = (char*)TextFormat("%3d: %s", ent->kind, items->items.elements[ent->kind].name);
    } break;

    case ET_ENEMY: {
        ent->kind %= enemies->count;

        txtName = (char*)TextFormat("%3d: %s", ent->kind, enemies->elements[ent->kind].name);
        data = ent->data;
    } break;

    case ET_INTERACTABLE: {
        ent->kind %= ias->count;

        const char *name = ias->elements[ent->kind].name;

        const char *type = ias->elements[ent->kind].type;

        txtName = (char*)((type) ?
            TextFormat("%3d: %s (%s)", ent->kind, name, type) :
            TextFormat("%3d: %s", ent->kind, name));

        data = ent->data;
    } break;

    }
        
    if(txtName) {
        DrawText(txtName, posX + 2 * fontSize + 2, posY, fontSize, UI_COLOR_TEXT);
        posY += fontSize + 2;
    }
    
    const char *txtPos = TextFormat("X: %5d, Y: %5d", ent->worldX, ent->worldY);
    DrawText(txtPos, posX, posY, fontSize, UI_COLOR_TEXT);
    posY += fontSize + 2;
        
    if(data) {
        for(int i = 0; i < ENT_DATA_SIZE(state->game); i++) {
            minusClicked = UiElement(uiCtx, &state->uiHeader.btnsDataMinus[i], posX,            posY, fontSize, fontSize, NULL);
            plusClicked  = UiElement(uiCtx, &state->uiHeader.btnsDataPlus[i],  posX + fontSize, posY, fontSize, fontSize, NULL);

            if(minusClicked) {data[i]--; state->unsavedChangesExist = true; }
            if(plusClicked)  {data[i]++; state->unsavedChangesExist = true; }

            if(i < 2) {
                const char *txtData = TextFormat("data[%d]: %d", i, data[i]);
                DrawText(txtData, posX + 2 * fontSize + 2, posY, fontSize, UI_COLOR_TEXT);
            } else {
                const char *txtData = TextFormat("data[%d]: %d", i, (unsigned char)data[i]);
                DrawText(txtData, posX + 2 * fontSize + 2, posY, fontSize, UI_COLOR_TEXT);
            }
            posY += fontSize + 2;
        }
    }
}

void
DrawMainHeader(AppState *state, Texture2D txAtlas)
{
    int initialX = 300;
    int initialY = 0;
    int posX     = initialX;
    int posY     = initialY;

    DrawText("Map Layers", posX, posY, 20, UI_COLOR_TEXT);
    int backLayerFlag  = state->map.flags & MAP_FLAG_SHOW_BACK_LAYER;
    int frontLayerFlag = state->map.flags & MAP_FLAG_SHOW_FRONT_LAYER;

    bool bLayerBtnPressed = DrawOnOffButton(&state->uiCtx, &state->uiHeader.btnBackLayer,  CLITERAL(Rectangle){posX, posY += 22, 80, 20}, NULL,  backLayerFlag);
    bool fLayerBtnPressed = DrawOnOffButton(&state->uiCtx, &state->uiHeader.btnFrontLayer, CLITERAL(Rectangle){posX += 85, posY, 83, 20}, NULL, frontLayerFlag);

    if(bLayerBtnPressed) {
        state->map.flags ^= MAP_FLAG_SHOW_BACK_LAYER;
    }

    if(fLayerBtnPressed) {
        state->map.flags ^= MAP_FLAG_SHOW_FRONT_LAYER;
    }
    
    const char *txtMetatiles = TextFormat(
        "Metatiles %3d, %3d",
        state->map.selectedMetatileIndexBack,
        state->map.selectedMetatileIndexFront);

    DrawText(txtMetatiles, posX -= 85, posY += 30, 20, UI_COLOR_TEXT);
    DrawMetatilePreviewButton(&state->uiCtx, &state->uiHeader, state, initialX, posY += 20, txAtlas);
    
    DrawSaveButton(state, 4, initialY + METATILE_DIM - 20 - 4);

    DrawActiveEntityInfo(state, initialX + 380, 0);
}

void
DrawUI(AppState *state, Texture2D txAtlas)
{
    for(int i = 0; i < state->ui.windows.count; i++) {
        UIWindow *window = &state->ui.windows.elements[i];
        DrawUIWindow(&state->uiCtx, window);
    }   

}

static void
DrawUIWindow(UiContext *ui, UIWindow *window)
{
    Rectangle recWindow  = CLITERAL(Rectangle){window->x, window->y, window->width, window->height};
    Rectangle recHeader  = CLITERAL(Rectangle){window->x, window->y, window->width, UI_HEADER_HEIGHT};
    Rectangle recMessage = CLITERAL(Rectangle){ recHeader.x, recHeader.y + recHeader.height,
                                                window->width, window->height-recHeader.height};

    if(window->flags & UIWND_FLAG_IS_VISIBLE) {
        if(ui->active == &window->header) {
            if(IS_USER_KEY_DOWN_LEFT) {
                Vector2 dtMouse = GetMouseDelta();
                window->x += dtMouse.x;
                window->y += dtMouse.y;

                recHeader.x = window->x;
                recHeader.y = window->y;
                recMessage.x = recHeader.x;
                recMessage.y = recHeader.y + recHeader.height;
            }
        }

        // Header
        UiElement(ui, &window->header, recHeader.x, recHeader.y, recHeader.width, recHeader.height, NULL);

            
        // Main Message
        UiElement(ui, &window->recMain, recMessage.x, recMessage.y, recMessage.width, recMessage.height, NULL);

        // Close-Button
        if(window->flags & UIWND_FLAG_HAS_CLOSE_BUTTON) {
            Rectangle recX      = CLITERAL(Rectangle){window->x + window->width - UI_HEADER_HEIGHT, window->y, UI_HEADER_HEIGHT, UI_HEADER_HEIGHT};
            bool closeBtnClicked = DrawButtonColored(recX, NULL, 0, UI_COLOR_BUTTON_OFF, UI_COLOR_BUTTON_OFF_HOVER, UI_COLOR_BUTTON_OFF_PRESSED, UI_COLOR_BUTTON_OFF_TEXT); 
            if(closeBtnClicked) {
                window->lastResult = UIWND_RESULT_CLOSE_BUTTON;
                window->flags |= UIWND_FLAG_SHALL_HIDE;
            }
        }

        switch(window->type) {
        case UIWND_TYPE_YESNO: {
            if(window->buttons.count < 2) {
                break;
            }

            int fontSize = window->buttons.elements[0].btn.fontSize;

            int x  = window->x;
            int y  = window->y + window->height;
            int dx = window->width / window->buttons.count;
            int wYes = dx, wNo = dx;

            Rectangle recYes = CLITERAL(Rectangle){x + dx*0, y, wYes, fontSize};
            Rectangle recNo  = CLITERAL(Rectangle){x + dx*1, y, wNo,  fontSize};

            bool yesClicked = UiElement(ui, &window->buttons.elements[0], recYes.x, recYes.y, recYes.width, recYes.height, NULL);
            bool noClicked  = UiElement(ui, &window->buttons.elements[1], recNo.x,  recNo.y,  recNo.width,  recNo.height,  NULL);

            if(yesClicked) {
                window->lastResult = UIWND_RESULT_YES;
                window->flags |= UIWND_FLAG_SHALL_HIDE;
            }

            if(noClicked) {
                window->lastResult = UIWND_RESULT_NO;
                window->flags |= UIWND_FLAG_SHALL_HIDE;
            }
        } break;

        }
    }
}

void
DrawMap(AppState *state, Rectangle recMap, Texture2D txMtAtlas, Texture2D txMap)
{
    StageMap *map = &state->map;

    //if(map->bytesPerIndex == 2)
    {
        Rectangle rectDest = {0};
        Rectangle rectSrc = {0, 0, METATILE_DIM, METATILE_DIM};
        rectDest.width  = rectSrc.width;
        rectDest.height = rectSrc.height;
        
        Vector2i mtMouse = GetMetatilePointBelowMouse(map, recMap);

        { // Only draw inside the map "widget"
        BeginScissorMode(recMap.x, recMap.y, recMap.width, recMap.height);
            // Clear the buffer
            ClearBackground(state->paths.map.palette.colors[0]);

            // TEMP?
            // Create a 1-pixel backdrop, because 0th color is fully transparent,
            // so the mouse-hover isn't shown
            static Texture txBackdrop = {0};
            if(!txBackdrop.id) {
                Image backdrop = {
                    .width = 1,
                    .height = 1,
                    .mipmaps = 1,
                    .format = txMap.format,
                    .data = &state->paths.map.palette.colors[0],
                };
                txBackdrop = LoadTextureFromImage(backdrop);
            }
            
            bool isHoveringUI    = (state->uiCtx.hot != NULL);
            bool isHoveringSpawn = IsMouseOnSpawn(map, &state->paths.characters);

            for(int y = 0; y < (recMap.height / METATILE_DIM) + 1; y++) {
                for(int x = 0; x < (recMap.width / METATILE_DIM) + 1; x++) {
                    rectDest.x = x*METATILE_DIM - (map->camera.x % METATILE_DIM) + recMap.x;
                    rectDest.y = y*METATILE_DIM - (map->camera.y % METATILE_DIM) + recMap.y;
                    
                    int mtX = (x + (map->camera.x / METATILE_DIM));
                    int mtY = (y + (map->camera.y / METATILE_DIM));
                    
                    bool isHoveredOver     = (mtX == mtMouse.x && mtY == mtMouse.y);
                    bool drawMouseMetatile = (isHoveredOver && !isHoveringUI && !isHoveringSpawn && !(state->uiCtx.active));
                    bool isSelected        = (mtX == map->selectedMetatile.x && mtY == map->selectedMetatile.y);
                    bool isFirstMouse      = (mtX == map->initialMetatile.x && mtY == map->initialMetatile.y);
                    bool firstMouseExists  = (map->initialMetatile.x >= 0 && map->initialMetatile.y >= 0);

                    bool metatileShouldDarken =
                            (firstMouseExists &&  isFirstMouse) ||
                            !firstMouseExists && drawMouseMetatile;

                    Color tint = (metatileShouldDarken) ? LIGHTGRAY : WHITE;
                    Color tintDarkened = tint;
                    
                    // Darken even further on button-press
                    if(metatileShouldDarken && (isFirstMouse || IS_USER_KEY_DOWN_LEFT)) {
                        tint = CLITERAL(Color) {
                            tint.r * 0.8,
                            tint.g * 0.8,
                            tint.b * 0.8,
                            tint.a,
                        };
                    }

                    // Draw backdrop for 0th color
                    if(metatileShouldDarken) { 
                        DrawTexturePro(txBackdrop,
                            CLITERAL(Rectangle){0,0,1,1},
                            CLITERAL(Rectangle){rectDest.x, rectDest.y, METATILE_DIM, METATILE_DIM},
                            CLITERAL(Vector2){0, 0}, 0,
                            tint
                        );
                    }
                    
                    int mtIndexBack  = GetMetatileIndex(&state->map, &state->paths.map, LAYER_BACK,  mtX, mtY);
                    int mtIndexFront = GetMetatileIndex(&state->map, &state->paths.map, LAYER_FRONT, mtX, mtY);

                    bool iterateAgain = false;
                    do {
                        // Metatile 0 is always fully transparent, so don't draw that.
                        if(mtIndexBack && (map->flags & MAP_FLAG_SHOW_BACK_LAYER)) {
                            rectSrc.x = (mtIndexBack % ATLAS_WIDTH) * METATILE_DIM;
                            rectSrc.y = (mtIndexBack / ATLAS_WIDTH) * METATILE_DIM;

                            DrawTextureRec(txMtAtlas, rectSrc, CLITERAL(Vector2){rectDest.x, rectDest.y}, tint);
                        }

                        if(mtIndexFront && (map->flags & MAP_FLAG_SHOW_FRONT_LAYER)) {
                            rectSrc.x = (mtIndexFront % ATLAS_WIDTH) * METATILE_DIM;
                            rectSrc.y = (mtIndexFront / ATLAS_WIDTH) * METATILE_DIM;
                            DrawTextureRec(txMtAtlas, rectSrc, CLITERAL(Vector2){rectDest.x, rectDest.y}, tint);
                        }

                        if(!iterateAgain) {
                            if(drawMouseMetatile) {
                                mtIndexBack  = map->selectedMetatileIndexBack;
                                mtIndexFront = map->selectedMetatileIndexFront;
                                
                                iterateAgain = true;
                            }
                        } else {
                            break;
                        }
                    } while (iterateAgain);

                    // Draw outline for selected metatile in map
                    if(isSelected) {
                        DrawRectangleLines(rectDest.x, rectDest.y, rectDest.width, rectDest.height, RED);
                    }
                }
            }
        EndScissorMode();
        }
    }
    // else
    {
        // TODO: bytesPerIndex == 1
    }
}
