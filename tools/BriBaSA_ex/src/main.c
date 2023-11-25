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
//#include "../../_shared/csv_conv/csv_conv.h"

#include "../../../include/constants/interactables.h"
#include "../../../include/constants/zones.h"

#include "global.h"
#include "drawing.h"
#include "map.h"
#include "parsing.h"
#include "texture.h"
#include "ui.h"


/* Data structures for asset files */
typedef struct {
    u16 tileIndex : 10;
    u16 xFlip : 1;
    u16 yFlip : 1;
    u16 pal : 4;
} MetatileTile;

static char *GetMapDirectory(const char *mapsRoot);
static void InitUiHeaderWidgets(UiHeader *hdr);
static void CreateUIWindows(AppState *state);

static Texture2D CreateMapTexture(Rectangle recMap, int pixelFormat);
static void DrawPalette(int palX, int palY, const int colorWidth, Color *colors, int numColors);
static void DrawPalettes(FileInfo *paths);

static void HandleMouseInput(AppState *state, Rectangle recMap);
static void HandleKeyInput(AppState *state, Rectangle recMap);
static void HandleMouseInputUIWindows(AppState *state);
static void InitFilePaths(FileInfo *outInfo, char *gameDir, char *mapDir);

static Rectangle GetSpawnPosRectangle(StageMap *map, CharacterList *chars);
static void HandleMouseInputSpawnPos(AppState *state);
static inline void MoveCameraToSpawn(AppState *state, Rectangle recMap);
static inline void MoveCameraToSpawn(AppState *state, Rectangle recMap);
static inline void MoveCameraToEnd(AppState *state, Rectangle recMap);

#if MEASURE_MALLOC
static int TempMallocCounter = 0;
static int TempMallocAllocated = 0;
static int TempMemcpyCounter = 0;
static unsigned int TempTotalMemcpyCopied  = 0;

void *_Realloc(void *block, size_t size)
{
    TempMallocCounter++;
    TempMallocAllocated += size;
    return realloc(block, size);
}

void *_Memcpy(void *dst, void *src, size_t size)
{
    TempMemcpyCounter++;
    TempTotalMemcpyCopied += size;
    return memcpy(dst, src, size);
}
#endif

int main(void)
{
    AppState state = {0};

    state.windowWidth  = 1600;
    state.windowHeight =  900;
    InitWindow(state.windowWidth, state.windowHeight, "BriBaSA: SAT-R ver.");
    SetWindowPosition(200, 300);
    SetWindowState(FLAG_WINDOW_UNDECORATED);

    SetTargetFPS(60);

    // Disable the Escape key as means to exit
    SetExitKey(KEY_NULL);

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
    TextCopy(rootDir, GetPrevDirectoryPath(GetWorkingDirectory()));
    TextCopy(rootDir, GetPrevDirectoryPath(rootDir));
    

    if(!DirectoryExists(TextFormat("%s/data", rootDir))) {
        printf("ERROR: '%s/data' could not be found. Closing...\n", rootDir);
        exit(-1);
    }
    
    const char *mapsRoot = TextFormat("%s/data/maps/", rootDir);
    if(!DirectoryExists(mapsRoot)) {
        printf("ERROR: '%s' could not be found. Closing...\n", mapsRoot);
        exit(-2);
    }

    char *mapDir = GetMapDirectory(mapsRoot);

    InitFilePaths(&state.paths, (char*)rootDir, (char*)mapDir);

    LoadEntityNamesAndIDs(&state);
    LoadAllEntityTextures(state.paths.gameRoot, &state.paths);
    LoadEntityDataFromCSVs(&state);
    
    InitUiHeaderWidgets(&state.uiHeader);
    CreateUIWindows(&state);
    
    //memset(&state.map, 0, sizeof(state.map)); // TODO: Can this be removed entirely?
    state.map.flags |= (MAP_FLAG_SHOW_BACK_LAYER | MAP_FLAG_SHOW_FRONT_LAYER);
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

        BeginDrawing();
            ClearBackground(UI_COLOR_BACKGROUND);

            DrawMainHeader(&state, txAtlas);
            DrawPalettes(&state.paths);

            DrawMap(&state, recMap, txAtlas, txMap);

            DrawMapSprites(&state, recMap);
            //Debug_DrawAllEntityTextures(&state);

            DrawUI(&state, txAtlas);

            closeBtnClicked |= DrawAndHandleCloseButton(&state);
        EndDrawing();

        if(closeBtnClicked) {
            if (!state.unsavedChangesExist) {
                break;
            } else {
                UIWindow *window = &state.ui.windows.elements[UIWND_ID_UNSAVED_CHANGES];

                if(window->flags & UIWND_FLAG_HID_AWAY) {
                    if(window->lastResult == UIWND_RESULT_YES) {
                        break;
                    }

                    closeBtnClicked = false;
                }
            }
        }
    }
    
