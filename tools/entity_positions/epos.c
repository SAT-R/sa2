#include <malloc.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "ext/c_header_parser/ArenaAlloc.h"
#include "ext/c_header_parser/parser.h"

/* CSV Format Example:
Adv2,ENEMIES,25,10,,,,,
20,0,10,5,KIKI,0,0,0,0

*/

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
    Interactable = 0,
    Item         = 1,
    Enemy        = 2,
    Ring         = 3,
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

#define da_elem_size(arr)  sizeof(*(arr)->list)
#define DA_DEFAULT_CAPACITY 128
#define da_append(arr, entry)                                                               \
{                                                                                           \
    if((arr)->capacity == 0) {                                                              \
        (arr)->list = malloc(da_elem_size(arr) * DA_DEFAULT_CAPACITY);                      \
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
    [Interactable] = "IA__",
    [Item]         = "ITEM__",
    [Enemy]        = "ENEMY__",
    [Ring]         = "",
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
                    "Bytes expected: %ld\n"
                    "Bytes read: %ld\n",
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

void ConvertCsvToBinary(char* csv_path, char *bin_path, TokenList tokens)
{

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

// Different entity types use more/less data.
// Interactable: x, y, kind, data
// Item:         x, y, kind
// Enemy:        x, y, kind, data
// Ring:         x, y
typedef struct {
    u8 x, y, kind;
    s8 data[5]; // SA1/SA2: [4], SA3: [5]
} EntityData;

inline int GetMapEntitySize(GameId game, EntityType etype)
{
    int size;

    switch(etype)
    {
        case Interactable:
        case Enemy:
            size = 7 + ((game == SA3) ? 1 : 0);
            break;
            
        case Item:
            size = 3;
            break;
            
        case Ring:
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


void PrintCsvDataLine(FILE *csv_handle, EntityNameList name_list, void *in_data, int region_x, int region_y, GameId game, EntityType etype)
{
    EntityData *data = (EntityData *)in_data;

    // Output common values (coordinates)
    fprintf(csv_handle, "%d,%d,%d,%d", region_x, region_y, data->x, data->y);

    switch(etype) {
    case Item: {
        // TODO: Get names from header-file tokens
        char *item_kind = GetEntityName(name_list, data->kind);

        fprintf(csv_handle, ",%s", item_kind);
    } break;
        
    case Interactable:
    case Enemy: {
        char *entity_kind = GetEntityName(name_list, data->kind);

        fprintf(csv_handle, ",%s,%d,%d,%d,%d", entity_kind, data->data[0], data->data[1], data->data[2], data->data[3]);

        if(game == SA3)
            fprintf(csv_handle, ",%d", data->data[4]);
    } break;

    case Ring: {
        // Only stores coordinates
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

EntityNameList CreateEntityNameList(TokenList tokens, EntityType etype)
{
    EntityNameList list = {0};

    // Rings don't have a type
    if(etype != Ring) {
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

    printf("List| Cap:%d Cnt:%d\n", list.capacity, list.count);

    for(int j = 0; j < list.count; j++)
    {
        printf("  %d: %s\n", list.list[j].id, list.list[j].name);
    }

    return list;
}

void ConvertBinaryToCsv(char* bin_path, char *csv_path, TokenList tokens, GameId game, EntityType etype)
{
    File file = OpenWholeFile(bin_path);

    if(file.data) {
        int uncomp_size = *((u32*)file.data) >> 8;

        if(uncomp_size == file.size)
        {
            EntitiesHeader *eh = (void*) &file.data[4];
            int num_regions = eh->width * eh->height;
            if(num_regions > 0
            && num_regions * sizeof(int) < uncomp_size)
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

    MemArena arena;
    memArenaInit(&arena);
    TokenList tokens = {0};

    while(argc > 0) {
        char *arg = GetProgramArg(&argc, &argv);

        if(argc > 0) {
            if(!strcmp(arg, "-header")) {
                char *c_header_path = GetProgramArg(&argc, &argv);
                tokens              = tokenize(&arena, c_header_path);
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
                printf("Unknown parameter '%s'\n", arg);
                return -3;
            }
        } else {
            printf("ERROR: Please add a value for argument '%s'!\n", arg);
            return -2;
        }
    }
    
    if(!strcmp(ext_a, "csv") && !strcmp(ext_b, "bin")) {
        ConvertCsvToBinary(path_a, path_b, tokens);
    } else if(!strcmp(ext_a, "bin") && !strcmp(ext_b, "csv")) {
        // TODO: We need to find out the targeted game and etype through parameters!
        ConvertBinaryToCsv(path_a, path_b, tokens, SA2, entity_type);
    } else {
        // ERROR: Unk ext
        printf("Don't know how to convert from '%s' to '%s'\n", ext_a, ext_b);
        return -1;
    }

    return 0;
}