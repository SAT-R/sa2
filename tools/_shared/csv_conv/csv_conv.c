#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>
#include "../arena_alloc/arena_alloc.h"
#include "../c_header_parser/c_header_parser.h"

#include "csv_conv.h"

/* CSV Format Example:
Adv2,ENEMIES,25,10,,,,,
20,0,10,5,KIKI,0,0,0,0

>> region_x,region_y,me->x,me->y,me->kind,me->data[0],me->data[1],me->data[2],me->data[3](,me->data[4] in SA3)
*/

#define EPOS_DEBUG 0

typedef struct {
    unsigned char *data;
    long size;
} File;

typedef struct {
    int width;
    int height;
    unsigned int pos_offsets[1]; // size: .width * .height
} EntitiesHeader;

typedef struct {
    char *name;
    int id;
} EntityName;

typedef struct {
    EntityName *list;
    int capacity;
    int count;
} EntityNameList;

EntityNameList sEntNameLists[EntCount] = {0};

typedef struct {
    char **list;
    int capacity;
    int count;
} CsvLines;

#define da_elem_size(arr)  sizeof(*(arr)->list)
#define DA_DEFAULT_CAPACITY 128
#define da_append(arr, entry)                                                               \
{                                                                                           \
    if((arr)->capacity == 0) {                                                              \
        (arr)->list = calloc(da_elem_size(arr) * DA_DEFAULT_CAPACITY, 1);                   \
        (arr)->capacity = DA_DEFAULT_CAPACITY;                                              \
    } else if( ((arr)->count + 1) >= (arr)->capacity) {                                     \
        (arr)->list = realloc((arr)->list, da_elem_size(arr) * (2 * (arr)->capacity));      \
        (arr)->capacity *= 2;                                                               \
    }                                                                                       \
                                                                                            \
    (arr)->list[(arr)->count++] = entry;                                                    \
}

const char *sMapEntityKinds[EntCount] = {
    "INTERACTABLES",
    "ITEMS",
    "ENEMIES",
    "RINGS",
};

const char *sETypeIdents[EntCount] = {
    [EntInteractable] = "IA__",
    [EntItem]         = "ITEM__",
    [EntEnemy]        = "ENEMY__",
    [EntRing]         = "",
};

static void PrintCsvFirstLineCommas(FILE *csv_handle, GameId game, CsvEntityType etype);
static void PrintCsvDataLine(FILE *csv_handle, EntityNameList name_list, void *in_data, int region_x, int region_y, GameId game, CsvEntityType etype);

static File OpenWholeFile(char* path)
{
    File file = {0};
    FILE *f = fopen(path, "rb+");

    if(f) {
        fseek(f, 0, SEEK_END);

        file.size = ftell(f);
        rewind(f);

        file.data = malloc(file.size);
        if(file.data) {
            size_t bytes_read = fread(file.data, 1, file.size, f);

            if((long)bytes_read != (long)file.size) {
                fprintf(stderr,
                    "ERROR reading '%s':\n"
                    "Bytes expected: %zu\n"
                    "Bytes read:     %zu\n",
                    path, (size_t)file.size, bytes_read);
            }
        }

        fclose(f);
    } else {
        fprintf(stderr, "ERROR: Couldn't open '%s'\n", path);
    }

    return file;
}

static CsvLines GetCsvLines(char *csv_file_data, long file_size)
{
    CsvLines lines = {0};

    if(file_size > 0) {
        char *line = strtok((char*)csv_file_data, "\n");

        while(line) {
            da_append(&lines, line);
            line = strtok(NULL, "\n");
        }
    }

    return lines;
}

static CsvEntityType GetEntityTypeFromToken(char *token)
{
    CsvEntityType result = EntUnknown;

    for(int i = 0; i < EntCount; i++)
    {
        int len = strlen(token);
        if(len > 0 && !strcmp(token, sMapEntityKinds[i])) {
            result = (CsvEntityType)i;
        }
    }

    return result;
}

static inline int GetMapEntitySize(GameId game, CsvEntityType etype)
{
    int size;

    switch(etype)
    {
        case EntInteractable:
        case EntEnemy:
            // x, y, index, data[4|5]
            size = 3 + ((game == SA3) ? 5 : 4);
            break;
            
        case EntItem:
            // x, y, index
            size = 3;
            break;
            
        case EntRing:
            // x, y
            size = 2;
            break;

        default:
            size = 0;
    }

    return size;
}

static char *GetEntityName(EntityNameList name_list, int entity_id)
{
    for(int i = 0; i < name_list.count; i++)
    {
        if(name_list.list[i].id == entity_id)
            return name_list.list[i].name;
    }

    return NULL;
}

