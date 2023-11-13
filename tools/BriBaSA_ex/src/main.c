/* A work-in-progress rewrite of a map editor for the Sonic Advance trilogy.
 *
 * The original code was software-rednered and windows-only, using its APIs.
 * This complete rewrite uses Raylib by raysan5 as its base.
 *
 * "BriBaSA" and "BriBaSA SAT-R" created by JaceCear
*/

#include <malloc.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <config.h> // from Raylib
#include <raylib.h>

#include "jasc_parser/jasc_parser.h"
#include "../../_shared/c_header_parser/parser.h"

#define TILE_DIM 8
#define TILES_PER_METATILE 12
#define METATILE_DIM (TILES_PER_METATILE*TILE_DIM)
#define NUM_TILES_INSIDE_METATILES (TILES_PER_METATILE*TILES_PER_METATILE)


#define ATLAS_WIDTH   32
#define ATLAS_HEIGHT  32

#define GBA_DISPLAY_WIDTH  240
#define GBA_DISPLAY_HEIGHT 160
#define GBA_DISPLAY_BORDER_COLOR RED

#define UI_HEADER_HEIGHT               18

#define UI_APP_CLOSE_BUTTON_DIM       20

#define UI_COLOR_APP_HEADER           LIGHTGRAY
#define UI_COLOR_BACKGROUND           RAYWHITE
#define UI_COLOR_BACKGROUND_SAVE      DARKBLUE
#define UI_COLOR_BUTTON               GRAY
#define UI_COLOR_BUTTON_HOVER         LIGHTGRAY
#define UI_COLOR_BUTTON_PRESSED       DARKGRAY
#define UI_COLOR_BUTTON_TEXT          WHITE
#define UI_COLOR_BUTTON_OFF           RED
#define UI_COLOR_BUTTON_OFF_HOVER     PINK
#define UI_COLOR_BUTTON_OFF_PRESSED   MAROON
#define UI_COLOR_BUTTON_OFF_TEXT      WHITE
#define UI_COLOR_BUTTON_ON            LIME
#define UI_COLOR_BUTTON_ON_HOVER      GREEN
#define UI_COLOR_BUTTON_ON_PRESSED    DARKGREEN
#define UI_COLOR_BUTTON_ON_TEXT       WHITE
#define UI_COLOR_BUTTON_PREVIEW_BACK  BLUE
#define UI_COLOR_BUTTON_PREVIEW_FRONT MAROON
#define UI_COLOR_BUTTON_SAVE          LIME
#define UI_COLOR_BUTTON_SAVE_HOVER    GREEN
#define UI_COLOR_BUTTON_SAVE_PRESSED  DARKGREEN
#define UI_COLOR_BUTTON_SAVE_TEXT     WHITE
#define UI_COLOR_BUTTON_SAVE_WARN          GOLD
#define UI_COLOR_BUTTON_SAVE_WARN_HOVER    YELLOW
#define UI_COLOR_BUTTON_SAVE_WARN_PRESSED  ORANGE
#define UI_COLOR_BUTTON_SAVE_WARN_TEXT     GRAY
#define UI_COLOR_TEXT                 DARKBLUE
#define UI_COLOR_TRANSLUCENT          CLITERAL(Rectangle){WHITE.r, WHITE.g, WHITE.b, 127}
#define UI_COLOR_WINDOW_BACK          RAYWHITE
#define UI_COLOR_WINDOW_HEADER        LIGHTGRAY

#define UIWND_ID_UNSAVED_CHANGES      0

#define IS_USER_KEY_DOWN_LEFT (IsMouseButtonDown(MOUSE_BUTTON_LEFT) || IsKeyDown(KEY_X))

// Adds an element to any dynamic array (with "capacity", "count" and "SomeType *elements").
// Please make sure to initialize your list to all-zeroes before calling this macro.
#define DA_DEFAULT_CAP 128
#define da_append_to(list, new_element_ptr, _arrayName)                                                  \
{                                                                                                           \
    while((list)->count + 1 > (list)->capacity) {                                                           \
        (list)->capacity += DA_DEFAULT_CAP;                                                                 \
        (list)->_arrayName = realloc((list)->_arrayName, (list)->capacity * sizeof((list)->_arrayName[0])); \
    }                                                                                                       \
                                                                                                            \
    memcpy(&(list)->_arrayName[(list)->count++], new_element_ptr, sizeof(*new_element_ptr));                  \
}
#define da_append(list, new_element_ptr)                                                                    \
{                                                                                                           \
    da_append_to(list, new_element_ptr, elements);                                                          \
}

#define MIN(a, b) ( ((a) < (b)) ? (a) : (b) )
#define MAX(a, b) ( ((a) > (b)) ? (a) : (b) )
#define CLAMP(value, min, max) (MIN(MAX(value, min), max))

typedef enum {
    GAME_UNK = 0,
    GAME_SA1 = 1,
    GAME_SA2 = 2,
    GAME_SA3 = 3,
    GAME_KATAM = 4,
} Game;

typedef enum {
    LAYER_BACK = 0,
    LAYER_FRONT = 1,

    LAYER_COUNT
} MetatileLayer;

typedef enum {
    ET_INTERACTABLE = 0,
    ET_ITEM         = 1,
    ET_ENEMY        = 2,
    ET_RING         = 3,

    ENTITY_TYPE_COUNT
} EntityType;

typedef enum {
    MAP_FLAG_SHOW_BACK_LAYER  = 0x1,
    MAP_FLAG_SHOW_FRONT_LAYER = 0x2,

    // A little GBA display preview which might help to test visual consistency
    MAP_FLAG_SHOW_GBA_RECT    = 0x4,

    MAP_FLAGS_ON_INIT = (MAP_FLAG_SHOW_BACK_LAYER | MAP_FLAG_SHOW_FRONT_LAYER),
} MapFlags;

typedef enum {
    UIWND_FLAG_IS_VISIBLE        = 0x1,
    UIWND_FLAG_SHALL_HIDE        = 0x2,

    // Set only after processing UIWND_FLAG_SHALL_HIDE.
    UIWND_FLAG_HID_AWAY          = 0x4,

    UIWND_FLAG_HAS_CLOSE_BUTTON  = 0x8,
} UIWindowFlag;

