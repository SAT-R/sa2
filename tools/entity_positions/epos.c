#ifdef __unix__
#include <malloc.h>
#endif

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "ext/c_header_parser/ArenaAlloc.h"
#include "ext/c_header_parser/parser.h"

/* CSV Format Example:
Adv2,ENEMIES,25,10,,,,,
20,0,10,5,KIKI,0,0,0,0

>> region_x,region_y,me->x,me->y,me->kind,me->data[0],me->data[1],me->data[2],me->data[3](,me->data[4] in SA3)
*/

#define EPOS_DEBUG 0

#define TILE_WIDTH       8
#define CAM_REGION_WIDTH 256

#define TO_WORLD_POS(pos, region) ((pos)*TILE_WIDTH + (region)*CAM_REGION_WIDTH)

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
} EntityType;

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

// Different entity types use more/less data.
// Interactable: x, y, kind, data
// Item:         x, y, kind
// Enemy:        x, y, kind, data
// Ring:         x, y
typedef struct {
    u8 x, y, kind;
    s8 data[5]; // SA1/SA2: [4], SA3: [5]
} EntityData;

typedef struct {
    char **list;
    int capacity;
    int count;
} CsvLines;

typedef struct {
    EntityData *list;
    int capacity, count;
} MapRegion;

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

char *sMapEntityKinds[4] = {
    "INTERACTABLES",
    "ITEMS",
    "ENEMIES",
    "RINGS",
};

char *sETypeIdents[4] = {
    [EntInteractable] = "IA__",
    [EntItem]         = "ITEM__",
    [EntEnemy]        = "ENEMY__",
    [EntRing]         = "",
};

File OpenWholeFile(char* path)
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
                    "Bytes expected: %zd\n"
                    "Bytes read: %zu\n",
                    path, file.size, bytes_read);
            }
        }

        fclose(f);
    } else {
        fprintf(stderr, "ERROR: Couldn't open '%s'\n", path);
    }

    return file;
}

char *GetProgramArg(int *argc, char ***argv)
{
    char *arg;

    assert(*argc > 0);

    arg = *argv[0];

    *argc -= 1;
    *argv += 1;

    return arg;
}

char *GetFileExtension(char* path)
{
    char *ext = strrchr(path, '.');
    if(ext != NULL)
        ext++;

    return ext;
}

CsvLines GetCsvLines(File file)
{
    CsvLines lines = {0};

    char *line = strtok((char*)file.data, "\n");

    while(line) {
        da_append(&lines, line);
        line = strtok(NULL, "\n");
    }

    return lines;
}

EntityType GetEntityTypeFromToken(char *token)
{
    EntityType result = EntUnknown;

    for(int i = 0; i < EntCount; i++)
    {
        int len = strlen(token);
        if(len > 0 && !strcmp(token, sMapEntityKinds[i])) {
            result = (EntityType)i;
        }
    }

    return result;
}

inline int GetMapEntitySize(GameId game, EntityType etype)
{
    int size;

    switch(etype)
    {
        case EntInteractable:
        case EntEnemy:
            size = 7 + ((game == SA3) ? 1 : 0);
            break;
            
        case EntItem:
            size = 3;
            break;
            
        case EntRing:
            size = 2;
            break;

        default:
            size = 0;
    }

    return size;
}

char *GetEntityName(EntityNameList name_list, int entity_id)
{
    for(int i = 0; i < name_list.count; i++)
    {
        if(name_list.list[i].id == entity_id)
            return name_list.list[i].name;
    }

    return NULL;
}

inline bool IsDigit(char c)
{
    return ((c >= '0') && (c <= '9'));
}

int GetEntityId(EntityNameList name_list, char *name)
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

EntityNameList CreateEntityNameList(TokenList tokens, EntityType etype)
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

int GetExpectedCsvDataLineCommaCount(GameId game_id, EntityType etype)
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

int count_commas(char *str)
{
    int len = strlen(str);

    int count = 0;

    for(int i = 0; i < len; i++) {
        if(str[i] == ',')
            count++;
    }

    return count;
}