static inline bool IsDigit(char c)
{
    return ((c >= '0') && (c <= '9'));
}

static int GetEntityId(EntityNameList name_list, char *name)
{
    if(IsDigit(name[0])) {
        return atoi(name);
    } else {
        for(int i = 0; i < name_list.count; i++)
        {
            if(!strcmp(name_list.list[i].name, name))
                return name_list.list[i].id;
        }

        return -1;
    }
}

static EntityNameList CreateEntityNameList(TokenList tokens, CsvEntityType etype)
{
    EntityNameList list = {0};

    // Rings don't have a type
    if(etype != EntRing) {
        int etypeIdentLength = strlen(sETypeIdents[etype]);

        for(int i = 0; i < tokens.count; i++)
        {
            if(i + 2 < tokens.count
            && tokens.tokens[i+0].type == POUND_DEFINE
            && tokens.tokens[i+1].type == IDENTIFIER
            && tokens.tokens[i+2].type == VALUE)
            {
                Token *tok_ident = &tokens.tokens[i+1];
                Token *tok_value = &tokens.tokens[i+2];

                // Make sure the identifier matches the Entity Type
                if(!strncmp(tokens.tokens[i+1].text, sETypeIdents[etype], etypeIdentLength))
                {
                    char *entity_name = tok_ident->text + etypeIdentLength;
                    EntityName entry = {entity_name, atoi(tok_value->text)};
                    da_append(&list, entry);
                }
            }
        }
    }

#if EPOS_DEBUG
    printf("List| Cap:%d Cnt:%d\n", list.capacity, list.count);

    for(int j = 0; j < list.count; j++)
    {
        printf("  %d: %s\n", list.list[j].id, list.list[j].name);
    }
#endif

    return list;
}

static void DeleteEntityNameList(EntityNameList enl)
{
    if(enl.list) {
        free(enl.list);
        enl.list = NULL;
    }

    enl.count = 0;
    enl.capacity = 0;
}

static int GetExpectedCsvDataLineCommaCount(GameId game_id, CsvEntityType etype)
{
    int expected = 0;

    switch(etype)
    {
    case EntInteractable:
    case EntEnemy: {
        expected = 8 + ((game_id == SA3) ? 1 : 0);
    } break;

    case EntItem: {
        expected = 4;
    } break;

    case EntRing: {
        expected = 3;
    } break;
        
    default: {
        // return 0
    } break;
    }

    return expected;
}

static int count_commas(char *str)
{
    int len = strlen(str);

    int count = 0;

    for(int i = 0; i < len; i++) {
        if(str[i] == ',')
            count++;
    }

    return count;
}

// NOTE:
// Make sure to call FillMapRegions() before calling this!
static void CreateMapEntityBinaryFile(char *bin_path, GameId game_id, CsvEntityType etype, MapRegion *regions, int map_regions_x, int map_regions_y)
{
    int region_count = map_regions_x * map_regions_y;

    MemArena arena_bin;
    memArenaInit(&arena_bin);
    
    u32 *bin_size = memArenaAddU32(&arena_bin, 0); // this gets set at the end
    int bin_header_offset = arena_bin.offset;
    memArenaAddU32(&arena_bin, map_regions_x);
    memArenaAddU32(&arena_bin, map_regions_y);
    u32 *bin_regions = memArenaReserve(&arena_bin, region_count * sizeof(u32), FALSE);

    const void *file_data = (const void*)bin_size;
    
    int me_size = GetMapEntitySize(game_id, etype);

    for(int r = 0; r < region_count; r++)
    {
        MapRegion *region = &regions[r];

        if(region->count > 0) {
            // Place the region's data offset
            bin_regions[r] = arena_bin.offset - bin_header_offset;

            // Add region's data
            for(int rc = 0; rc < region->count; rc++) {
                EntityData *src_ent = &region->list[rc];
                memArenaAddMemory(&arena_bin, src_ent, me_size);
            }

            // Place byte signifying data's end
            memArenaAddU8(&arena_bin, 0xFF);
        }
    }

    *bin_size = (arena_bin.offset << 8);

    FILE *bin_handle = fopen(bin_path, "wb+");
    if(bin_handle) {
        fwrite(file_data, 1, arena_bin.offset, bin_handle);
        fclose(bin_handle);
    } else {
        fprintf(stderr, "ERROR: Could not create file '%s'\n", bin_path);
    }
}