typedef enum {
    UIWND_TYPE_DEFAULT      = 0,
    UIWND_TYPE_OK           = 1,
    UIWND_TYPE_YESNO        = 2,
    // UIWND_TYPE_SOMEOTHER    = 3,
} UIWindowType;

typedef enum {
    UIWND_RESULT_NO             = -1,
    UIWND_RESULT_DEFAULT        = 0,
    UIWND_RESULT_CLOSE_BUTTON   = UIWND_RESULT_DEFAULT,
    UIWND_RESULT_YES            = 1,
} UIWindowResult;

typedef struct {
    Color *colors;
    int count;
} Palette;

typedef struct {
    char *path;
    void *data;
    int dataSize;
} File;

typedef struct {
    char *dir;

    Image tileset;
    Palette palette;

    // Used for metatiles in maps
    File tilemap;

    // 12 for metatiles
    unsigned short xTiles, yTiles;
    char bytesPerTilemapIndex;

    /* Only used for stage maps */
    File layers[LAYER_COUNT];
    File collisionFlags;
    File collisionHeightmap;
    File collisionRotation;
} Tilemap;

typedef struct {
    Texture *elements;
    int capacity, count;
} TextureList;

typedef struct {
    File enemiesCSV;
    File interactablesCSV;
    File itemboxesCSV;
    File ringsCSV;
} Entities;

typedef struct {
    char *name;
    unsigned short id;
    unsigned short animIdle, animGettingReady;
    Texture2D texture;
} Character;

typedef struct {
    Character *elements;
    short count, capacity;
    short selected;
} CharacterList;

typedef struct {
    char *name;
    unsigned short id;
    unsigned short anim;
    Texture2D texture;
} EntityMeta;

typedef struct {
    char *name;
    char *type;
    unsigned short id;
    unsigned short anim;
    Texture2D texture;
} InteractableMeta;

typedef struct {
    EntityMeta *elements;
    int capacity, count;
} EntityMetaList;

typedef struct {
    InteractableMeta *elements;
    int capacity, count;
} InteractableMetaList;

typedef struct {
    Texture txItembox;
    TextureList oneUpIcons;
    EntityMetaList items;
    unsigned short animItembox;
    unsigned short animItemType;
} ItemMetaList;



typedef struct {
    // The dir containing "data/", "graphics/", "src/", etc.
    char *gameRoot;

    // e.g. ./data/maps/zone_1/act_1/
    char *mapRoot;

    Tilemap background;
    Tilemap map;
    Entities entities;

    /* C-Header paths containing constants */
    char *game_h;
    char *animations_h;
    char *enemies_h;
    char *interactables_h;
    char *items_h;

    // "SONIC", "TAILS", ...
    CharacterList characters;

    EntityMetaList enemies;
    InteractableMetaList interactables;
    ItemMetaList items;
    EntityMeta ring;
} FileInfo;


typedef struct {
    int x;
    int y;
} Vector2i;

typedef struct {
    void *data; // SA1: u8*, SA2/SA3: u16*
    int size;
} MapLayout;

typedef struct {
    int x, y;
} MapCamera;

typedef struct {
    // The metatile indices currently selected, in the following format:
    // (BBBB: Back, FFFF: Front - 16 bits each)
    // BBBB FFFF BBBB FFFF
    unsigned short *metatiles;
    short width, height;
    int capacity;
} MapSelection;

typedef struct {
    int width;
    int height;
    unsigned short spawnX, spawnY;

    MapFlags flags;
    
    MapCamera camera;

    // Position of Metatile on first mouse-down
    Vector2i initialMetatile;

    // Position of Metatile that is selected
    Vector2i selectedMetatile;
    short selectedMetatileIndexFront;
    short selectedMetatileIndexBack;
} StageMap;

typedef struct {
    int x, y;
    int width, height;
    UIWindowFlag flags;
    UIWindowType type;
    UIWindowResult lastResult;
    char *headerText;
    char *message;
} UIWindow;

typedef struct {
    int count, capacity;
    UIWindow *elements;
} UIWindowList;

typedef struct {
    UIWindowList windows;

    Rectangle recHeader;
    Rectangle recMap;

    // FALSE (split): Display preview metatile's layers separately
    // TRUE (merged): Display preview metatile's layers ontop eachother
    bool isMtPreviewMerged;
} Ui;

typedef struct {
    int windowWidth;
    int windowHeight;
    bool ignoreUnsavedChanges;
    bool unsavedChangesExist;

    // Root directory of one of the SAT-R decomp projects
    // or a project based on them.
    // TODO: Remove (replaced with FileInfo!)
    Game game;

    FileInfo paths;

    StageMap map;
    Ui ui;
} AppState;


/* Data structures for asset files */
typedef struct {
    u16 tileIndex : 10;
    u16 xFlip : 1;
    u16 yFlip : 1;
    u16 pal : 4;
} MetatileTile;

static void CreateUIWindows(AppState *state);
static bool DrawButton(int x, int y, int width, int height, char *text);
static bool DrawButtonRec(Rectangle rec, char *text);
static bool DrawButtonColored(Rectangle rec, char *text, int fontSize, Color tint, Color hoverTint, Color PressTint, Color textTint);

static Texture2D CreateMetatileAtlas(AppState *state, int numMetatiles);
static Texture2D CreateMapTexture(Rectangle recMap, int pixelFormat);
static bool DrawAndHandleCloseButton(AppState *state);
static void DrawMap(AppState *state, Rectangle recMap, Texture2D txMtAtlas, Texture2D txMap);
static inline void DrawMetatilePreviewButton(AppState *state, int x, int y, Texture2D txAtlas);
static void DrawPalette(int palX, int palY, const int colorWidth, Color *colors, int numColors);
static void DrawPalettes(FileInfo *paths);

static void DrawMainHeader(AppState *state, Texture2D txAtlas);
static void DrawUI(AppState *state, Texture2D txAtlas);
static void DrawUIWindow(UIWindow *window);