#if MEASURE_MALLOC
    FILE *fTime = fopen("malloc.txt", "w");
    fprintf(fTime, "malloc calls: %d, bytes: 0x%X\n", TempMallocCounter, TempMallocAllocated);
    fprintf(fTime, "memcpy calls: %d, bytes: 0x%X\n", TempMemcpyCounter, TempTotalMemcpyCopied);
    fclose(fTime);
#endif

    CloseWindow();

    return 0;
}

static char *GetMapDirectory(const char *mapsRoot)
{
    // TODO: Ask user to select map directory and game!
    // 
    // Load all map directories
#if 01
    FilePathList zones = LoadDirectoryFiles(mapsRoot);
    FilePathList mapDirs = {0};
    for(int i = 0; i < zones.count; i++) {
        char *zone = zones.paths[i];

        if(!IsPathFile(zone)) {
            FilePathList acts = LoadDirectoryFiles(zone);

            for(int actI = 0; actI < acts.count; actI++) {
                char *act = acts.paths[actI];
                
                if(!IsPathFile(act)) {
                    da_append_to(&mapDirs, &act, paths);
                }
            }

            // Free 'paths' member but not the allocated path strings themselves.
            RL_FREE(acts.paths);
        }
    }
    UnloadDirectoryFiles(zones);

    int mapIndex = 4 + (ZONE_2-1)*3;
    const char *pMapDir = mapDirs.paths[mapIndex];
#else
    const char *pMapDir = TextFormat("%s/zone_3/act_1/", mapsRoot);
#endif
    char *mapDir  = malloc(TextLength(pMapDir) + 1);
    TextCopy(mapDir, pMapDir);

    return mapDir;
}

void InitUiHeaderWidgets(UiHeader *hdr)
{
    hdr->btnPreview.type = UIID_BUTTON;
    hdr->btnPreview.ident.btn.idleTint   = UI_COLOR_BUTTON;
    hdr->btnPreview.ident.btn.hotTint    = UI_COLOR_BUTTON_HOVER;
    hdr->btnPreview.ident.btn.activeTint = UI_COLOR_BUTTON_PRESSED;
    hdr->btnPreview.ident.btn.textTint   = UI_COLOR_BUTTON_TEXT;
    
    /* These buttons change color based on state, so no need to set them */
    hdr->btnBackLayer.type  = UIID_BUTTON;
    hdr->btnBackLayer.ident.btn.text = "Back";

    hdr->btnFrontLayer.type = UIID_BUTTON;
    hdr->btnFrontLayer.ident.btn.text = "Front";

    hdr->btnSaveMap.type    = UIID_BUTTON;
    hdr->btnSaveMap.ident.btn.text = "SAVE MAP";
}