void FillMapRegions(char *target_name, CsvLines lines, EntityNameList name_list, MapRegion *regions, GameId game_id, CsvEntityType etype, int map_regions_x, int map_regions_y)
{
    int expected_comma_count = GetExpectedCsvDataLineCommaCount(game_id, etype);

#if EPOS_DEBUG
    printf("Got %d lines\n", lines.count);
#endif

    // Line 0 is the header, so we start at line_i = 1
    for(int line_i = 1; line_i < lines.count; line_i++) {
        char *line = lines.list[line_i];

        int num_commas = count_commas(line);
        
        if(num_commas == 0)
            continue;


        if(num_commas != expected_comma_count) {
            fprintf(stderr, "ERROR: CSV line %d has %d commas, expected %d.\n", line_i+1, num_commas, expected_comma_count);
            return;
        }
        
        unsigned int region_x = atoi(strtok(lines.list[line_i], ","));
        unsigned int region_y = atoi(strtok(NULL, ","));
        unsigned int inner_x  = atoi(strtok(NULL, ","));
        unsigned int inner_y  = atoi(strtok(NULL, ","));

        if(region_x >= (unsigned)map_regions_x) {
            fprintf(stderr, "ERROR: region_x in line %d is %d, must be less than map-width %d\n", line_i+1, region_x, map_regions_x);
            return;
        } else if(region_y >= (unsigned)map_regions_y) {
            fprintf(stderr, "ERROR: region_y in line %d is %d, must be less than map-height %d\n", line_i+1, region_y, map_regions_y);
            return;
        } else if(inner_x > 255) {
            fprintf(stderr, "ERROR: inner_x of CSV line %d is %d, must be less than 256\n", line_i+1, inner_x);
            return;
        } else if(inner_y > 255) {
            fprintf(stderr, "ERROR: inner_y of CSV line %d is %d, must be less than 256\n", line_i+1, inner_y);
            return;
        }
        
        EntityData me = {0};

        switch(etype)
        {
        case EntInteractable:
        case EntEnemy: {
            me.x = inner_x;
            me.y = inner_y;

            char *ent_type_str = strtok(NULL, ",");
            int ent_id = GetEntityId(name_list, ent_type_str);
            if(ent_id >= 0) {
                me.kind = ent_id;

                int data_size = GetMapEntitySize(game_id, etype) - 3;
                for(int d = 0; d < data_size; d++)
                {
                    char *data_str = strtok(NULL, ",");
                    me.data[d] = atoi(data_str);
                }
            } else {
                fprintf(stderr, "ERROR: Unknown entity name '%s' in source when trying to create\n"
                                "       '%s'\n", ent_type_str, target_name);
                exit(-22);
            }
        } break;

        case EntItem: {
            me.x = inner_x;
            me.y = inner_y;
            
            char *ent_type_str = strtok(NULL, ",");
            int ent_id = GetEntityId(name_list, ent_type_str);

            if(ent_id < 0) {
                fprintf(stderr, "ERROR: Invalid entity ID in CSV line %d: %d\n", line_i+1, ent_id);
                exit(-23);
            }
            me.kind = ent_id;
        } break;

        case EntRing: {
            me.x = inner_x;
            me.y = inner_y;
        } break;

        default: {
            // Shouldn't happen...
        } break;
        }
        
        int region_i = region_y * map_regions_x + region_x;

        da_append(&regions[region_i], me);
    }

#if EPOS_DEBUG
    printf("Regions (%d):\n", regions->count);
    for(int r = 0; r < map_regions_x * map_regions_y; r++)
    {
        MapRegion *region = &regions[r];

        if(region->count > 0) {

            printf("r%d:\n", r);

            for(int ent = 0; ent < region->count; ent++)
            {
                EntityData *me = &region->list[ent];
                printf("    %d: %d %d %d\n", ent, me->x, me->y, me->kind);
            }
        }
    }
#endif
}

static CsvLines RemoveAllBackslashRs(CsvLines lines)
{
    for(int i = 0; i < lines.count; i++)
    {
        char *line   = lines.list[i];
        int line_len = strlen(line);

        if(line_len > 0) {
            if( line[line_len-1] == '\r') {
                line[line_len-1] = '\0';
            }
        }
    }

    return lines;
}