static void DrawEntInteractable(AppState *state, int x, int y, int index);
static void DrawEntItem(AppState *state, int x, int y, int index);
static void DrawEntEnemy(AppState *state, int x, int y, int index);
static void DrawEntRing(AppState *state, int x, int y);

static inline int GetMetatileIndex(AppState *state, int x, int y, MetatileLayer layer);
static void ParseOrCreateMetadataTxt(AppState *state, Tilemap* tm);
static Vector2i GetMetatilePointBelowMouse(StageMap *map, Rectangle recMap);
static void HandleMouseInput(AppState *state, Rectangle recMap);
static void HandleKeyInput(AppState *state, Rectangle recMap);
static bool HandleMouseInputUIWindows(AppState *state);
static void SetupFilePaths(FileInfo *outInfo, char *gameDir, char *mapDir);
static void LoadEntityNamesAndIDs(AppState *state);
static void LoadAllEntityTextures(AppState *state);

static Rectangle GetSpawnPosRectangle(StageMap *map, CharacterList *chars);
static void HandleMouseInputSpawnPos(AppState *state);
static inline void MoveCameraToSpawn(AppState *state, Rectangle recMap);

static void
Debug_DrawAllEntityTextures(AppState *state);

int main(void)
{
    AppState state = {0};

    state.windowWidth  = 1600;
    state.windowHeight =  900;
    InitWindow(state.windowWidth, state.windowHeight, "BriBaSA: SAT-R ver.");
    SetWindowPosition(200, 900/3);
    SetWindowState(FLAG_WINDOW_UNDECORATED);

    SetTargetFPS(60);

    // Disable the Escape key as means to exit
    SetExitKey(KEY_NULL);

    char workingDir[MAX_FILEPATH_LENGTH];
    TextCopy(workingDir, GetWorkingDirectory());


    // NOTE: "settings.txt" is for app-specific stuff,
    //       unlike metadata.txt, which is per-map
    if(FileExists("settings.txt")) {
        // TODO: Parse and load settings
    } else {
        // TODO: Create new settings.txt file
    }

    state.game = GAME_SA2; // TODO: Load from settings.txt if it exists


    // NOTE: We could just use "../../" for the check,
    //       but then it takes more work to get the normalized path.
    char rootDir[MAX_FILEPATH_LENGTH];
    TextCopy(rootDir, GetPrevDirectoryPath(workingDir));
    TextCopy(rootDir, GetPrevDirectoryPath(rootDir));
    
    // NOTE: Do not use TextFormat strings for long,
    //       without copying them to your own allocated memory!
    const char *tempDataDir = TextFormat("%s/data", rootDir);
    
    if(!DirectoryExists(tempDataDir)) {
        printf("ERROR: %s could not be found. Closing...\n", tempDataDir);
        exit(-1);
    }
    
    const char *mapsRoot = TextFormat("%s/data/maps/", rootDir);
    if(!DirectoryExists(mapsRoot)) {
        printf("ERROR: '%s' could not be found. Closing...\n", mapsRoot);
        exit(-2);
    }

    // TODO: Ask user to select map directory and game!
    FilePathList fpl = LoadDirectoryFiles(mapsRoot);
    FilePathList mapDirs = {0};
    for(int i = 0; i < fpl.count; i++) {
        char *zone = fpl.paths[i];

        if(!IsPathFile(zone)) {
            FilePathList fplActs = LoadDirectoryFiles(zone);

            for(int actI = 0; actI < fplActs.count; actI++) {
                char *act = fplActs.paths[actI];
                
                if(!IsPathFile(act)) {
                    da_append_to(&mapDirs, &act, paths);
                }
            }

            // Free 'paths' member but not the allocated path strings themselves.
            RL_FREE(fplActs.paths);
        }
    }
    UnloadDirectoryFiles(fpl);

    char mapDir[MAX_FILEPATH_LENGTH];
    TextCopy(mapDir, mapDirs.paths[0]);



    SetupFilePaths(&state.paths, rootDir, mapDir);

    LoadEntityNamesAndIDs(&state);
    LoadAllEntityTextures(&state);

    CreateUIWindows(&state);
    
    memset(&state.map, 0, sizeof(state.map));
    state.map.flags |= MAP_FLAGS_ON_INIT;
    state.map.initialMetatile.x = -1;
    state.map.initialMetatile.y = -1;
    state.map.selectedMetatile.x = -1;
    state.map.selectedMetatile.y = -1;
    
    ParseOrCreateMetadataTxt(&state, &state.paths.map);
    
    const int metatileTileCount = state.paths.map.xTiles * state.paths.map.yTiles;
    int numMetatiles = state.paths.map.tilemap.dataSize / metatileTileCount;

    Texture2D txAtlas = CreateMetatileAtlas(&state, numMetatiles);
    
    Rectangle recMap = {               0, METATILE_DIM ,   // x, y
                         GetScreenWidth(), GetScreenHeight() - METATILE_DIM}; // w, h

    Texture2D txMap = CreateMapTexture(recMap, txAtlas.format);



    recMap.width  = MIN(recMap.width,  state.map.width  * METATILE_DIM);
    recMap.height = MIN(recMap.height, state.map.height * METATILE_DIM);

    MoveCameraToSpawn(&state, recMap);


    bool closeBtnClicked = false;
    while (!WindowShouldClose())
    {
        HandleMouseInput(&state, recMap);

        HandleKeyInput(&state, recMap);

        BeginDrawing();
            ClearBackground(UI_COLOR_BACKGROUND);
            
            DrawText(state.paths.gameRoot, 2, 0, 10, UI_COLOR_TEXT);
            
            DrawMap(&state, recMap, txAtlas, txMap);

            DrawMainHeader(&state, txAtlas);
            DrawPalettes(&state.paths);

            DrawUI(&state, txAtlas);

            HandleMouseInputSpawnPos(&state);
            
            //Debug_DrawAllEntityTextures(&state);

            closeBtnClicked |= DrawAndHandleCloseButton(&state);
        EndDrawing();

        if(closeBtnClicked) {
            if (state.unsavedChangesExist) {
                UIWindow *window = &state.ui.windows.elements[UIWND_ID_UNSAVED_CHANGES];

                if(window->flags & UIWND_FLAG_HID_AWAY) {
                    if(window->lastResult == UIWND_RESULT_YES) {
                        break;
                    }

                    closeBtnClicked = false;
                }
            } else {
                break;
            }
        }
    }

    CloseWindow();

    return 0;
}