void CreateMapEntityBinaryFile(char *bin_path, GameId game_id, EntityType etype, MapRegion *regions, int map_width, int map_height)
{
    int region_count = map_width * map_height;

    MemArena arena_bin;
    memArenaInit(&arena_bin);
    
    u32 *bin_size = memArenaAddU32(&arena_bin, 0); // this gets set at the end
    int bin_header_offset = arena_bin.offset;
    memArenaAddU32(&arena_bin, map_width);
    memArenaAddU32(&arena_bin, map_height);
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

void FillMapRegions(char *bin_path, CsvLines lines, EntityNameList name_list, MapRegion *regions, GameId game_id, EntityType etype, int map_width, int map_height)
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

        if(region_x >= (unsigned)map_width) {
            fprintf(stderr, "ERROR: region_x in line %d is %d, must be less than map-width %d\n", line_i+1, region_x, map_width);
            return;
        } else if(region_y >= (unsigned)map_height) {
            fprintf(stderr, "ERROR: region_y in line %d is %d, must be less than map-height %d\n", line_i+1, region_y, map_height);
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
                                "       '%s'\n", ent_type_str, bin_path);
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
        
        int region_i = region_y * map_width + region_x;

        da_append(&regions[region_i], me);
    }
    
    CreateMapEntityBinaryFile(bin_path, game_id, etype, regions, map_width, map_height);

#if EPOS_DEBUG
    printf("Regions (%d):\n", regions->count);
    for(int r = 0; r < map_width * map_height; r++)
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

void HandleCsvToBinaryConversion(CsvLines lines, char *bin_path, TokenList tokens)
{
    char *header = lines.list[0];

    char *ident = strtok(header, ",");
    if(strlen(ident) == 4) {
        GameId game_id = ident[3] - '0';

        if(game_id >= SA1 && game_id <= SA3) {
            char *etype_str      = strtok(NULL, ",");
            char *map_width_str  = strtok(NULL, ",");
            char *map_height_str = strtok(NULL, ",");

            EntityType etype = GetEntityTypeFromToken(etype_str);

            if(etype != EntUnknown) {
                int map_width  = atoi(map_width_str);
                int map_height = atoi(map_height_str);
                int num_regions = map_width * map_height;

                if(map_width > 0 && map_height > 0) {
                    MapRegion *regions = calloc(num_regions, sizeof(MapRegion));
                    
                    EntityNameList enl = CreateEntityNameList(tokens, etype);

                    FillMapRegions(bin_path, lines, enl, regions, game_id, etype, map_width, map_height);
                }
            } else {
                fprintf(stderr, "ERROR: Unknown EntityType '%s'\n", etype_str);
                exit(-20);
            }
        }
    } else {
        fprintf(stderr, "ERROR: Unknown game identifier '%s'\n", ident);
        exit(-21);
    }
}

CsvLines RemoveAllBackslashRs(CsvLines lines)
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

void ConvertCsvToBinary(char* csv_path, char *bin_path, char *c_header_path)
{
    File file = OpenWholeFile(csv_path);

    TokenList tokens = {0};
    MemArena arena;
    memArenaInit(&arena);

    if(c_header_path != NULL)
        tokens = tokenize(&arena, c_header_path);

    if(file.data) {
        CsvLines lines = GetCsvLines(file);
        lines = RemoveAllBackslashRs(lines);
        
        HandleCsvToBinaryConversion(lines, bin_path, tokens);
    } else {
        fprintf(stderr, "ERROR: Couldn't create binary file because '%s' doesn't exist\n", csv_path);
    }
}

void PrintCsvFirstLineCommas(FILE *csv_handle, GameId game, EntityType etype)
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