MapRegions CsvToBinaryData(char *csv_file_data, long csv_file_size, char *bin_path, TokenList tokens, bool outputBinaryFile)
{
    MapRegions mapRegions = {0};
    
    if(csv_file_data == NULL) {
        fprintf(stderr, "ERROR(%s,%d): csv_file_data is nullptr\n", __FILE__, __LINE__);
        return mapRegions;
    }
    
    if(csv_file_size == 0) {
        fprintf(stderr, "ERROR(%s,%d): csv_file_size is 0\n", __FILE__, __LINE__);
        return mapRegions;
    }

    CsvLines lines = GetCsvLines(csv_file_data, csv_file_size);
    lines = RemoveAllBackslashRs(lines);

    if(lines.list == NULL) {
        fprintf(stderr, "ERROR(%s,%d): lines.list is NULL", __FILE__, __LINE__);
        return mapRegions;
    }

    char *header = lines.list[0];

    char *ident = strtok(header, ",");
    if((strlen(ident) == 4) && !strncmp(ident, "Adv", 3)) {
        GameId game_id = ident[3] - '0';

        if(game_id >= SA1 && game_id <= SA3) {
            char *etype_str         = strtok(NULL, ",");
            char *map_regions_x_str = strtok(NULL, ",");
            char *map_regions_y_str = strtok(NULL, ",");

            CsvEntityType etype = GetEntityTypeFromToken(etype_str);

            if(etype != EntUnknown) {
                int map_regions_x = atoi(map_regions_x_str);
                int map_regions_y = atoi(map_regions_y_str);
                int num_regions = map_regions_x * map_regions_y;

                if(map_regions_x > 0 && map_regions_y > 0) {
                    mapRegions.regions = calloc(num_regions, sizeof(MapRegion));

                    if(mapRegions.regions) {
                        mapRegions.map_regions_x = map_regions_x;
                        mapRegions.map_regions_y = map_regions_y;
                    
                        EntityNameList enl = CreateEntityNameList(tokens, etype);

                        FillMapRegions(bin_path, lines, enl, mapRegions.regions, game_id, etype, map_regions_x, map_regions_y);

                        if(outputBinaryFile) {
                            CreateMapEntityBinaryFile(bin_path, game_id, etype, mapRegions.regions, map_regions_x, map_regions_y);
                        }

                        DeleteEntityNameList(enl);
                    } else {
                        fprintf(stderr, "ERROR: Allocating %zu bytes failed.\n", (num_regions * sizeof(MapRegion)));
                    }
                } else if(map_regions_x == 0) {
                    fprintf(stderr, "ERROR: Number of X map regions is 0\n");
                } else {
                    fprintf(stderr, "ERROR: Number of Y map regions is 0\n");
                }
            } else {
                fprintf(stderr, "ERROR: Unknown CsvEntityType '%s'\n", etype_str);
            }
        } else {
            fprintf(stderr, "ERROR: Unknown game identifier '%s'\n", ident);
        }
    } else {
        fprintf(stderr, "ERROR: Unknown game identifier '%s'\n", ident);
    }

    return mapRegions;
}

MapRegions ConvertCsvToBinary(char* csv_path, char *bin_path, char *c_header_path, bool outputBinaryFile)
{
    MapRegions mapRegions = {0};
    File file = OpenWholeFile(csv_path);


    if(file.data) {
        TokenList tokens = {0};
        MemArena  arena;
        memArenaInit(&arena);
        
        if(c_header_path != NULL) {
            tokens = tokenize(&arena, c_header_path);
        }

        mapRegions = CsvToBinaryData((char*)file.data, file.size, bin_path, tokens, outputBinaryFile);
    } else {
        fprintf(stderr, "ERROR: Couldn't create binary file because '%s' doesn't exist\n", csv_path);
    }

    return mapRegions;
}

void ConvertMapRegionsToCsv(MapRegions regions, char *csv_path, char *c_header_path, GameId game, CsvEntityType etype)
{
    int regions_x = regions.map_regions_x;
    int regions_y = regions.map_regions_y;

    FILE *csv_handle = fopen(csv_path, "wb");
    if(!csv_handle) {
        fprintf(stderr, "ERROR: %s could not be created.\n", csv_path);
        return;
    }

    // Ident-line
    fprintf(csv_handle, "Adv%d,%s,%d,%d", game, sMapEntityKinds[etype], regions_x, regions_y);
    PrintCsvFirstLineCommas(csv_handle, game, etype);
    fprintf(csv_handle, "\n");
    
    int meSize = GetMapEntitySize(game, etype);
    
    TokenList tokens = {0};
    MemArena  arena = {0};
    memArenaInit(&arena);
        
    if(c_header_path != NULL) {
        tokens = tokenize(&arena, c_header_path);
    }

    EntityNameList enl = CreateEntityNameList(tokens, etype);

    // Print data lines
    for(int ry = 0; ry < regions_y; ry++) {
        for(int rx = 0; rx < regions_x; rx++) {
            MapRegion *region = &regions.regions[ry * regions_x + rx];
            if(region) {
                int entityCount = region->count;
                for(int ei = 0; ei < entityCount; ei++) {
                    PrintCsvDataLine(csv_handle, enl, &region->list[ei], rx, ry, game, etype);
                }
            }
        }
    }

    memArenaFree(&arena);

    fclose(csv_handle);
}