static void
Debug_DrawAllEntityTextures(AppState *state)
{
    /* TEMP Test-Code */
    int testX = 200;
    int testY = 120;
    int iaCount = state->paths.interactables.count;
    for(int iaIndex = 0; iaIndex < iaCount; iaIndex++) {
        DrawEntInteractable(state,
            testX + 40*(iaIndex % 32), testY + 40*(iaIndex / 32),
            iaIndex);
    }
    testY += 42*(iaCount/32 + 1);

    for(int item = 0; item < state->paths.items.items.count; item++) {
        DrawEntItem(state, testX + 32*item, testY, item);
    }
    testY += 32;
            
    for(int enemy = 0; enemy < state->paths.enemies.count; enemy++) {
        DrawEntEnemy(state, testX + 32*enemy, testY, enemy);
    }
    testY += 32;
            
    DrawEntRing(state, testX, testY);
}

static Texture2D
CreateMapTexture(Rectangle recMap, int pixelFormat)
{
    Image imgMap   = {0};
    imgMap.width   = recMap.width;
    imgMap.height  = recMap.height;
    imgMap.format  = pixelFormat;
    imgMap.mipmaps = 1;
    imgMap.data    = malloc(imgMap.width * imgMap.height * sizeof(Color));

    Texture2D txMap = LoadTextureFromImage(imgMap);
    free(imgMap.data);

    return txMap;
}

static bool
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

static void
CreateUIWindows(AppState *state)
{
    // UIWND_ID_UNSAVED_CHANGES = 0
    UIWindow warnChangesMade = {0};
    warnChangesMade.width  = 200;
    warnChangesMade.height = 100;
    warnChangesMade.x = state->windowWidth  / 2 - warnChangesMade.width  / 2;
    warnChangesMade.y = state->windowHeight / 2 - warnChangesMade.height / 2;
    warnChangesMade.flags = 0;
    warnChangesMade.type = UIWND_TYPE_YESNO;
    warnChangesMade.headerText = "Unsaved changes";
    warnChangesMade.message    = "There are unsaved changes.\n"
                                 "Do you still want to exit?";
    
    da_append(&state->ui.windows, &warnChangesMade);
}

static bool
IsMouseAboveUiElements(AppState *state)
{
    bool isHovering = false;

    for(int i = 0; i < state->ui.windows.count; i++)  {
        UIWindow *window = &state->ui.windows.elements[i];
        if(window->flags & UIWND_FLAG_IS_VISIBLE) {

            Rectangle rec = {
                window->x,
                window->y,
                window->width,
                window->height
            };

            if(CheckCollisionPointRec(GetMousePosition(), rec)) {
                isHovering = true;
                break;
            }
        }
    }

    return isHovering;
}

static bool
HandleMouseInputUIWindows(AppState *state)
{
    bool mouseHoversUi = false;

    for(int i = 0; i < state->ui.windows.count; i++) {
        UIWindow *window = &state->ui.windows.elements[i];

        if(window->flags & UIWND_FLAG_IS_VISIBLE) {
            if(window->flags & UIWND_FLAG_SHALL_HIDE) {
                window->flags &= ~UIWND_FLAG_SHALL_HIDE;
                window->flags &= ~UIWND_FLAG_IS_VISIBLE;
                window->flags |= UIWND_FLAG_HID_AWAY;
                continue;
            } else {
                // Window did not have to hide, so we flag that it didn't
                window->flags &= ~UIWND_FLAG_HID_AWAY;
            }

            Rectangle recWindow = {
                window->x,
                window->y,
                window->width,
                window->height
            };

            if(CheckCollisionPointRec(GetMousePosition(), recWindow))
            {
                mouseHoversUi = true;
            }
        }
    }

    return mouseHoversUi;
}

static Rectangle
GetSpawnPosRectangle(StageMap *map, CharacterList *chars)
{
    short selectedChar = chars->selected;
    Texture2D *txChar = &chars->elements[selectedChar].texture;
    // TODO: Don't hardcode -METATILE_DIM here
    int sx = map->spawnX - txChar->width/2  - map->camera.x;
    int sy = map->spawnY - txChar->height/2 - map->camera.y + METATILE_DIM;
    Rectangle recChar = {sx, sy,
                         txChar->width, txChar->height};

    return recChar;
}

static inline bool
IsMouseOnSpawn(StageMap *map, CharacterList *chars)
{
    Vector2 mouse      = GetMousePosition();
    Rectangle recSpawn = GetSpawnPosRectangle(map, chars);

    return CheckCollisionPointRec(mouse, recSpawn);
}

static void
HandleMouseInputSpawnPos(AppState *state)
{
    if(!IsMouseAboveUiElements(state)) {
        CharacterList *chars = &state->paths.characters;
        if(IsMouseOnSpawn(&state->map, chars)) {
            SetMouseCursor(MOUSE_CURSOR_POINTING_HAND);

            if(IsMouseButtonPressed(MOUSE_BUTTON_LEFT)) {
                chars->selected = (++chars->selected) % chars->count;
            }
        }
    }
}