static LoadEntityDataFromCSVs(AppState *state)
{
    FileInfo *paths = &state->paths;
    paths->entityPositions.interactables = ConvertCsvToBinary(paths->entityCSVs.interactables, NULL, paths->interactables_h, false);
    paths->entityPositions.items         = ConvertCsvToBinary(paths->entityCSVs.items,         NULL, paths->items_h,         false);
    paths->entityPositions.enemies       = ConvertCsvToBinary(paths->entityCSVs.enemies,       NULL, paths->enemies_h,       false);
    paths->entityPositions.rings         = ConvertCsvToBinary(paths->entityCSVs.rings,         NULL, NULL,                   false);

    int numRegionsX = paths->entityPositions.interactables.map_regions_x;
    int numRegionsY = paths->entityPositions.interactables.map_regions_y;
    int regionCount = numRegionsX * numRegionsY;

    MapRegion *regions = paths->entityPositions.interactables.regions;
    for(int iaRegion = 0; iaRegion < regionCount; iaRegion++) {
        if(regions[iaRegion].list) {
            int regionX = iaRegion % numRegionsX;
            int regionY = iaRegion / numRegionsX;

            for(int iaIndex = 0; iaIndex < regions[iaRegion].count; iaIndex++) {
                EntityData *ia = &regions[iaRegion].list[iaIndex];

                int screenX = TO_WORLD_POS(ia->x, regionX);
                int screenY = TO_WORLD_POS(ia->y, regionY);

                if(ia->kind == IA__GOAL_LEVER) {
                    state->map.endX = screenX;
                    state->map.endY = screenY;
                }
            }        
        }
    }
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

static UIWindow
CreateYesNoWindow(AppState *state, int x, int y, int width, int height, char *headerText, char *mainText)
{
    UIWindow window = {0};

    window.x = x;
    window.y = y;
    window.width  = width;
    window.height = height;
    window.flags = 0;
    window.type = UIWND_TYPE_YESNO;
    window.header.ident.rec.text = headerText;
    window.recMain.ident.rec.text = mainText;

    return window;
}

static void
CreateUIWindows(AppState *state)
{
    // UIWND_ID_UNSAVED_CHANGES = 0
    int appWidth  = state->windowWidth;
    int appHeight = state->windowHeight;
    int windowWidth  = 200;
    int windowHeight = 100;
    int x = (appWidth  / 2) - (windowWidth / 2);
    int y = (appHeight / 2) - (windowHeight / 2);

    UIWindow warnChangesMade = CreateYesNoWindow(state,
        x, y, windowWidth, windowHeight,
        "Unsaved changes",
        "There are unsaved changes.\n"
        "Do you still want to exit?");

    warnChangesMade.header.type  = UIID_RECTANGLE;
    warnChangesMade.header.ident.rec.fontSize = 10;
    warnChangesMade.header.ident.rec.textTint = UI_COLOR_TEXT;
    warnChangesMade.header.ident.rec.backTint = UI_COLOR_WINDOW_HEADER;
    warnChangesMade.recMain.type = UIID_RECTANGLE;
    warnChangesMade.recMain.ident.rec.fontSize = 10;
    warnChangesMade.recMain.ident.rec.textTint = UI_COLOR_TEXT;
    warnChangesMade.recMain.ident.rec.backTint = UI_COLOR_WINDOW_BACK;

    UiIdent btnYes;
    btnYes.type = UIID_BUTTON;
    btnYes.ident.btn.fontSize   = 20;
    btnYes.ident.btn.text       = "YES";
    btnYes.ident.btn.idleTint   = UI_COLOR_BUTTON_ON;
    btnYes.ident.btn.hotTint    = UI_COLOR_BUTTON_ON_HOVER;
    btnYes.ident.btn.activeTint = UI_COLOR_BUTTON_ON_PRESSED;
    btnYes.ident.btn.textTint   = UI_COLOR_BUTTON_ON_TEXT;
    da_append(&warnChangesMade.buttons, &btnYes);

    UiIdent btnNo;
    btnNo.type = UIID_BUTTON;
    btnNo.ident.btn.fontSize   = 20;
    btnNo.ident.btn.text       = "NO";
    btnNo.ident.btn.idleTint   = UI_COLOR_BUTTON_OFF;
    btnNo.ident.btn.hotTint    = UI_COLOR_BUTTON_OFF_HOVER;
    btnNo.ident.btn.activeTint = UI_COLOR_BUTTON_OFF_PRESSED;
    btnNo.ident.btn.textTint   = UI_COLOR_BUTTON_OFF_TEXT;
    da_append(&warnChangesMade.buttons, &btnNo);

    da_append(&state->ui.windows, &warnChangesMade);
}

bool
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

static void
HandleMouseInputUIWindows(AppState *state)
{
    for(int i = 0; i < state->ui.windows.count; i++) {
        UIWindow *window = &state->ui.windows.elements[i];

        if(window->flags & UIWND_FLAG_IS_VISIBLE) {
            if(window->flags & UIWND_FLAG_SHALL_HIDE) {
                window->flags &= ~UIWND_FLAG_SHALL_HIDE;
                window->flags &= ~UIWND_FLAG_IS_VISIBLE;
                window->flags |= UIWND_FLAG_HID_AWAY;
            } else {
                // Window did not have to hide, so we flag that it didn't
                window->flags &= ~UIWND_FLAG_HID_AWAY;
            }
        }
    }
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

inline bool
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

static inline Vector2
GetMousePositionInRec(Rectangle rec) {
    Vector2 mousePos = GetMousePosition();

    return CLITERAL(Vector2){
        mousePos.x - rec.x,
        mousePos.y - rec.y
    };
}

inline int
GetMetatileIndex(StageMap *map, Tilemap* tilemap, MetatileLayer layer, int x, int y)
{
    ///assert(layer < LAYER_COUNT);

    if(x >= 0 && y >= 0
    && x < map->width && y < map->height) {        
        u16 *mtIndices = tilemap->layers[layer].data;
        return mtIndices[y * map->width + x];
    } else {
        return 0;
    }
}

Vector2i
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
HandleMouseInput(AppState *state, Rectangle recMap)
{
    StageMap *map   = &state->map;
    FileInfo *paths = &state->paths;

    HandleMouseInputUIWindows(state);

    if(!state->uiCtx.hot) {
        if(CheckCollisionPointRec(GetMousePosition(), recMap)) {
            SetMouseCursor(MOUSE_CURSOR_DEFAULT);


            Vector2i mtMouse = GetMetatilePointBelowMouse(map, recMap);

            if(IS_USER_KEY_DOWN_LEFT && !IsMouseOnSpawn(map, &paths->characters)) {
                SetNewMetatiles(state, mtMouse.x, mtMouse.y);
            }

            if(IS_USER_KEY_DOWN_RIGHT) {
                SetMouseCursor(MOUSE_CURSOR_CROSSHAIR);

                if( (map->initialMetatile.x < 0)
                 && (map->initialMetatile.y < 0) ) {
                    map->initialMetatile.x = mtMouse.x;
                    map->initialMetatile.y = mtMouse.y;
                }
            } else if(IS_USER_KEY_RELEASED_RIGHT) {
                if( (map->initialMetatile.x == mtMouse.x)
                 && (map->initialMetatile.y == mtMouse.y) ) {
                    map->selectedMetatile.x = mtMouse.x;
                    map->selectedMetatile.y = mtMouse.y;

                    int mtIndexFront = GetMetatileIndex(&state->map, &state->paths.map, LAYER_FRONT, state->map.selectedMetatile.x, state->map.selectedMetatile.y);
                    int mtIndexBack  = GetMetatileIndex(&state->map, &state->paths.map, LAYER_BACK , state->map.selectedMetatile.x, state->map.selectedMetatile.y);
    
                    state->map.selectedMetatileIndexFront = mtIndexFront;
                    state->map.selectedMetatileIndexBack  = mtIndexBack;
                }
            
                map->initialMetatile.x = -1;
                map->initialMetatile.y = -1;
            }

            if(IS_USER_KEY_DOWN_MIDDLE) {
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
    
    if(IsKeyPressed(KEY_HOME)) {
        MoveCameraToSpawn(state, recMap);
    } else if(IsKeyPressed(KEY_END)) {
        MoveCameraToEnd(state, recMap);
    }

    HandleMouseInputSpawnPos(state);
}

static inline void
MoveCameraToSpawn(AppState *state, Rectangle recMap)
{
    state->map.camera.x = state->map.spawnX - recMap.width/2;
    state->map.camera.y = state->map.spawnY - recMap.height/2;
    state->map.camera.x = CLAMP(state->map.camera.x, 0, (state->map.width  * METATILE_DIM) - recMap.width);
    state->map.camera.y = CLAMP(state->map.camera.y, 0, (state->map.height * METATILE_DIM) - recMap.height);
}

static inline void
MoveCameraToEnd(AppState *state, Rectangle recMap)
{
    state->map.camera.x = state->map.endX - recMap.width/2;
    state->map.camera.y = state->map.endY - recMap.height/2;
    state->map.camera.x = CLAMP(state->map.camera.x, 0, (state->map.width  * METATILE_DIM) - recMap.width);
    state->map.camera.y = CLAMP(state->map.camera.y, 0, (state->map.height * METATILE_DIM) - recMap.height);
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

inline char *allocPath(char *folder, char *fileName)
{
    const char *source      = TextFormat("%s/%s", folder, fileName);
    int allocatedSize = TextLength(source) + 1;
    char *dest        = _Realloc(NULL, allocatedSize);
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
InitFilePaths(FileInfo *outInfo, char *gameDir, char *mapDir)
{
    FileInfo info = {0};

    info.gameRoot = gameDir;
    info.mapRoot  = mapDir;
    
    /* Global C Headers */
    info.game_h          = allocPath(gameDir, "include/game/game.h");
    info.animations_h    = allocPath(gameDir, "include/constants/animations.h");
    info.enemies_h       = allocPath(gameDir, "include/constants/enemies.h");
    info.interactables_h = allocPath(gameDir, "include/constants/interactables.h");
    info.items_h         = allocPath(gameDir, "include/constants/items.h");


    /* Map-specific */

    // Base Paths
    char fgPath[MAX_FILEPATH_LENGTH];
    char bgPath[MAX_FILEPATH_LENGTH];
    TextCopy(fgPath, TextFormat("%s/tilemaps/fg/", mapDir));
    TextCopy(bgPath, TextFormat("%s/tilemaps/bg/", mapDir));

    SetupTilemapPaths(&info.background, bgPath);
    SetupTilemapPaths(&info.map, fgPath);

    // Entity data
    info.entityCSVs.enemies       = allocPath(mapDir, "entities/enemies.csv");
    info.entityCSVs.interactables = allocPath(mapDir, "entities/interactables.csv");
    info.entityCSVs.items         = allocPath(mapDir, "entities/itemboxes.csv");
    info.entityCSVs.rings         = allocPath(mapDir, "entities/rings.csv");


    // Copy local data into output
    if(outInfo) {
        memcpy(outInfo, &info, sizeof(*outInfo));
    }
}


Texture2D
CreateMetatileAtlas(AppState *state, int numMetatiles)
{
    // NOTE: Max capacity is 32*32 (= 1024)
    //assert (numMetatiles < (ATLAS_WIDTH*ATLAS_HEIGHT) );

    FileInfo *paths = &state->paths;
    
    Image atlas     = {0};
    atlas.width     = ATLAS_WIDTH  * paths->map.xTiles * TILE_DIM;
    atlas.height    = ATLAS_HEIGHT * paths->map.yTiles * TILE_DIM;
    atlas.format    = PIXELFORMAT_UNCOMPRESSED_R8G8B8A8;
    atlas.mipmaps   = 1;
    atlas.data      = calloc(atlas.width * atlas.height * sizeof(Color), 1);
    
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
