#ifndef GUARD_BRIBASA_EX_GLOBAL_H
#define GUARD_BRIBASA_EX_GLOBAL_H

#include "ui.h"

#include "../../_shared/csv_conv/csv_conv.h"


#define TILE_DIM 8
#define TILES_PER_METATILE 12
#define METATILE_DIM (TILES_PER_METATILE*TILE_DIM)
#define NUM_TILES_INSIDE_METATILES (TILES_PER_METATILE*TILES_PER_METATILE)


#define ATLAS_WIDTH   32
#define ATLAS_HEIGHT  32

#define GBA_DISPLAY_WIDTH  240
#define GBA_DISPLAY_HEIGHT 160
#define GBA_DISPLAY_BORDER_COLOR RED

#define UIWND_ID_UNSAVED_CHANGES      0
#define UIWND_ID_ENTITY_DATA          1

#define IS_USER_KEY_DOWN_LEFT       (IsMouseButtonDown(MOUSE_BUTTON_LEFT)   || IsKeyDown(KEY_X))
#define IS_USER_KEY_DOWN_MIDDLE     (IsMouseButtonDown(MOUSE_BUTTON_MIDDLE) || IsKeyDown(KEY_C))
#define IS_USER_KEY_DOWN_RIGHT      (IsMouseButtonDown(MOUSE_BUTTON_RIGHT)  || IsKeyDown(KEY_V))
#define IS_USER_KEY_RELEASED_LEFT   (IsMouseButtonReleased(MOUSE_BUTTON_LEFT)   || IsKeyReleased(KEY_X))
#define IS_USER_KEY_RELEASED_MIDDLE (IsMouseButtonReleased(MOUSE_BUTTON_MIDDLE) || IsKeyReleased(KEY_C))
#define IS_USER_KEY_RELEASED_RIGHT  (IsMouseButtonReleased(MOUSE_BUTTON_RIGHT)  || IsKeyReleased(KEY_V))
#define IS_USER_KEY_PRESSED_LEFT   (IsMouseButtonPressed(MOUSE_BUTTON_LEFT)   || IsKeyPressed(KEY_X))
#define IS_USER_KEY_PRESSED_MIDDLE (IsMouseButtonPressed(MOUSE_BUTTON_MIDDLE) || IsKeyPressed(KEY_C))
#define IS_USER_KEY_PRESSED_RIGHT  (IsMouseButtonPressed(MOUSE_BUTTON_RIGHT)  || IsKeyPressed(KEY_V))

#define IS_MOUSE_ON_RECT(_rectangle) (CheckCollisionPointRec(GetMousePosition(), (_rectangle)))

// TEMP

#define MEASURE_MALLOC 0
#if MEASURE_MALLOC
extern void *_Realloc(void *block, size_t size);
extern void *_Memcpy(void *dst, void *src, size_t size);
#else
#define _Realloc realloc
#define _Memcpy memcpy
#endif

// Adds an element to any dynamic array (with "capacity", "count" and "SomeType *elements").
// Please make sure to initialize your list to all-zeroes before calling this macro.
#define DA_DEFAULT_CAP 256
#define da_append_to(list, new_element_ptr, _arrayName)                                                      \
{                                                                                                            \
    while((list)->count + 1 > (list)->capacity) {                                                            \
        (list)->capacity += DA_DEFAULT_CAP;                                                                  \
        (list)->_arrayName = _Realloc((list)->_arrayName, (list)->capacity * sizeof((list)->_arrayName[0])); \
    }                                                                                                        \
                                                                                                             \
    _Memcpy(&(list)->_arrayName[(list)->count++], new_element_ptr, sizeof(*new_element_ptr));                \
}
#define da_append(list, new_element_ptr)                                                                    \
{                                                                                                           \
    da_append_to(list, new_element_ptr, elements);                                                          \
}

#define MIN(a, b) ( ((a) < (b)) ? (a) : (b) )
#define MAX(a, b) ( ((a) > (b)) ? (a) : (b) )
#define CLAMP(value, min, max) (MIN(MAX(value, min), max))

#define ENT_DATA_SIZE(_game) (((_game) == GAME_SA3) ? 5 : 4)

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
    //UIWND_TYPE_OK           = 1,
    UIWND_TYPE_YESNO        = 2,
    UIWND_TYPE_ENTITY_INFO  = 3,
} UIWindowType;