static void
SetNewMetatiles(AppState *state, int x, int y)
{
    StageMap *map = &state->map;
    short targetIndex = y * map->width + x;

    if(targetIndex < (state->paths.map.tilemap.dataSize / sizeof(short))) {
        if(map->flags & MAP_FLAG_SHOW_BACK_LAYER) {
            unsigned short *layoutBack  = state->paths.map.layers[LAYER_BACK].data;

            if(layoutBack[targetIndex] != map->selectedMetatileIndexBack) {
                layoutBack[targetIndex]  = map->selectedMetatileIndexBack;
                state->unsavedChangesExist = true;
            }
        }

        if(map->flags & MAP_FLAG_SHOW_FRONT_LAYER) {
            unsigned short *layoutFront = state->paths.map.layers[LAYER_FRONT].data;

            if(layoutFront[targetIndex] != map->selectedMetatileIndexFront) {
                layoutFront[targetIndex] = map->selectedMetatileIndexFront;
                state->unsavedChangesExist = true;
            }
        }
    }
}

static void
HandleMouseInput(AppState *state, Rectangle recMap)
{
    StageMap *map   = &state->map;
    FileInfo *paths = &state->paths;

    bool mouseHoversUi = HandleMouseInputUIWindows(state);

    if(!mouseHoversUi) {
        if(CheckCollisionPointRec(GetMousePosition(), recMap)) {
            SetMouseCursor(MOUSE_CURSOR_DEFAULT);

            Vector2i mtMouse = GetMetatilePointBelowMouse(map, recMap);


            if((IsMouseButtonDown(MOUSE_BUTTON_LEFT) || IsKeyDown(KEY_X)) && !IsMouseOnSpawn(map, &paths->characters)) {
                SetNewMetatiles(state, mtMouse.x, mtMouse.y);
            }

            if(IsMouseButtonDown(MOUSE_BUTTON_RIGHT) || IsKeyDown(KEY_V)) {
                SetMouseCursor(MOUSE_CURSOR_CROSSHAIR);

                if( (map->initialMetatile.x < 0)
                 && (map->initialMetatile.y < 0) ) {
                    map->initialMetatile.x = mtMouse.x;
                    map->initialMetatile.y = mtMouse.y;
                }
            }
            if(IsMouseButtonReleased(MOUSE_BUTTON_RIGHT) || IsKeyReleased(KEY_V)) {
                if( (map->initialMetatile.x == mtMouse.x)
                 && (map->initialMetatile.y == mtMouse.y) ) {
                    map->selectedMetatile.x = mtMouse.x;
                    map->selectedMetatile.y = mtMouse.y;

                    int mtIndexFront = GetMetatileIndex(state, state->map.selectedMetatile.x, state->map.selectedMetatile.y, LAYER_FRONT);
                    int mtIndexBack  = GetMetatileIndex(state, state->map.selectedMetatile.x, state->map.selectedMetatile.y, LAYER_BACK);
    
                    state->map.selectedMetatileIndexFront = mtIndexFront;
                    state->map.selectedMetatileIndexBack  = mtIndexBack;
                }
            
                map->initialMetatile.x = -1;
                map->initialMetatile.y = -1;
            }

            if(IsMouseButtonDown(MOUSE_BUTTON_MIDDLE) || IsKeyDown(KEY_C)) {
                SetMouseCursor(MOUSE_CURSOR_RESIZE_ALL);
                Vector2 dtMouse = GetMouseDelta();
                map->camera.x -= dtMouse.x;
                map->camera.y -= dtMouse.y;

                map->camera.x = CLAMP(map->camera.x, 0, (map->width  * METATILE_DIM) - recMap.width);
                map->camera.y = CLAMP(map->camera.y, 0, (map->height * METATILE_DIM) - recMap.height);
            }
        } else {
            SetMouseCursor(MOUSE_CURSOR_DEFAULT);
        }
    }
}

static inline void
MoveCameraToSpawn(AppState *state, Rectangle recMap)
{
    state->map.camera.x = state->map.spawnX - recMap.width/2;
    state->map.camera.y = state->map.spawnY - recMap.height/2;
    state->map.camera.x = CLAMP(state->map.camera.x, 0, (state->map.width  * METATILE_DIM) - recMap.width);
    state->map.camera.y = CLAMP(state->map.camera.y, 0, (state->map.height * METATILE_DIM) - recMap.height);
}

static void
HandleKeyInput(AppState *state, Rectangle recMap)
{
    if(IsKeyPressed(KEY_HOME)) {
        MoveCameraToSpawn(state, recMap);
    }
}

static void
DrawPalette(int palX, int palY, const int colorWidth, Color *colors, int numColors)
{
    for(int i = 0; i < numColors; i++) {
        int x = i % 16;
        int y = i / 16;

        Rectangle rect = {palX + x * colorWidth, palY + y * colorWidth,
                          colorWidth, colorWidth};
        DrawRectangleRec(rect, colors[i]);
    }
}

static void
DrawPalettes(FileInfo *paths)
{    
    const int colorWidth = 6;
    int palX = GetScreenWidth() - 32 * colorWidth - UI_APP_CLOSE_BUTTON_DIM;
    int palY = 0;
    DrawPalette(palX, palY, colorWidth, paths->map.palette.colors, paths->map.palette.count);
    DrawPalette(palX+16*colorWidth, palY, colorWidth, paths->background.palette.colors, paths->background.palette.count);
}

static void
LoadPaletteFromJascFile(char *jascPath, Palette *pal)
{
    Jasc jasc;
    parse_jasc(jascPath, &jasc);

    pal->colors = (Color*)jasc.colors;
    pal->count  = jasc.count;
}

static inline char *allocPath(char *folder, char *fileName)
{
    const char *source      = TextFormat("%s/%s", folder, fileName);
    int allocatedSize = TextLength(source) + 1;
    char *dest        = calloc(allocatedSize, 1);
    TextCopy(dest, source);
    return dest;
}

static inline void loadFile(File *out, char *fileName) {
    out->data = LoadFileData(fileName, &out->dataSize);
    out->path = fileName;
}

static inline void loadTextFile(File *out, char *fileName) {
    char *txt = LoadFileText(fileName);
    int length = TextLength(txt);

    out->data = txt;
    out->dataSize = length;
    out->path = fileName;
}

