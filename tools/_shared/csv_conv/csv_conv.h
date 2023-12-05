#ifndef GUARD_LIB_CSV_CONV_H
#define GUARD_LIB_CSV_CONV_H

#include <stdbool.h>

#ifndef TILE_WIDTH
#define TILE_WIDTH       8
#endif

#ifndef CAM_REGION_WIDTH
#define CAM_REGION_WIDTH 256
#endif

#ifndef TO_WORLD_POS
#define TO_WORLD_POS(pos, region)     ((pos)*TILE_WIDTH + (region)*CAM_REGION_WIDTH)
#endif

#ifndef WORLD_TO_REGION
#define WORLD_TO_REGION(worldPos)     ((worldPos) / CAM_REGION_WIDTH)
#endif

#ifndef WORLD_TO_ENTITY_POS
#define WORLD_TO_ENTITY_POS(worldPos) (((worldPos) % CAM_REGION_WIDTH) / TILE_WIDTH)
#endif

typedef enum {
    UNKNOWN_GAME = 0,
    SA1     = 1,
    SA2     = 2,
    SA3     = 3,
} GameId;

typedef enum {
    EntUnknown      = -1,
    EntInteractable = 0,
    EntItem         = 1,
    EntEnemy        = 2,
    EntRing         = 3,

    EntCount
} CsvEntityType;

// Different entity types use more/less data.
// Interactable: x, y, kind, data
// Item:         x, y, kind
// Enemy:        x, y, kind, data
// Ring:         x, y
typedef struct {
    unsigned char x, y, kind;
    signed   char data[5]; // SA1/SA2: [4], SA3: [5]
} EntityData;

typedef EntityData EntityDataInteractable;
typedef EntityData EntityDataEnemy;

typedef struct {
    unsigned char x, y, kind;
} EntityDataItem;

typedef struct {
    unsigned char x, y;
} EntityDataRing;

typedef union {
    EntityDataInteractable *ia;
    EntityDataItem  *item;
    EntityDataEnemy *enemy;
    EntityDataRing  *ring;
    EntityData      *data;
} EntityDataPointer;

typedef struct {
    union {
        EntityData *list;
        EntityDataPointer d;
    };

    int count, capacity;
} MapRegion;

typedef struct {
    MapRegion *regions;
    int map_regions_x, map_regions_y;
} MapRegions;

// Converts the input CSV file into binary data and optionally outputs it as its in-game format
extern MapRegions ConvertCsvToBinary(char* csv_path, char *bin_path, char *c_header_path, bool outputBinaryFile);
extern void ConvertBinaryToCsv(char* bin_path, char *csv_path, char *c_header_path, GameId game, CsvEntityType etype);
extern void ConvertMapRegionsToCsv(MapRegions regions, char *csv_path, char *c_header_path, GameId game, CsvEntityType etype);

extern const char *sMapEntityKinds[4];

#endif // GUARD_LIB_CSV_CONV_H