void PrintCsvDataLine(FILE *csv_handle, EntityNameList name_list, void *in_data, int region_x, int region_y, GameId game, EntityType etype)
{
    EntityData *data = (EntityData *)in_data;

    // Output common values (coordinates)
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

void PrintCsvFile(char *csv_path, EntityNameList name_list, EntitiesHeader *eh, GameId game, EntityType etype)
{
    FILE *csv_handle = fopen(csv_path, "w");
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

void ConvertBinaryToCsv(char* bin_path, char *csv_path, char *c_header_path, GameId game, EntityType etype)
{
    File file = OpenWholeFile(bin_path);

    TokenList tokens = {0};
    MemArena arena;
    memArenaInit(&arena);
    tokens = tokenize(&arena, c_header_path);

    if(file.data) {
        int uncomp_size = *((u32*)file.data) >> 8;

        if(uncomp_size == file.size)
        {
            EntitiesHeader *eh = (void*) &file.data[4];
            int num_regions = eh->width * eh->height;
            if(num_regions > 0
            && (int)(num_regions * sizeof(int)) < uncomp_size)
            {
                EntityNameList enl = CreateEntityNameList(tokens, etype);

                PrintCsvFile(csv_path, enl, eh, game, etype);
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
        fprintf(stderr, "ERROR: Couldn't create CSV file because '%s' doesn't exist\n", bin_path);
    }
}

void PrintUsage(char *exe_path)
{
    fprintf(stderr, "Please provide different in- and output file paths.\n"
           "The filetypes tell me how to convert the data.\n"
           "%s: infile(.bin|.csv) outfile(.csv|.bin) [OPTIONS]\n"
           "\n"
           "OPTIONS:\n"
           "-entities <Map Entity> can be (without '...'):\n"
           "    '%s', '%s', '%s' or '%s'\n"
           "\n"
           "-header <c_header.h> should be a header file containing #defines for\n"
           "the indices of MapEntities to use (not required for %s\n",
           exe_path,
           sMapEntityKinds[0], sMapEntityKinds[1], sMapEntityKinds[2], sMapEntityKinds[3],
           sMapEntityKinds[3]);
}

/*
 1) Binary -> CSV (User needs to pass kind (Interactables, Items, Enemies, Rings)
 2) CSV -> Binary 
*/
int main(int argc, char **argv)
{
    char *exe_path = GetProgramArg(&argc, &argv);

    if (argc < 4) {
        PrintUsage(exe_path);
        return 0;
    }
    
    EntityType entity_type  = (EntityType)-1;

    char *path_a = GetProgramArg(&argc, &argv);
    char *path_b = GetProgramArg(&argc, &argv);
    char *ext_a  = GetFileExtension(path_a);
    char *ext_b  = GetFileExtension(path_b);
    char *c_header_path = NULL;

    MemArena arena;
    memArenaInit(&arena);
    TokenList tokens = {0};

    while(argc > 0) {
        char *arg = GetProgramArg(&argc, &argv);
        
        if(!strcmp(arg, "--help")) {
            PrintUsage(exe_path);
            return -5;
        } else if(argc > 0) {
            if(!strcmp(arg, "-header")) {
                c_header_path = GetProgramArg(&argc, &argv);
            } else if(!strcmp(arg, "-entities")) {
                char *arg_entity = GetProgramArg(&argc, &argv);

                for(int i = 0; i < 4; i++)
                {
                    if(!strcmp(arg_entity, sMapEntityKinds[i]))
                        entity_type = i;
                }

                if(entity_type == -1) {
                    printf("ERROR: Unknown entity type '%s'\n"
                           "Can be: '%s', '%s', '%s' or '%s'\n",
                        arg_entity,
                        sMapEntityKinds[0], sMapEntityKinds[1], sMapEntityKinds[2], sMapEntityKinds[3]);
                    return -4;
                }

            } else {
                printf("Unknown parameter '%s'.\n"
                       "Run with --help for valid parameter list\n", arg);
                return -3;
            }
        } else {
            printf("ERROR: Please add a value for argument '%s'!\n", arg);
            return -2;
        }
    }
    
    if(!strcmp(ext_a, "csv") && !strcmp(ext_b, "bin")) {
        ConvertCsvToBinary(path_a, path_b, c_header_path);
    } else if(!strcmp(ext_a, "bin") && !strcmp(ext_b, "csv")) {
        // TODO: We need to find out the targeted game and etype through parameters!
        ConvertBinaryToCsv(path_a, path_b, c_header_path, SA2, entity_type);
    } else {
        // ERROR: Unk ext
        printf("Don't know how to convert from '%s' to '%s'\n", ext_a, ext_b);
        return -1;
    }

    return 0;
}