static void
SetupTilemapPaths(Tilemap *out, char *directory)
{
    Tilemap tm = {0};

    tm.dir = allocPath(directory, "");

    // Shared paths
    char *tileset = allocPath(directory, "tileset.png");
    char *palette = allocPath(directory, "palette.pal");
    char *tilemap = allocPath(directory, "metatiles.tilemap2");

    // Map-exclusive paths
    char *mapBack            = allocPath(directory, "map_back.bin");
    char *mapFront           = allocPath(directory, "map_front.bin");
    char *collisionFlags     = allocPath(directory, "flags.coll");
    char *collisionHeightmap = allocPath(directory, "height_map.coll");
    char *collisionRotation  = allocPath(directory, "tile_rot.coll");
    char *stageInfo          = allocPath(directory, "metadata.txt");

    // TODO: Standardize tileset and tilemap file names in the future!
    if(!FileExists(tileset)) {
        // Assume that this is a non-stage-map tilemap

        // NOTE: GetFileName returns pointer inside the src string
        char *tilesetName = (char *)GetFileName(tileset);
        TextCopy(tilesetName, "tiles.png");
    }

    if(!FileExists(tilemap)) {
        // Didn't find a metatiles file,
        // so check whether it's a 2-byte tilemap
        char *tilemapName = (char *)GetFileName(tilemap);
        TextCopy(tilemapName, "tilemap.tilemap2");

        if(!FileExists(tilemap)) {
            // Assume that it's a 1-byte-per-tile tilemap
            char *tilemapName = (char *)GetFileName(tilemap);
            TextCopy(tilemapName, "tilemap.tilemap1");
        }
    }

    if(FileExists(tileset)) tm.tileset = LoadImage(tileset);
    if(FileExists(palette)) LoadPaletteFromJascFile(palette, &tm.palette);
    if(FileExists(tilemap)) {
        loadFile(&tm.tilemap, tilemap);
        
        const char *ext = GetFileExtension(tilemap);
        const char *tilemap1or2 = TextSubtext(ext, TextLength("tilemap2"), 1);
        int bytesPerIndex = TextToInteger(tilemap1or2);
        if(bytesPerIndex < 0)
            bytesPerIndex = 0;

        tm.bytesPerTilemapIndex = bytesPerIndex;
    }

    /* Only used by stage maps */
    if(FileExists(mapBack))            loadFile(&tm.layers[LAYER_BACK], mapBack);    
    if(FileExists(mapFront))           loadFile(&tm.layers[LAYER_FRONT], mapFront);
    if(FileExists(collisionFlags))     loadFile(&tm.collisionFlags, collisionFlags);
    if(FileExists(collisionHeightmap)) loadFile(&tm.collisionHeightmap, collisionHeightmap);
    if(FileExists(collisionRotation))  loadFile(&tm.collisionRotation, collisionRotation);
    
    memcpy(out, &tm, sizeof(*out));
}

static void
SetupFilePaths(FileInfo *outInfo, char *gameDir, char *mapDir)
{
    FileInfo info = {0};

    info.gameRoot = gameDir;
    info.mapRoot  = mapDir;
    
    // Base Paths
    char fgPath[MAX_FILEPATH_LENGTH];
    char bgPath[MAX_FILEPATH_LENGTH];
    TextCopy(fgPath, TextFormat("%s/tilemaps/fg/", mapDir));
    TextCopy(bgPath, TextFormat("%s/tilemaps/bg/", mapDir));

    SetupTilemapPaths(&info.background, bgPath);
    SetupTilemapPaths(&info.map, fgPath);

    /* C Headers */
    info.game_h          = allocPath(gameDir, "include/game/game.h");
    info.animations_h    = allocPath(gameDir, "include/constants/animations.h");
    info.enemies_h       = allocPath(gameDir, "include/constants/enemies.h");
    info.interactables_h = allocPath(gameDir, "include/constants/interactables.h");
    info.items_h         = allocPath(gameDir, "include/constants/items.h");

    memcpy(outInfo, &info, sizeof(*outInfo));
}


static Texture2D
CreateMetatileAtlas(AppState *state, int numMetatiles)
{
    // NOTE: Max capacity is 32*32 (= 1024)
    assert (numMetatiles < (ATLAS_WIDTH*ATLAS_HEIGHT) );

    FileInfo *paths = &state->paths;
    
    Image atlas     = {0};
    atlas.width     = ATLAS_WIDTH  * paths->map.xTiles * TILE_DIM;
    atlas.height    = ATLAS_HEIGHT * paths->map.yTiles * TILE_DIM;
    atlas.format    = PIXELFORMAT_UNCOMPRESSED_R8G8B8A8;
    atlas.mipmaps   = 1;
    atlas.data      = malloc(atlas.width * atlas.height * sizeof(Color));
    
    // TODO: Account for "empty" tiles at the end of a tileset file.
    int numTilesetTiles = (paths->map.tileset.width / TILE_DIM) * (paths->map.tileset.height / TILE_DIM);

    memset(atlas.data, 0, GetPixelDataSize(atlas.width, atlas.height, atlas.format));

    Texture2D txAtlas = {0};
    for(int mtAtlasY = 0; mtAtlasY < ATLAS_HEIGHT; mtAtlasY++) {
        for(int mtAtlasX = 0; mtAtlasX < ATLAS_WIDTH; mtAtlasX++) {
            int mtAtlasIndex = mtAtlasY * ATLAS_WIDTH + mtAtlasX;

            if(mtAtlasIndex >= numMetatiles) {
                goto CreateMetatileAtlas_defer;
            }

            MetatileTile *metaTile = ((MetatileTile*)paths->map.tilemap.data) + (mtAtlasIndex * NUM_TILES_INSIDE_METATILES); 

            u8 *tileset = paths->map.tileset.data;

            for(int y = 0; y < TILES_PER_METATILE; y++) {
                for(int x = 0; x < TILES_PER_METATILE; x++) {
                    int mti = y * TILES_PER_METATILE + x;

                    MetatileTile metatileTile = metaTile[mti];


                    if(metatileTile.tileIndex >= numTilesetTiles) {
                        goto CreateMetatileAtlas_defer;
                    }

                    u8 *tile = tileset + metatileTile.tileIndex * (TILE_DIM*TILE_DIM);


                    for(int ty = 0; ty < TILE_DIM; ty++) {
                        u8 cy = (metatileTile.yFlip) ? 7 - ty : ty;

                        for(int tx = 0; tx < TILE_DIM; tx++) {
                            u8 cx = (metatileTile.xFlip) ? 7 - tx : tx;

                            // NOTE: Per default GBAGFX stores colors inverted
                            //       when using its own grayscale palette
                            u8 colorId = 15 - (tile[cy*paths->map.tileset.width + cx] % 16u);

                            u8 palId = metaTile[mti].pal * 16 + colorId;
                        
                            Color c = ((Color*)paths->map.palette.colors)[palId];

                            // 0th color is transparent
                            if(colorId == 0) {
                                c.a = 0;
                            }

                            int pixelX = mtAtlasX*METATILE_DIM + tx + (x * TILE_DIM);
                            int pixelY = mtAtlasY*METATILE_DIM + ty + (y * TILE_DIM);
                            ImageDrawPixel(&atlas, pixelX, pixelY, c);
                        }
                    }
                }
            }
        }
    }
CreateMetatileAtlas_defer:

    
    txAtlas = LoadTextureFromImage(atlas);
    free(atlas.data);

    return txAtlas;
}