static void PrintCsvFirstLineCommas(FILE *csv_handle, GameId game, CsvEntityType etype)
{
    int num_commas = 0;
    int meSize = GetMapEntitySize(game, etype);

    if(meSize != 0) {
        num_commas = meSize-2;
    }

    for(int i = 0; i < num_commas; i++)
    {
        fprintf(csv_handle, ",");
    }
}

static void PrintCsvDataLine(FILE *csv_handle, EntityNameList name_list, void *in_data, int region_x, int region_y, GameId game, CsvEntityType etype)
{
    EntityData *data = (EntityData *)in_data;

    // Output coordinates (used by every entity type)
    fprintf(csv_handle, "%d,%d,%d,%d", region_x, region_y, data->x, data->y);

    switch(etype) {
    case EntItem: {
        char *item_kind = GetEntityName(name_list, data->kind);

        fprintf(csv_handle, ",%s", item_kind);
    } break;
        
    case EntInteractable:
    case EntEnemy: {
        char *entity_kind = GetEntityName(name_list, data->kind);

        fprintf(csv_handle, ",%s,%d,%d,%d,%d", entity_kind, data->data[0], data->data[1], data->data[2], data->data[3]);

        if(game == SA3)
            fprintf(csv_handle, ",%d", data->data[4]);
    } break;

    case EntRing: {
        // Only stores coordinates
    } break;
        
    default: {
        fprintf(stderr, "ERROR: etype is %d in %s. This should not happen.", etype, __FUNCTION__);
        exit(-10);
    } break;
    }

    fprintf(csv_handle, "\n");
}

static void OutputCsvFile(char *csv_path, EntityNameList name_list, EntitiesHeader *eh, GameId game, CsvEntityType etype)
{
    FILE *csv_handle = fopen(csv_path, "wb");
    if(!csv_handle) {
        fprintf(stderr, "ERROR: %s could not be created.\n", csv_path);
        return;
    }

    // Ident-line
    fprintf(csv_handle, "Adv%d,%s,%d,%d", game, sMapEntityKinds[etype], eh->width, eh->height);
    PrintCsvFirstLineCommas(csv_handle, game, etype);
    fprintf(csv_handle, "\n");
    
    int meSize = GetMapEntitySize(game, etype);

    // Print data lines
    for(int y = 0; y < eh->height; y++)
    {
        for(int x = 0; x < eh->width; x++)
        {
            unsigned int offset = eh->pos_offsets[y*eh->width + x];

            if(offset)
            {
                u8 *data = &((u8*)eh)[offset];
                
                while(*data != 0xFF) {
                    PrintCsvDataLine(csv_handle, name_list, data, x, y, game, etype);
                    
                    data += meSize;
                }
            }
        }
    }

    fclose(csv_handle);
}

void ConvertBinaryToCsv(char* bin_path, char *csv_path, char *c_header_path, GameId game, CsvEntityType etype)
{
    File file = OpenWholeFile(bin_path);

    if(file.data && (file.size > 4)) {
        int uncomp_size = *((u32*)file.data) >> 8;

        if(uncomp_size == file.size)
        {
            EntitiesHeader *eh = (void*) &file.data[4];
            int num_regions = eh->width * eh->height;
            if(num_regions > 0
            && (int)(num_regions * sizeof(int)) < uncomp_size)
            {
                MemArena arena;
                memArenaInit(&arena);
                TokenList tokens = tokenize(&arena, c_header_path);

                EntityNameList enl = CreateEntityNameList(tokens, etype);

                OutputCsvFile(csv_path, enl, eh, game, etype);
            }
            else
            {
                fprintf(stderr,
                    "ERROR: Data dimensions too high\n"
                    "%d*%d*4 > 0x%X\n",
                    eh->width, eh->height, uncomp_size);
            }
        }
        else
        {
            fprintf(stderr,
                "File size does not match internal size.\n"
                "Expected: %d\n"
                "Is:       %d\n",
                uncomp_size, (int)file.size);
        }
    } else {
        fprintf(stderr, "ERROR: Couldn't create CSV file because '%s' doesn't exist \n"
                        "       or doesn't contain the correct data\n", bin_path);
    }
}
