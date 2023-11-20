#include <raylib.h>

#include "global.h"
#include "drawing.h"
#include "map.h"
#include "save.h"
#include "texture.h"

/* TODO: Make including <entity>.h from game code work */

// From light_bridge.h
#define BRIDGE_SEGMENT_WIDTH 12
#define BRIDGE_WIDTH         (28 * TILE_WIDTH)
#define BRIDGE_TYPE_STRAIGHT 0
#define BRIDGE_TYPE_CURVED   1


#include "../../../include/constants/interactables.h"
#include "../../../include/constants/zones.h"

static void DrawEntInteractableSA2(AppState *state, int x, int y, int kind, char data[4]);
static inline bool DrawOnOffButton(Rectangle rec, char *text, bool cond);
static inline void DrawMetatile(Texture2D txAtlas, int x, int y, int metatileIndex, Color tint);
static inline void DrawMetatileScaled(Texture2D txAtlas, int x, int y, float scale, int metatileIndex, Color tint);
static inline void DrawMetatilePreviewButton(AppState *state, int x, int y, Texture2D txAtlas);
static void DrawSaveButton(AppState *state, int x, int y);
static void DrawUIWindow(UIWindow *window);


#define DRAW_ENTITY_RECT_CUSTOM_DIM(_x, _y, _offsetX, _offsetY, _width, _height, _tint)                                       \
{                                                                                                         \
    int rx = _x + _offsetX;                                                                     \
    int ry = _y + _offsetY;                                                                     \
                                                                                                          \
    DrawRectangle(rx, ry, _width, _height, UI_COLOR_TRANSLUCENT);    \
    DrawRectangleLines(rx, ry, _width, _height, _tint);              \
}

#define DRAW_ENTITY_RECT(_x, _y, _boundingDim, _tint)                                                     \
{                                                                                                         \
    DRAW_ENTITY_RECT_CUSTOM_DIM(_x, _y, (data[0] * TILE_DIM), (data[1] * TILE_DIM),                       \
        ((unsigned)data[2] * _boundingDim), data[3] * TILE_DIM, _tint);                                 \
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
        
    case IA__WINDUP_STICK: {
        boundingTint = PINK;
        flags |= DRAWIA_FLAG_DRAW_BOUNDING_BOX;
    } break;

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
        DRAW_ENTITY_RECT(x, y, boundingWidth, boundingTint);
    }

    if(flags & DRAWIA_FLAG_DRAW_MIDDLE_CIRCLE) {
        DrawCircle(x, y, 5, PINK);
        DrawCircleLines(x, y, 5.5, boundingTint);
    }
}

void
DrawEntItem(AppState *state, int x, int y, int index, char data[5])
{
    ItemMetaList *items = &state->paths.items;

    x -= (items->txItembox.width / 2);
    y -= (items->txItembox.height) - 3; // TODO: Where do these 3 pixels come from?

    DrawTexture(items->txItembox, x, y, WHITE);

    Texture tx = GetEntityTextureById(state, EntItem, index);
    DrawTexture(tx, x + (tx.width / 2), y + (tx.height / 2), WHITE);
}

void
DrawEntEnemy(AppState *state, int x, int y, int index, char data[5])
{
    EntityMeta *enemy = &state->paths.enemies.elements[index];

    DrawTexture(enemy->texture, x - (enemy->texture.width / 2), y - enemy->texture.height, WHITE);
}

void
DrawEntRing(AppState *state, int x, int y)
{
    EntityMeta *ring = &state->paths.ring;

    // TODO: Right now there are 4 ring frames in a single PNG file, so we've got to draw it a little unintuitively
    DrawTextureRec(ring->texture,
                   CLITERAL(Rectangle){0, 0, ring->texture.width, ring->texture.width},
                   CLITERAL(Vector2){x - (ring->texture.width / 2), y - (ring->texture.width)},
                   WHITE);
}