static inline Vector2
GetMousePositionInRec(Rectangle rec) {
    Vector2 mousePos = GetMousePosition();

    return CLITERAL(Vector2){
        mousePos.x - rec.x,
        mousePos.y - rec.y
    };
}

static inline int
GetMetatileIndex(AppState *state, int x, int y, MetatileLayer layer)
{
    ///assert(layer < LAYER_COUNT);

    u16 *mtIndices = state->paths.map.layers[layer].data;
    return mtIndices[y * state->map.width + x];
}

static Vector2i
GetMetatilePointBelowMouse(StageMap *map, Rectangle recMap) {
    Vector2 mouse = GetMousePosition();

    if(CheckCollisionPointRec(mouse, recMap)) {
        Vector2 mouseInRect = GetMousePositionInRec(recMap);
        return CLITERAL(Vector2i) {
            (map->camera.x + mouseInRect.x) / METATILE_DIM,
            (map->camera.y + mouseInRect.y) / METATILE_DIM,
        };
    } else {
        return CLITERAL(Vector2i){-1, -1};
    }
}

static void
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
                    
                    int mtIndexBack  = GetMetatileIndex(state, mtX, mtY, LAYER_BACK);
                    int mtIndexFront = GetMetatileIndex(state, mtX, mtY, LAYER_FRONT);

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

static inline bool
DrawButton(int x, int y, int width, int height, char *text) {
    return DrawButtonRec(CLITERAL(Rectangle){x, y, width, height}, text);
}

static inline bool
DrawButtonRec(Rectangle rec, char *text) {
    return DrawButtonColored(rec, text, 20,
        UI_COLOR_BUTTON, UI_COLOR_BUTTON_HOVER, UI_COLOR_BUTTON_PRESSED, UI_COLOR_BUTTON_TEXT);
}

static inline bool
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
DrawMetatileScaled(Texture2D txAtlas, int x, int y, float scale, int metatileIndex, Color tint)
{
    Rectangle recSrc = {
        (metatileIndex % ATLAS_WIDTH) * METATILE_DIM,
        (metatileIndex / ATLAS_WIDTH) * METATILE_DIM,
        METATILE_DIM, METATILE_DIM,
    };
    
    DrawTexturePro(txAtlas, recSrc, CLITERAL(Rectangle){x, y, scale*METATILE_DIM, scale*METATILE_DIM}, CLITERAL(Vector2){0, 0}, 0.0, tint);
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
SaveAllData(AppState *state)
{
    Tilemap *map = &state->paths.map;

    File *backLayer = &map->layers[LAYER_BACK];
    SaveFileData(backLayer->path, backLayer->data, backLayer->dataSize);
    
    File *frontLayer = &map->layers[LAYER_FRONT];
    SaveFileData(frontLayer->path, frontLayer->data, frontLayer->dataSize);
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
        SaveAllData(state);
    }
}

static void
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

static void
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

static void
SetMetaEntityValues(TokenList *tokList, void *inentities, EntityType et)
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
                            InteractableMetaList *entities = (InteractableMetaList*)inentities;
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
                        EntityMetaList *entities = (EntityMetaList*)inentities;

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

static inline void
LoadCharacterTextures(char *gameRoot, CharacterList *chars)
{
    for(int c = 0; c < chars->count; c++) {
        Character *character = &chars->elements[c];
        int frame = 0;
        const char *animPath = TextFormat("%s/graphics/obj_tiles/4bpp/anim_%04d/f%03d.png",
                                          gameRoot, character->animIdle, frame);
        character->texture = LoadTexture(animPath);
    }
}

static inline void
LoadEntityTextures(char *gameRoot, EntityMetaList *ents)
{
    for(int c = 0; c < ents->count; c++) {
        EntityMeta *ent = &ents->elements[c];
        int frame = 0;
        const char *animPath = TextFormat("%s/graphics/obj_tiles/4bpp/anim_%04d/f%03d.png",
                                          gameRoot, ent->anim, frame);
        ent->texture = LoadTexture(animPath);
    }
}

static inline void
LoadInteractableTextures(char *gameRoot, InteractableMetaList *ias)
{
    for(int c = 0; c < ias->count; c++) {
        InteractableMeta *ia = &ias->elements[c];
        int frame = 0;
        const char *animPath = TextFormat("%s/graphics/obj_tiles/4bpp/anim_%04d/f%03d.png",
                                          gameRoot, ia->anim, frame);
        ia->texture = LoadTexture(animPath);
    }
}

static inline void
LoadRingTexture(char *gameRoot, EntityMeta *ring)
{
    int frame = 0;
    const char *animPath = TextFormat("%s/graphics/obj_tiles/4bpp/anim_%04d/f%03d.png",
                                        gameRoot, ring->anim, frame);
    ring->texture = LoadTexture(animPath);
    
}