typedef enum {
    UIWND_RESULT_NO             = -1,
    UIWND_RESULT_DEFAULT        = 0,
    UIWND_RESULT_CLOSE_BUTTON   = UIWND_RESULT_DEFAULT,
    UIWND_RESULT_YES            = 1,
} UIWindowResult;

typedef struct {
    int x;
    int y;
} Vector2i;

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
    int count, capacity;
} TextureList;

typedef struct {
    char *interactables;
    char *items;
    char *enemies;
    char *rings;
} EntityCSVs;

typedef struct EditorEntity {
    EntityType etype;
    unsigned char kind;
    char data[5]; // Size in SA1/SA2: 4, SA3: 5

    unsigned int worldX, worldY;
    UiIdentEntity ui;
} EditorEntity;

typedef struct EditorEntities {
    EditorEntity *elements;
    int count, capacity;

    EditorEntity *active;

    // Cached entity
    Vector2i numRegions[ENTITY_TYPE_COUNT];
} EditorEntities;

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
    int count, capacity;
} EntityMetaList;

typedef struct {
    InteractableMeta *elements;
    int count, capacity;
} InteractableMetaList;

typedef struct {
    Texture txItembox;
    TextureList oneUpIcons;
    EntityMetaList items;
    unsigned short animItembox;
    unsigned short animItemType;
} ItemMetaList;



typedef struct {
    // Root directory of one of the SAT-R decomp projects
    // or a project based on them.
    // 
    // (Contains "data/", "graphics/", "src/", etc.)
    char *gameRoot;

    // e.g. ./data/maps/zone_1/act_1/
    char *mapRoot;
    
    /* C-Header paths containing constants */
    char *animations_h;
    char *characters_h;
    char *enemies_h;
    char *interactables_h;
    char *items_h;

    /* TODO: All data below this shall be removed from the struct */
    Tilemap map;
    Tilemap background;
    EntityCSVs entityCSVs;
    
    EntityMetaList enemies;
    InteractableMetaList interactables;
    ItemMetaList items;
    EntityMeta ring;

    // "SONIC", "TAILS", ...
    CharacterList characters;
} FileInfo;


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
    unsigned short endX, endY;

    MapFlags flags;
    
    MapCamera camera;

    // Position of Metatile on first mouse-down
    Vector2i initialMetatile;

    // Position of Metatile that is selected
    Vector2i selectedMetatile;
    short selectedMetatileIndexFront;
    short selectedMetatileIndexBack;
    
    // Positions and data of all entities
    EditorEntities entities;
} StageMap;

typedef struct {
    int x, y;
    int width, height;
    UIWindowFlag flags;
    UIWindowType type;
    UIWindowResult lastResult;
    UiIdent header;
    UiIdent recMain;
    UiIdentList buttons;
} UIWindow;

typedef struct {
    int count, capacity;
    UIWindow *elements;
} UIWindowList;

typedef struct {
    // TODO: Only reference this Rectangle for the header
    Rectangle rec;

    UiIdent btnFrontLayer;
    UiIdent btnBackLayer;
    UiIdent btnPreview;
    UiIdent btnSaveMap;

    UiIdent btnEntityMinus;
    UiIdent btnEntityPlus;
    UiIdent btnsDataMinus[ENT_DATA_SIZE(SA3)];
    UiIdent btnsDataPlus [ENT_DATA_SIZE(SA3)];
} UiHeader;

typedef struct {
    UIWindowList windows;

    Rectangle recHeader;
    Rectangle recMap;

    // FALSE (split): Display preview metatile's layers separately
    // TRUE (merged): Display preview metatile's layers ontop of eachother
    bool isMtPreviewMerged;
} Ui;

typedef struct {
    int windowWidth;
    int windowHeight;
    bool ignoreUnsavedChanges;
    bool unsavedChangesExist;

    Game game;

    FileInfo paths;

    StageMap map;

    Ui ui; // TODO: Remove
    
    UiContext uiCtx;
    UiHeader uiHeader;
} AppState;

#endif // GUARD_BRIBASA_EX_GLOBAL_H