// TODO:
// - Don't iterate through all regions, only the currently visible ones
#define SPAWN_POPUP_DIM 128.0
void
DrawEntities(AppState *state, Rectangle recMap)
{
    FileInfo *paths = &state->paths;
    EntityPositions *entityPositions = &paths->entityPositions;

    Rectangle recSpawn = {
        recMap.x - SPAWN_POPUP_DIM,
        recMap.y - SPAWN_POPUP_DIM,
        recMap.width  + 2*SPAWN_POPUP_DIM,
        recMap.height + 2*SPAWN_POPUP_DIM
    };

    BeginScissorMode(recMap.x, recMap.y, recMap.width, recMap.height);
        for(int ry = 0; ry < entityPositions->rings.map_regions_y; ry++) {
            for(int rx = 0; rx < entityPositions->rings.map_regions_x; rx++) {
                int ri = ry * entityPositions->rings.map_regions_x + rx;
                MapRegion *iaRegion    = &entityPositions->interactables.regions[ri];
                MapRegion *itemRegion  = &entityPositions->items.regions[ri];
                MapRegion *enemyRegion = &entityPositions->enemies.regions[ri];
                MapRegion *ringRegion  = &entityPositions->rings.regions[ri];


                if(iaRegion) {
                    for(int entIndex = 0; entIndex < iaRegion->count; entIndex++) {
                        EntityData *ia = &iaRegion->list[entIndex];

                        int screenX = recMap.x + TO_WORLD_POS(ia->x, rx) - state->map.camera.x;
                        int screenY = recMap.y + TO_WORLD_POS(ia->y, ry) - state->map.camera.y;

                        if(CheckCollisionPointRec(CLITERAL(Vector2){screenX, screenY}, recSpawn)) {
                            DrawEntInteractable(state, screenX, screenY, ia->kind, ia->data);
                        }
                    }
                }
                if(itemRegion) {
                    for(int entIndex = 0; entIndex < itemRegion->count; entIndex++) {
                        EntityData *item = &itemRegion->list[entIndex];

                        int screenX = recMap.x + TO_WORLD_POS(item->x, rx) - state->map.camera.x;
                        int screenY = recMap.y + TO_WORLD_POS(item->y, ry) - state->map.camera.y;
                        
                        if(CheckCollisionPointRec(CLITERAL(Vector2){screenX, screenY}, recSpawn)) {
                            DrawEntItem(state, screenX, screenY, item->kind, item->data);
                        }
                    }
                }
                if(enemyRegion) {
                    for(int entIndex = 0; entIndex < enemyRegion->count; entIndex++) {
                        EntityData *enemy = &enemyRegion->list[entIndex];

                        int screenX = recMap.x + TO_WORLD_POS(enemy->x, rx) - state->map.camera.x;
                        int screenY = recMap.y + TO_WORLD_POS(enemy->y, ry) - state->map.camera.y;
                        
                        if(CheckCollisionPointRec(CLITERAL(Vector2){screenX, screenY}, recSpawn)) {
                            DrawEntEnemy(state, screenX, screenY, enemy->kind, enemy->data);
                        }
                    }
                }
                if(ringRegion) {
                    for(int entIndex = 0; entIndex < ringRegion->count; entIndex++) {
                        EntityData *ring = &ringRegion->list[entIndex];

                        int screenX = recMap.x + TO_WORLD_POS(ring->x, rx) - state->map.camera.x;
                        int screenY = recMap.y + TO_WORLD_POS(ring->y, ry) - state->map.camera.y;
                        
                        if(CheckCollisionPointRec(CLITERAL(Vector2){screenX, screenY}, recSpawn)) {
                            DrawEntRing(state, screenX, screenY);
                        }
                    }
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
        DrawEntItem(state, testX + 32*item, testY, item, data);
    }
    testY += 32;
            
    for(int enemy = 0; enemy < state->paths.enemies.count; enemy++) {
        DrawEntEnemy(state, testX + 32*enemy, testY, enemy, data);
    }
    testY += 32;
            
    DrawEntRing(state, testX, testY);
}


static inline bool
DrawButton(int x, int y, int width, int height, char *text) {
    return DrawButtonRec(CLITERAL(Rectangle){x, y, width, height}, text);
}

static inline bool
DrawButtonRec(Rectangle rec, char *text) {
    return DrawButtonColored(rec, text, 20,
        UI_COLOR_BUTTON, UI_COLOR_BUTTON_HOVER, UI_COLOR_BUTTON_PRESSED, UI_COLOR_BUTTON_TEXT);
}

inline bool
DrawButtonColored(Rectangle rec, char *text, int fontSize, Color tint, Color hoverTint, Color PressTint, Color textTint)
{
    bool wasReleased = false;

    bool mouseIsHovering = CheckCollisionPointRec(GetMousePosition(), rec);

    BeginScissorMode(rec.x, rec.y, rec.width, rec.height);
        if(mouseIsHovering) {
            SetMouseCursor(MOUSE_CURSOR_POINTING_HAND);

            if(IsMouseButtonDown(MOUSE_BUTTON_LEFT)) {
                DrawRectangleRec(rec, PressTint);
            } else {
                DrawRectangleRec(rec, hoverTint);
            }

            if(IsMouseButtonReleased(MOUSE_BUTTON_LEFT)) {
                wasReleased = true;
            }
        } else {
            DrawRectangleRec(rec, tint);
        }

        DrawText(text, rec.x + 1, rec.y + 1, fontSize, textTint);
    EndScissorMode();

    return wasReleased;
}

// Colors the button depending on 'cond' param
//  false: red
//  true:  green
static inline bool
DrawOnOffButton(Rectangle rec, char *text, bool cond)
{
    Color tintNeutral = (cond) ? UI_COLOR_BUTTON_ON         : UI_COLOR_BUTTON_OFF;
    Color tintHover   = (cond) ? UI_COLOR_BUTTON_ON_HOVER   : UI_COLOR_BUTTON_OFF_HOVER;
    Color tintPress   = (cond) ? UI_COLOR_BUTTON_ON_PRESSED : UI_COLOR_BUTTON_OFF_PRESSED;
    Color tintText    = (cond) ? UI_COLOR_BUTTON_ON_TEXT    : UI_COLOR_BUTTON_OFF_TEXT;

    return DrawButtonColored(rec, text, 20, tintNeutral, tintHover, tintPress, tintText);
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
void DrawMetatilePreviewButton(AppState *state, int x, int y, Texture2D txAtlas)
{
    const char *previewState = (state->ui.isMtPreviewMerged) ? "Merged" : "Split";
    char *btnTextMetatilePreview = (char*)TextFormat("Preview: %s", previewState);
    bool previewBtnPressed = DrawButtonRec(CLITERAL(Rectangle){x, y, 170, 20}, btnTextMetatilePreview);
    
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

static void
DrawSaveButton(AppState *state, int x, int y)
{
    // Save button
    Rectangle recBtn = CLITERAL(Rectangle){x, y, 110, 20};

    Color tint      = (state->unsavedChangesExist) ? UI_COLOR_BUTTON_SAVE_WARN         : UI_COLOR_BUTTON_SAVE;
    Color hoverTint = (state->unsavedChangesExist) ? UI_COLOR_BUTTON_SAVE_WARN_HOVER   : UI_COLOR_BUTTON_SAVE_HOVER;
    Color pressTint = (state->unsavedChangesExist) ? UI_COLOR_BUTTON_SAVE_WARN_PRESSED : UI_COLOR_BUTTON_SAVE_PRESSED;
    Color textTint  = (state->unsavedChangesExist) ? UI_COLOR_BUTTON_SAVE_WARN_TEXT    : UI_COLOR_BUTTON_SAVE_TEXT;

    bool saveButtonPressed = DrawButtonColored(recBtn,"SAVE MAP", 20, tint, hoverTint, pressTint, textTint);
    if(saveButtonPressed) {
        state->ignoreUnsavedChanges = true;
        state->unsavedChangesExist  = false;
        SaveMapLayouts(state);
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

    bool bLayerBtnPressed = DrawOnOffButton(CLITERAL(Rectangle){posX, posY += 22, 80, 20}, "Back",  backLayerFlag);
    bool fLayerBtnPressed = DrawOnOffButton(CLITERAL(Rectangle){posX += 85, posY, 83, 20}, "Front", frontLayerFlag);

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
    DrawMetatilePreviewButton(state, initialX, posY += 20, txAtlas);
    
    DrawSaveButton(state, 4, initialY + METATILE_DIM - 20 - 4);
}

void
DrawUI(AppState *state, Texture2D txAtlas)
{
    for(int i = 0; i < state->ui.windows.count; i++) {
        UIWindow *window = &state->ui.windows.elements[i];
        DrawUIWindow(window);
    }
}

static void
DrawUIWindow(UIWindow *window)
{
    Rectangle rec       = CLITERAL(Rectangle){window->x, window->y, window->width, window->height};
    Rectangle recHeader = CLITERAL(Rectangle){window->x, window->y, window->width, UI_HEADER_HEIGHT};

    if(window->flags & UIWND_FLAG_IS_VISIBLE) {
        // Background
        BeginScissorMode(rec.x, rec.y, rec.width, rec.height);
            DrawRectangleRec(rec, UI_COLOR_WINDOW_BACK);

            // Header
            DrawRectangleRec(recHeader, UI_COLOR_WINDOW_HEADER);
            if(window->headerText != NULL) {
                int fontSize = 10;
                DrawText(window->headerText, recHeader.x + 2, recHeader.y + recHeader.height/2 - fontSize/2, fontSize, UI_COLOR_TEXT);
            }

            // Main Message Text
            if(window->message != NULL) {
                int fontSize = 10;
                DrawText(window->message, rec.x + 2, recHeader.y + recHeader.height + fontSize, fontSize, UI_COLOR_TEXT);
            }

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
            case UIWND_TYPE_OK: {
                // TODO
            } break;
                
            case UIWND_TYPE_YESNO: {
                int fontSize = 10;
                Rectangle recYes = CLITERAL(Rectangle){window->x + 0.2*window->width, window->y + window->height - 2*fontSize, 30, fontSize};
                Rectangle recNo  = CLITERAL(Rectangle){window->x + 0.8*window->width, window->y + window->height - 2*fontSize, 20, fontSize};

                bool yesClicked = DrawButtonColored(recYes, "YES", 10, UI_COLOR_BUTTON_ON,  UI_COLOR_BUTTON_ON_HOVER,  UI_COLOR_BUTTON_ON_PRESSED,  UI_COLOR_BUTTON_ON_TEXT);
                bool noClicked  = DrawButtonColored(recNo,  "NO",  10, UI_COLOR_BUTTON_OFF, UI_COLOR_BUTTON_OFF_HOVER, UI_COLOR_BUTTON_OFF_PRESSED, UI_COLOR_BUTTON_OFF_TEXT);

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
        EndScissorMode();
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
            
            bool isHoveringUI    = IsMouseAboveUiElements(state);
            bool isHoveringSpawn = IsMouseOnSpawn(map, &state->paths.characters);

            for(int y = 0; y < (recMap.height / METATILE_DIM) + 1; y++) {
                for(int x = 0; x < (recMap.width / METATILE_DIM) + 1; x++) {
                    rectDest.x = x*METATILE_DIM - (map->camera.x % METATILE_DIM) + recMap.x;
                    rectDest.y = y*METATILE_DIM - (map->camera.y % METATILE_DIM) + recMap.y;
                    
                    int mtX = (x + (map->camera.x / METATILE_DIM));
                    int mtY = (y + (map->camera.y / METATILE_DIM));
                    
                    bool isHoveredOver     = (mtX == mtMouse.x && mtY == mtMouse.y);
                    bool drawMouseMetatile = (isHoveredOver && !isHoveringUI && !isHoveringSpawn);
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
                    
                    int mtIndexBack  = GetMetatileIndex(&state->map, &state->paths.map, LAYER_BACK, mtX, mtY);
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
            
            // Draw Player character at spawn position
            // TODO: Maybe only do this inside and on some border of recMap to save resources?
            int selectedChar = state->paths.characters.selected;
            Texture2D *txChar = &state->paths.characters.elements[selectedChar].texture;
            int sx = recMap.x + state->map.spawnX - state->map.camera.x - (txChar->width * 0.5);;
            int sy = recMap.y + state->map.spawnY - state->map.camera.y - (txChar->height * 0.5);

            DrawTexturePro(*txChar, CLITERAL(Rectangle){0, 0,  -txChar->width, txChar->height},
                                    CLITERAL(Rectangle){sx, sy,  txChar->width, txChar->height},
                                    CLITERAL(Vector2){0.0, 0.0}, 0.0, WHITE);
        EndScissorMode();
        }
    }
    // else
    {
        // TODO: bytesPerIndex == 1
    }
}