static inline void
LoadItemTextures(char *gameRoot, ItemMetaList *items, short numCharacters)
{
    const char *pathFormat = "%s/graphics/obj_tiles/4bpp/anim_%04d/f%03d.png";

    // Itembox
    unsigned short animId = items->animItembox;
    const char *itemboxPath   = TextFormat(pathFormat, gameRoot, animId, 0);
    items->txItembox = LoadTexture(itemboxPath);

    // 1-Up icons
    for(int c = 0; c < numCharacters; c++) {
        unsigned short animId = items->animItemType;
        const char *iconPath = TextFormat(pathFormat, gameRoot, animId, c);
        Texture tx1Up  = LoadTexture(iconPath);

        da_append(&items->oneUpIcons, &tx1Up);
    }

    // Load all items
    for(int i = 0; i < items->items.count; i++) {
        EntityMeta *ent = &items->items.elements[i];

        if(i == 0) {
            ent->texture = items->oneUpIcons.elements[0];
        } else {
            const char *animPath = TextFormat(pathFormat, gameRoot, items->animItemType, (i - 1) + numCharacters);
            ent->texture = LoadTexture(animPath);
        }
    }
}

static void
DrawEntInteractable(AppState *state, int x, int y, int index)
{
    InteractableMeta *ia = &state->paths.interactables.elements[index];

    DrawTexture(ia->texture, x - (ia->texture.width / 2), y - (ia->texture.height / 2), WHITE);
}

static void
DrawEntItem(AppState *state, int x, int y, int index)
{
    ItemMetaList *items = &state->paths.items;

    DrawTexture(items->txItembox, x - (items->txItembox.width / 2), y - (items->txItembox.height / 2), WHITE);

    if(index == 0) {
        Texture *tx = &items->oneUpIcons.elements[state->paths.characters.selected];
        DrawTexture(*tx, x - (tx->width / 2), y - (tx->height / 2), WHITE);
    } else {
        Texture *tx = &items->items.elements[index].texture;
        DrawTexture(*tx, x - (tx->width / 2), y - (tx->height / 2), WHITE);
    }
}

static void
DrawEntEnemy(AppState *state, int x, int y, int index)
{
    EntityMeta *enemy = &state->paths.enemies.elements[index];

    DrawTexture(enemy->texture, x - (enemy->texture.width / 2), y - (enemy->texture.height / 2), WHITE);
}

static void
DrawEntRing(AppState *state, int x, int y)
{
    EntityMeta *ring = &state->paths.ring;

    // TODO: Right now there are 4 ring frames in a single PNG file, so we've got to draw it a little unintuitively
    DrawTextureRec(ring->texture,
                   CLITERAL(Rectangle){0, 0, ring->texture.width, ring->texture.width},
                   CLITERAL(Vector2){x - (ring->texture.width / 2), y - ((ring->texture.height / 4) / 2)},
                   WHITE);
}

static void
LoadAllEntityTextures(AppState *state)
{
    FileInfo *paths = &state->paths;

    LoadCharacterTextures(paths->gameRoot, &paths->characters);
    LoadInteractableTextures(paths->gameRoot,    &paths->interactables);
    LoadEntityTextures(paths->gameRoot,    &paths->enemies);
    LoadItemTextures(paths->gameRoot,      &paths->items, paths->characters.count);
    LoadRingTexture(paths->gameRoot,       &paths->ring);
}

static void
LoadEntityNamesAndIDs(AppState *state)
{
    MemArena arena;
    memArenaInit(&arena);
    
    TokenList tokensGame    = tokenize(&arena, state->paths.game_h);
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

    // Look for animations
    if(((numCharacters != 0) && numCharactersFromTokens != 0) && (numCharacters == numCharactersFromTokens)) {
        // We found all characters, search for their animations

        CharacterList *chars = &state->paths.characters;

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
                        state->paths.items.animItembox = TextToInteger(tokenID->text);
                    } else if(TextIsEqual(tokenName->text, TextFormat("SA%d_ANIM_ITEMBOX_TYPE", state->game))) {
                        state->paths.items.animItemType = TextToInteger(tokenID->text);
                    } else if(TextIsEqual(tokenName->text, TextFormat("SA%d_ANIM_RING", state->game))) {
                        state->paths.ring.anim = TextToInteger(tokenID->text);
                    } else if(foundEnemyAnims < state->paths.enemies.count) {
                        for(int ei = 0; ei < state->paths.enemies.count; ei++) {
                            unsigned short id = state->paths.enemies.elements[ei].id;
                            EntityMeta *enemy = &state->paths.enemies.elements[id];
                            const char *format = TextFormat("SA%d_ANIM_%s", state->game, enemy->name);

                            if(TextIsEqual((char *)tokenName->text, format)) {                    
                                enemy->anim = TextToInteger(tokenID->text);

                                foundEnemyAnims++;
                                break;
                            }
                        }
                    } else if(foundIAAnims < state->paths.interactables.count) {
                        for(int ii = 0; ii < state->paths.interactables.count; ii++) {
                            unsigned short id    = state->paths.interactables.elements[ii].id;
                            InteractableMeta *ia = &state->paths.interactables.elements[id];
                            const char *format   = TextFormat("SA%d_ANIM_%s", state->game, ia->name);

                            if(TextIsEqual((char *)tokenName->text, format)) {
                                do {
                                    ia->anim = TextToInteger(tokenID->text);

                                    foundIAAnims++;

                                } while((++ii < state->paths.interactables.count) && TextIsEqual(ia->name, (ia+1)->name) && ++ia);
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
                   "'%s'", state->paths.game_h);
        } else if(numCharactersFromTokens == 0) {
            printf("Did not find any 'CHARACTER_XYZ' values in\n"
                   "'%s'", state->paths.game_h);
        } else {
            printf("ERROR: Number of found player characters (%d) does not match NUM_CHARACTERS (%d).\n"
                   "       Please make sure NUM_CHARACTERS is defined after the individual characters.\n"
                   "       (Searched in '%s')\n",
                numCharacters, numCharactersFromTokens, state->paths.game_h);
        }
    }
}


static void
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